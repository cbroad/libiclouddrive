#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <objc/runtime.h>

#include <concepts>
#include <exception>
#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#include <sstream>

#include <napi.h>

#include "./Debug.h"

#include "./HelperFunctions.h"

using namespace LibICloudDrive;

NSURL* LibICloudDrive::NSStringToNSURL(NSString* str) {
    // std::cout << "NSStringToNSURL: str="  << str.UTF8String << std::endl;
    return [NSURL fileURLWithPath: str ];
}


NSString* LibICloudDrive::stringToNSString(std::string* str) {
    // std::cout << "stringToNSString: str=" << str->c_str() << std::endl;
    return [ NSString stringWithCString: str->c_str() encoding: NSUTF8StringEncoding ];
}

NSURL* LibICloudDrive::stringToNSURL(std::string* str) {
    // std::cout << "stringToNSURL: str=" << str->c_str() << std::endl;
    return NSStringToNSURL( stringToNSString( str ) );
}


@interface ObjectProfiler : NSObject
+ (void) Log: (id) obj;
+ (NSDictionary*) propertiesOfObject: (NSObject*) obj;
@end

@implementation ObjectProfiler

+ (void) Log: (id) obj {
    NSLog( @"%@", obj );
}

+ (NSDictionary*) propertiesOfObject: (NSObject*) obj {
    unsigned int count;
    objc_property_t* props = class_copyPropertyList( [obj class], &count);

    // if( Debug::Logging ) { NSLog(@"obj=%@", obj); }
    id keys[count];
    id values[count];
    for( unsigned int i=0 ; i<count ; i++ ) {
        keys[i] = [ [NSString alloc] initWithCString: property_getName(props[i]) encoding: NSUTF8StringEncoding ];
        values[i] = [obj valueForKey: keys[i] ];
        // if( Debug::Logging ) { NSLog(@"%@=%@", keys[i], values[i]); }
    }
    return [ NSDictionary dictionaryWithObjects: values forKeys: keys count: count ];
}

@end


Napi::Boolean LibICloudDrive::NSObjectToNapiValue(Napi::Env env, bool b) {
    return Napi::Boolean::New( env, b!=false );
}

// Napi::Boolean NSObjectToNapiValue(Napi::Env env, BOOL b) {
//     return NSObjectToNapiValue(env, b==YES);
// }

Napi::Value LibICloudDrive::NSObjectToNapiValue(Napi::Env env, NSObject* obj) {
    // if( Debug::Logging ) { NSLog( @"NSObjectToNapiValue(); obj=%@", obj ); }
    
    // if( obj == NULL ) {
    //     return env.Undefined();
    // }
    // if( obj == nil ) {
    //     return env.Null();
    // }

    if( obj==NULL || obj==nil ) {
        return env.Null();
    }

    if( [obj isKindOfClass: [NSNumber class] ] ) {
        return Napi::Value::From( env, [ (NSNumber*) obj doubleValue ] );
        // return Napi::Number::New( env, [ (NSNumber*) obj doubleValue ] );
    }
    if( [ obj isKindOfClass: [NSString class] ] ) {
        return Napi::Value::From( env, [ (NSString*) obj UTF8String ]);
    }
    if( [obj isKindOfClass: [NSDate class] ] ) {
        return Napi::Date::New( env, 1000*[ (NSDate*) obj timeIntervalSince1970 ] );
    }
    if( [obj isKindOfClass: [NSArray class] ] ) {
        Napi::Array result = Napi::Array::New( env, [ (NSArray*) obj count ] );
        unsigned int i = 0;
        NSArray* arr = (NSArray*) obj;
        for( NSObject* o in arr ) {
            result[i++] = NSObjectToNapiValue( env, o );
        }
        return result;
    }
    if( [obj isKindOfClass: [NSDictionary class] ] ) {
        Napi::Object result = Napi::Object::New( env );
        NSDictionary* dict = (NSDictionary*) obj;
        for( NSString* nsKey in dict ) {
            Napi::String napiKey = Napi::String::New( env, nsKey.UTF8String );
            Napi::Value napiVal = NSObjectToNapiValue( env, [ dict objectForKey: nsKey ] );
            result.Set( napiKey, napiVal );
        }
        return result;
    }
    else { // If not an easy copy
        // if( Debug::Logging ) { NSLog( @"%@", obj); }
        NSDictionary* props = [ ObjectProfiler propertiesOfObject: obj ];
        return NSObjectToNapiValue(env, props);
    }

    return env.Undefined();
}

