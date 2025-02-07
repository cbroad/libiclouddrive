#import <dispatch/dispatch.h>
#import <Foundation/Foundation.h>

#include <exception>
#include <iostream>

#include <Block.h>
#include <napi.h>

#include "../async/NSObjectPromiseWorker.h"
#include "../util/HelperFunctions.h"

#include "./MetadataItem.h"

using namespace LibICloudDrive;
using namespace LibICloudDrive::Foundation;

NSDictionary< NSString*, id >* allValuesForAttributesShared( std::string path ) {
    @autoreleasepool {
        NSURL* nsUrl = [ NSURL fileURLWithPath: [ NSString stringWithUTF8String: path.c_str() ] ];
        NSMetadataItem* nsMetadataItem = [ [ NSMetadataItem alloc] initWithURL: nsUrl ];
        return [ nsMetadataItem valuesForAttributes: nsMetadataItem.attributes ];
    }
}

Napi::Value LibICloudDrive::Foundation::MetadataItem::allValuesForAttributes( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    try {

        if( info.Length()!=1 ) {
            throw Napi::RangeError::New( env, "Expected one string arguments.");
        }
        if(! info[0].IsString() ) {
            throw Napi::TypeError::New( env, "Expected argument to be a string." );
        }

    } catch( Napi::Error err ) {
        Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
        deferredPromise.Reject( err.Value() );
        return deferredPromise.Promise();
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();

    class AllValuesForAttributesRunnable : public NSObjectPromiseWorker::Runnable {
        public:
            AllValuesForAttributesRunnable( std::string path ): NSObjectPromiseWorker::Runnable(), path(path) {
                if( Debug::Logging) { NSLog( @"AllValuesForAttributesRunnable::AllValuesForAttributesRunnable()" ); }
            }

            ~AllValuesForAttributesRunnable() {
                if( Debug::Logging) { NSLog( @"AllValuesForAttributesRunnable::~AllValuesForAttributesRunnable()" ); }
            }

            NSObject* run() {
                if( Debug::Logging) { NSLog( @"AllValuesForAttributesRunnable::run()" ); }
                return allValuesForAttributesShared( this->path );
            }
        
        private:
            std::string path;
    };

    Napi::Promise promise = NSObjectPromiseWorker::run( env, new AllValuesForAttributesRunnable( path ) );
    return promise;
}

Napi::Value LibICloudDrive::Foundation::MetadataItem::allValuesForAttributesSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    if( info.Length()!=1 ) {
        throw Napi::RangeError::New( env, "Expected one string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected argument to be a string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    try {
        return LibICloudDrive::NSObjectToNapiValue( env, allValuesForAttributesShared( path ) );
    } catch ( std::exception &ex ) {
        throw Napi::Error::New( env, ex.what() );
    }
}

NSArray< NSString* >* attributesShared( std::string path ) {
    @autoreleasepool {
        NSURL* nsUrl = [ NSURL fileURLWithPath: [ NSString stringWithUTF8String: path.c_str() ] ];
        NSMetadataItem* nsMetadataItem = [ [ NSMetadataItem alloc ] initWithURL: nsUrl ];
        return nsMetadataItem.attributes;
    }
}


Napi::Value LibICloudDrive::Foundation::MetadataItem::attributes( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();
    
    try {

        if( info.Length()!=1 ) {
            throw Napi::RangeError::New( env, "Expected one string arguments.");
        }
        if(! info[0].IsString() ) {
            throw Napi::TypeError::New( env, "Expected argument to be a string." );
        }

    } catch( Napi::Error err ) {
        Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
        deferredPromise.Reject( err.Value() );
        return deferredPromise.Promise();
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();



    class AttributesRunnable : public NSObjectPromiseWorker::Runnable {
        public:
            AttributesRunnable( std::string path ): NSObjectPromiseWorker::Runnable(), path(path) {
                if( Debug::Logging) { NSLog( @"AttributesRunnable::AttributesRunnable()" ); }
            }

            ~AttributesRunnable() {
                if( Debug::Logging) { NSLog( @"AttributesRunnable::~AttributesRunnable()" ); }
            }

            NSObject* run() {
                if( Debug::Logging) { NSLog( @"AttributesRunnable::run()" ); }
                return attributesShared( this->path );
            }
        
        private:
            std::string path;
    };

    Napi::Promise promise = NSObjectPromiseWorker::run( env, new AttributesRunnable( path ) );
    return promise;
}


Napi::Value LibICloudDrive::Foundation::MetadataItem::attributesSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();
    if( info.Length()!=1 ) {
        throw Napi::RangeError::New( env, "Expected one string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected argument to be a string." );
    }
    std::string path = info[0].As<Napi::String>().Utf8Value();

    try {
        return NSObjectToNapiValue( env, attributesShared( path ) );
    } catch ( std::exception &ex ) {
        throw Napi::Error::New( env, ex.what() );
    }
}


NSObject* valueForAttributeShared( std::string path, std::string key ) {
    @autoreleasepool {
        NSURL* nsUrl = [ NSURL fileURLWithPath: [ NSString stringWithUTF8String: path.c_str() ] ];
        NSString* nsKey = [ NSString stringWithUTF8String: key.c_str() ];
        NSMetadataItem* nsMetadataItem = [ [ NSMetadataItem alloc] initWithURL: nsUrl ];
        return [ nsMetadataItem valueForAttribute: nsKey ];
    }
}


Napi::Value LibICloudDrive::Foundation::MetadataItem::valueForAttribute( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();
    
    try {

        if( info.Length()!=2 ) {
            throw Napi::RangeError::New( env, "Expected two string arguments.");
        }
        if(! info[0].IsString() ) {
            throw Napi::TypeError::New( env, "Expected first argument to be a string." );
        }
        if(! info[1].IsString() ) {
            throw Napi::TypeError::New( env, "Expected second argument to be a string." );
        }

    } catch( Napi::Error err ) {
        Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
        deferredPromise.Reject( err.Value() );
        return deferredPromise.Promise();
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    std::string key = info[1].As<Napi::String>().Utf8Value();


    class ValueForAttributeRunnable : public NSObjectPromiseWorker::Runnable {
        public:
            ValueForAttributeRunnable( std::string path, std::string key ): NSObjectPromiseWorker::Runnable(), path( path ), key( key ) {
                if( Debug::Logging) { NSLog( @"ValueForAttributeRunnable::ValueForAttributeRunnable()" ); }
            }

            ~ValueForAttributeRunnable() {
                if( Debug::Logging) { NSLog( @"ValueForAttributeRunnable::~ValueForAttributeRunnable()" ); }
            }

            NSObject* run() {
                if( Debug::Logging) { NSLog( @"ValueForAttributeRunnable::run()" ); }
                return valueForAttributeShared( this->path , this->key );
            }
        
        private:
            std::string path;
            std::string key;
    };

    Napi::Promise promise = NSObjectPromiseWorker::run( env, new ValueForAttributeRunnable( path, key ) );
    return promise;

} 


Napi::Value LibICloudDrive::Foundation::MetadataItem::valueForAttributeSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();
    if( info.Length()!=2 ) {
        throw Napi::RangeError::New( env, "Expected two string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected first argument to be a string." );
    }
    if(! info[1].IsString() ) {
        throw Napi::TypeError::New( env, "Expected second argument to be a string." );
    }
    std::string path = info[0].As<Napi::String>().Utf8Value();
    std::string key = info[1].As<Napi::String>().Utf8Value();

    try {
        return NSObjectToNapiValue( env, valueForAttributeShared( path, key ) );
    } catch ( std::exception &ex ) {
        throw Napi::Error::New( env, ex.what() );
    }
}


NSDictionary< NSString*, id >* valuesForAttributesShared( std::string path, std::vector<std::string> keys ) {
    @autoreleasepool {
        NSString* nsPath = [ NSString stringWithCString: path.c_str() encoding: NSUTF8StringEncoding ];
        NSURL* nsUrl = [ NSURL fileURLWithPath: nsPath ];

        NSMutableArray* nsKeys = [ [ NSMutableArray alloc ] initWithCapacity: (NSUInteger) keys.size() ];

        for( std::string key : keys ) {
            [ nsKeys addObject: [ NSString stringWithUTF8String: key.c_str() ] ];
        }

        NSMetadataItem* nsMetadataItem = [ [ NSMetadataItem alloc] initWithURL: nsUrl ];
        return [ nsMetadataItem valuesForAttributes: nsKeys ];
    }
}


Napi::Value LibICloudDrive::Foundation::MetadataItem::valuesForAttributes( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    Napi::Array napiArray;
    try {
        if( info.Length()!=2 ) {
            throw Napi::RangeError::New( env, "Expected two argumnets, a string and an array of strings.");
        }
        if( ! info[0].IsString() ) {
            throw Napi::TypeError::New( env, "Expected first argument to be a string." );
        }
        if( ! info[1].IsArray() ) {
            throw Napi::TypeError::New( env, "Expected second argument to be an array of string." );
        }

        napiArray = info[1].As<Napi::Array>();
        for(uint i=0 ; i<napiArray.Length() ; i++ ) {
            if( ! napiArray.Get(i).IsString() ) {
                throw Napi::TypeError::New( env, "Expected second argument to be an array of string." );
            }
        }

    } catch( Napi::Error err ) {
        Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
        deferredPromise.Reject( err.Value() );
        return deferredPromise.Promise();
    }
    
    std::string path = info[0].As<Napi::String>().Utf8Value();

    std::vector<std::string> keys;
    for(uint i=0 ; i<napiArray.Length() ; i++ ) {
        keys.push_back( napiArray.Get(i).As<Napi::String>().Utf8Value() );
    }

    class ValuesForAttributesRunnable : public NSObjectPromiseWorker::Runnable {
        public:
            ValuesForAttributesRunnable( std::string path, std::vector<std::string> keys ): NSObjectPromiseWorker::Runnable(), path( path ), keys( keys ) {
                if( Debug::Logging) { NSLog( @"ValuesForAttributesRunnable::ValuesForAttributesRunnable()" ); }
            }

            ~ValuesForAttributesRunnable() {
                if( Debug::Logging) { NSLog( @"ValuesForAttributesRunnable::~ValuesForAttributesRunnable()" ); }
            }

            NSObject* run() {
                if( Debug::Logging) { NSLog( @"ValuesForAttributesRunnable::run()" ); }
                return valuesForAttributesShared( this->path, this->keys );
            }
        
        private:
            std::string path;
            std::vector<std::string> keys;
    };

    Napi::Promise promise = NSObjectPromiseWorker::run( env, new ValuesForAttributesRunnable( path, keys ) );
    return promise;
}


Napi::Value LibICloudDrive::Foundation::MetadataItem::valuesForAttributesSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();


    if( info.Length()!=2 ) {
        throw Napi::RangeError::New( env, "Expected two argumnets, a string and an array of strings.");
    }
    if( ! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected first argument to be a string." );
    }
    if( ! info[1].IsArray() ) {
        throw Napi::TypeError::New( env, "Expected second argument to be an array of string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();

    Napi::Array napiArray = info[1].As<Napi::Array>();
    std::vector<std::string> keys;
    for(uint i=0 ; i<napiArray.Length() ; i++ ) {
        if( ! napiArray.Get(i).IsString() ) {
            throw Napi::TypeError::New( env, "Expected second argument to be an array of string." );
        }
        keys.push_back( napiArray.Get(i).As<Napi::String>().Utf8Value() );
    }

    try {
        return NSObjectToNapiValue( env, valuesForAttributesShared( path, keys ) );
    } catch ( std::exception &ex ) {
        throw Napi::Error::New( env, ex.what() );
    }
}


Napi::Object LibICloudDrive::Foundation::MetadataItem::Init( Napi::Env env, Napi::Object exports) {
	Napi::Object metadataItem = Napi::Object::New( env );
        metadataItem.Set( Napi::String::New( env, "allValuesForAttributes" ), Napi::Function::New( env, MetadataItem::allValuesForAttributes ) );
        metadataItem.Set( Napi::String::New( env, "allValuesForAttributesSync" ), Napi::Function::New( env, MetadataItem::allValuesForAttributesSync ) );
        metadataItem.Set( Napi::String::New( env, "attributes" ), Napi::Function::New( env, MetadataItem::attributes ) );
        metadataItem.Set( Napi::String::New( env, "attributesSync" ), Napi::Function::New( env, MetadataItem::attributesSync ) );
        metadataItem.Set( Napi::String::New( env, "valueForAttribute" ), Napi::Function::New( env, MetadataItem::valueForAttribute ) );
        metadataItem.Set( Napi::String::New( env, "valueForAttributeSync" ), Napi::Function::New( env, MetadataItem::valueForAttributeSync ) );
        metadataItem.Set( Napi::String::New( env, "valuesForAttributes" ), Napi::Function::New( env, MetadataItem::valuesForAttributes ) );
        metadataItem.Set( Napi::String::New( env, "valuesForAttributesSync" ), Napi::Function::New( env, MetadataItem::valuesForAttributesSync ) );
	// exports.Set( Napi::String::New(env, "MetadataItem"), metadataItem );
    exports.Set( Napi::String::New(env, "MetadataItem"), metadataItem );
    return exports;
}