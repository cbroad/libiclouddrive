#include <napi.h>

#include "../async/BoolPromiseWorker.h"
#include "../util/Debug.h"
#include "../util/HelperFunctions.h"

#include "./FileManager.h"

using namespace LibICloudDrive;
using namespace LibICloudDrive::Foundation;

bool downloadUbiquitousItemShared( std::string path ) {
    @autoreleasepool {
        NSString* nsPath = [ NSString stringWithCString: path.c_str() encoding: NSUTF8StringEncoding ];
        NSURL* nsUrl = [ NSURL fileURLWithPath: nsPath ];

        NSError* error = nil;

        BOOL isUbiquitous = [ [ NSFileManager defaultManager ] isUbiquitousItemAtURL: nsUrl ];
        if( isUbiquitous == NO ) {
            return [ [ NSFileManager defaultManager ] fileExistsAtPath:  nsPath ]==YES;
        }

        bool success = [ [NSFileManager defaultManager] startDownloadingUbiquitousItemAtURL: nsUrl  error: &error ];

        if( success==false) {
            if(error==nil) {
                error = [ [ NSError alloc ] initWithDomain:[[NSBundle mainBundle] bundleIdentifier]
                    code: 200
                    userInfo: @{ 
                        NSLocalizedDescriptionKey: @"NSFileManager.startDownloadingUbiquitousItemAtURL returned false."
                    } ];
            }

            throw std::runtime_error( error.localizedDescription.UTF8String );
        }

        NSString* downloadingStatus = nil;

        [ [ NSURL fileURLWithPath: [ nsUrl path ] ]
            getResourceValue: &downloadingStatus
            forKey:NSURLUbiquitousItemDownloadingStatusKey
            error: &error ];

        while( [ downloadingStatus isEqualToString: NSURLUbiquitousItemDownloadingStatusCurrent ] == NO ) {
            if( error != nil ) {
                throw std::runtime_error( [ [ error localizedDescription ] UTF8String ] );
            }
            [ NSThread sleepForTimeInterval: 0.5F ]; // Sleep for 0.5 seconds
            [ [ NSURL fileURLWithPath: [ nsUrl path ] ]
                getResourceValue: &downloadingStatus
                forKey:NSURLUbiquitousItemDownloadingStatusKey
                error: &error ];
        }
    }
    return true;
}

Napi::Value LibICloudDrive::Foundation::FileManager::downloadUbiquitousItem( const Napi::CallbackInfo& info ) {
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



    class DownloadUbiquitousItemRunnable : public BoolPromiseWorker::Runnable {
        public:
            DownloadUbiquitousItemRunnable( std::string path ): BoolPromiseWorker::Runnable(), path(path) {
                if( Debug::Logging) { NSLog( @"DownloadUbiquitousItemRunnable::DownloadUbiquitousItemRunnable()" ); }
            }

            ~DownloadUbiquitousItemRunnable() {
                if( Debug::Logging) { NSLog( @"DownloadUbiquitousItemRunnable::~DownloadUbiquitousItemRunnable()" ); }
            }

            bool run() {
                if( Debug::Logging) { NSLog( @"DownloadUbiquitousItemRunnable::run()" ); }
                return downloadUbiquitousItemShared( this->path );
            }
        
        private:
            std::string path;
    };

    Napi::Promise promise = BoolPromiseWorker::run( env, new DownloadUbiquitousItemRunnable( path ) );
    return promise;
}