std::string LibICloudDrive::NapiValueToJsonString( Napi::Env env, Napi::Value val) {
    Napi::Object json = env.Global().Get("JSON").As<Napi::Object>();
    return json.Get("stringify")
        .As<Napi::Function>().Call( json, { val } )
        .As<Napi::String>().Utf8Value();
}

bool GetBooleanFromParameter( const Napi::CallbackInfo& info, int idx, const char* propertyName, bool def ) {
    Napi::Env env = info.Env();
    if( info.Length()>(unsigned int)idx ) {
        Napi::Value asyncVal = info[idx];
        if(asyncVal == env.Undefined() || asyncVal == env.Null() ) {
            return false;
        }
        if( asyncVal.IsBoolean() ) {
            return asyncVal.As<Napi::Boolean>().Value();
        }
        if( asyncVal.IsNumber() ) {
            return asyncVal.As<Napi::Number>().DoubleValue()!=0.0;
        }
        if( asyncVal.IsObject() ) {
            if(propertyName!=NULL) {
                Napi::Object obj = asyncVal.As<Napi::Object>();
                asyncVal = obj.Get( Napi::String::New( env, propertyName ) );
                if(asyncVal == env.Undefined() || asyncVal == env.Null() ) {
                    return false;
                }
                if( asyncVal.IsBoolean() ) {
                    return asyncVal.As<Napi::Boolean>().Value();
                }
                if( asyncVal.IsNumber() ) {
                    return asyncVal.As<Napi::Number>().DoubleValue()!=0.0;
                }
            }
        }
        return true;
    }
    return def;
}

double LibICloudDrive::GetUnixTimeStampMSFromParameter( const Napi::CallbackInfo& info, unsigned int idx, const char* propertyName, double def ) {
    Napi::Env env = info.Env();
    if( info.Length()>(unsigned int)idx ) {
        Napi::Value dateVal = info[idx];
        if( dateVal.IsNumber() ) {
            return dateVal.As<Napi::Number>().DoubleValue();
        }
        if( dateVal.IsDate() ) {
            return dateVal.As<Napi::Date>().ValueOf();
        }
        if( dateVal.IsObject() ) {
            if(propertyName!=NULL) {
                Napi::Object obj = dateVal.As<Napi::Object>();
                dateVal = obj.Get( Napi::String::New( env, propertyName ) );
                if( dateVal.IsNumber() ) {
                    return dateVal.As<Napi::Number>().DoubleValue();
                }
                if( dateVal.IsDate() ) {
                    return dateVal.As<Napi::Date>().ValueOf();
                }
            }
        }
    }
    return def;
}

Napi::Value LibICloudDrive::getValueFromInfo( const Napi::CallbackInfo& info, unsigned int idx, bool throwException ) {
    return getValueFromInfo( info, idx, NULL, throwException );
}

Napi::Value LibICloudDrive::getValueFromInfo( const Napi::CallbackInfo& info, unsigned int idx, const char* propertyName, bool throwException ) {
    if( idx < info.Length() ) {
        if(propertyName==NULL) {
            return info[idx];
        } else {
            if( info[idx].IsObject() ) {
                Napi::Object obj = info[idx].As<Napi::Object>();
                if( obj.Has( propertyName ) ) {
                    return obj.Get( propertyName );
                }
            }
        }
    }

    if( throwException ) {
        throw Napi::Error::New( info.Env(), "argument not found" );
    } else {
        return info.Env().Undefined();
    }
}