Napi::Value LibICloudDrive::Foundation::FileManager::downloadUbiquitousItemSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    if( info.Length()!=1 ) {
        throw Napi::RangeError::New( env, "Expected one string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected argument to be a string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    
    try {
        return NSObjectToNapiValue( env, downloadUbiquitousItemShared( path ) );
    } catch( std::exception &ex ) {
        throw Napi::TypeError::New( env, ex.what() );
    }
}

bool evictUbiquitousItemShared( std::string path ) {
    @autoreleasepool {
        NSURL* url = [NSURL fileURLWithPath: [ NSString stringWithCString: path.c_str() encoding: NSUTF8StringEncoding ] ];
        NSError* error = nil;
        [ [NSFileManager defaultManager] evictUbiquitousItemAtURL: url error: &error];
        if( error!=nil ) {
            throw std::runtime_error( [ [ error localizedDescription ] UTF8String ] );
        }
    }
    return true;
}

Napi::Value LibICloudDrive::Foundation::FileManager::evictUbiquitousItem( const Napi::CallbackInfo& info ) {
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

    class EvictUbiquitousItemRunnable : public BoolPromiseWorker::Runnable {
        public:
            EvictUbiquitousItemRunnable( std::string path ): BoolPromiseWorker::Runnable(), path(path) {
                if( Debug::Logging) { NSLog( @"EvictUbiquitousItemRunnable::EvictUbiquitousItemRunnable()" ); }
            }

            ~EvictUbiquitousItemRunnable() {
                if( Debug::Logging) { NSLog( @"EvictUbiquitousItemRunnable::~EvictUbiquitousItemRunnable()" ); }
            }

            bool run() {
                if( Debug::Logging) { NSLog( @"EvictUbiquitousItemRunnable::run()" ); }
                return evictUbiquitousItemShared( this->path );
            }
        
        private:
            std::string path;
    };

    Napi::Promise promise = BoolPromiseWorker::run( env, new EvictUbiquitousItemRunnable( path ) );
    return promise;
}

Napi::Value LibICloudDrive::Foundation::FileManager::evictUbiquitousItemSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    if( info.Length()!=1 ) {
        throw Napi::RangeError::New( env, "Expected one string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected argument to be a string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    
    try {
        return NSObjectToNapiValue( env, evictUbiquitousItemShared( path ) );
    } catch( std::exception &ex ) {
        throw Napi::TypeError::New( env, ex.what() );
    }
}

bool isUbiquitousItemShared( std::string path ) {
    @autoreleasepool {
        NSURL* url = [NSURL fileURLWithPath: [ NSString stringWithCString: path.c_str() encoding: NSUTF8StringEncoding ] ];
        bool result = [ [NSFileManager defaultManager] isUbiquitousItemAtURL: url ]==YES;
        return result;
    }
}

Napi::Value LibICloudDrive::Foundation::FileManager::isUbiquitousItem( const Napi::CallbackInfo& info ) {
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


    class IsUbiquitousItemRunnable : public BoolPromiseWorker::Runnable {
        public:
            IsUbiquitousItemRunnable( std::string path ): BoolPromiseWorker::Runnable(), path(path) {
                if( Debug::Logging) { NSLog( @"IsUbiquitousItemRunnable::IsUbiquitousItemRunnable()" ); }
            }

            ~IsUbiquitousItemRunnable() {
                if( Debug::Logging) { NSLog( @"IsUbiquitousItemRunnable::~IsUbiquitousItemRunnable()" ); }
            }

            bool run() {
                if( Debug::Logging) { NSLog( @"IsUbiquitousItemRunnable::run()" ); }
                return isUbiquitousItemShared( this->path );
            }
        
        private:
            std::string path;
    };

    Napi::Promise promise = BoolPromiseWorker::run( env, new IsUbiquitousItemRunnable( path ) );
    return promise;
}

Napi::Value LibICloudDrive::Foundation::FileManager::isUbiquitousItemSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    if( info.Length()!=1 ) {
        throw Napi::RangeError::New( env, "Expected one string arguments.");
    }
    if(! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected argument to be a string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    
    try {
        return NSObjectToNapiValue( env, isUbiquitousItemShared( path ) );
    } catch( std::exception &ex ) {
        throw Napi::TypeError::New( env, ex.what() );
    }
}



Napi::Object LibICloudDrive::Foundation::FileManager::Init( Napi::Env env, Napi::Object exports ) {
	Napi::Object fileManager = Napi::Object::New( env );
		fileManager.Set( Napi::String::New( env, "downloadUbiquitousItem" ), Napi::Function::New( env, FileManager::downloadUbiquitousItem ) );
		fileManager.Set( Napi::String::New( env, "downloadUbiquitousItemSync" ), Napi::Function::New( env, FileManager::downloadUbiquitousItemSync ) );
		fileManager.Set( Napi::String::New( env, "evictUbiquitousItem" ), Napi::Function::New( env, FileManager::evictUbiquitousItem ) );
		fileManager.Set( Napi::String::New( env, "evictUbiquitousItemSync" ), Napi::Function::New( env, FileManager::evictUbiquitousItemSync ) );
		fileManager.Set( Napi::String::New( env, "isUbiquitousItem" ), Napi::Function::New( env, FileManager::isUbiquitousItem ) );
		fileManager.Set( Napi::String::New( env, "isUbiquitousItemSync" ), Napi::Function::New( env, FileManager::isUbiquitousItemSync ) );
	// exports.Set( Napi::String::New( env, "FileManager"), fileManager );
	exports.Set( Napi::String::New( env, "FileManager"), fileManager );
  return exports;
}