Napi::Function LibICloudDrive::validateFunction( const Napi::CallbackInfo& info, unsigned int idx ) {
    Napi::Value val = getValueFromInfo( info, idx, true );
    if( val.IsFunction()==false ) {
        throw Napi::Error::New( info.Env(), "Function not where expected." );
    }
    return val.As<Napi::Function>();
}

Napi::Number LibICloudDrive::validateNumber( const Napi::CallbackInfo& info, unsigned int idx ) {
    Napi::Value val = getValueFromInfo( info, idx, true );
    if( val.IsNumber()==false ) {
        throw Napi::Error::New( info.Env(), "Number not where expected." );
    }
    return val.ToNumber();
}

std::string LibICloudDrive::validateString( const Napi::CallbackInfo& info, unsigned int idx ) {
    Napi::Value val = getValueFromInfo( info, idx, true );
    if( val.IsString()==false ) {
        throw Napi::Error::New( info.Env(), "String not where expected." );
    }
    return val.ToString().Utf8Value();
}

Napi::Value LibICloudDrive::validateStringOrSymbol( const Napi::CallbackInfo& info, unsigned int idx ) {
    Napi::Value val = getValueFromInfo( info, idx, true );
    if( val.IsString()==false && val.IsSymbol()==false ) {
        throw Napi::Error::New( info.Env(), "String or Symbol not where expected." );
    }
    return val;
}

Napi::Value LibICloudDrive::Console( std::string channel, Napi::Value val ) {
    Napi::Object console = val.Env().Global().Get( "console" ).As<Napi::Object>();
    return console.Get( channel ).As<Napi::Function>().Call( console, { val } );
}

Napi::Value LibICloudDrive::ErrorToRejectedPromise( Napi::Env env, Napi::Error err ) {
    Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
    deferredPromise.Reject( err.Value() );
    return deferredPromise.Promise();
}

// template< typename ...NVs >
// Napi::Value Console_Log( Napi::Env env, NVs... vals ) {
//     Napi::Object console = env.Global().Get("console").As<Napi::Object>();
//     return console.Get("log").As<Napi::Function>().Call( console, std::forward<NVs>(vals)... );
// }

void LibICloudDrive::inheritFrom( Napi::Object target, std::string parentClass) {
    Napi::Env env = target.Env();
    std::string part;
    Napi::Value cur = env.Undefined();
    std::istringstream sstream( parentClass );
    while( std::getline( sstream, part, '.' ) ) {
        if(cur.IsUndefined()) {
            if( env.Global().ToObject().Has( part ) ) {
                cur = env.Global().ToObject().Get( part );
            } else {
                cur = requireModule( target.Env(), part );
            }
        } else {
            cur = cur.ToObject().Get( part );
        }
        if(cur.IsUndefined()) {
            std::string errorTemplate = "Unable to import \"%s\"";
            char buff [ std::strlen( errorTemplate.c_str() ) + std::strlen( parentClass.c_str() ) ];
            sprintf( buff, errorTemplate.c_str(), parentClass.c_str() );
            throw Napi::Error::New( env, buff );
        }
    }

    inheritFrom( target, cur.ToObject() );
}

void LibICloudDrive::inheritFrom( Napi::Object target, Napi::Object superClass) {
    Napi::Function inherits = requireModule( target.Env(), "util" ).ToObject().Get("inherits").As<Napi::Function>();
    inherits.Call( { target, superClass } );
}

Napi::Value LibICloudDrive::requireModule( Napi::Env env, std::string moduleName) {
    // Console("log", env.Global());
    Napi::Function require = env.Global().Get("require").As<Napi::Function>();
    return require.Call( { Napi::String::New( env, moduleName ) } );
}