#ifndef __LIBICLOUDDRIVE_NSOBJECTPROMISEWORKER_H__
#define __LIBICLOUDDRIVE_NSOBJECTPROMISEWORKER_H__

#import <Foundation/Foundation.h>

#include <napi.h>

#include "../util/Debug.h"
#include "../util/HelperFunctions.h"

#include "./PromiseWorker.h"

namespace LibICloudDrive
{
    class NSObjectPromiseWorker : public PromiseWorker
    {
    public:
        NSObjectPromiseWorker(Napi::Env env) : PromiseWorker(env), nsObject(nil)
        {
            if (Debug::Logging)
            {
                NSLog(@"NSObjectPromiseWorker::NSObjectPromiseWorker()");
            }
        };

        ~NSObjectPromiseWorker()
        {
            if (Debug::Logging)
            {
                NSLog(@"NSObjectPromiseWorker::~NSObjectPromiseWorker()");
            }
            @autoreleasepool
            {
                if (this->nsObject != nil)
                {
                    this->nsObject = nil;
                }
            }
        };

        void OnOK()
        {
            PromiseWorker::SetValue(NSObjectToNapiValue(this->Env(), this->nsObject));
            PromiseWorker::OnOK();
        };

        struct Runnable
        {
            // Runnable() {
            //     if( Debug::Logging ) { NSLog( @"NSObjectPromiseWorker::Runnable::Runnable()" ); }
            // };

            virtual ~Runnable() {
                // if( Debug::Logging ) { NSLog( @"NSObjectPromiseWorker::Runnable::~Runnable()" ); }
            };

            virtual NSObject *run();
        };

        static Napi::Promise run(Napi::Env env, Runnable *runnable)
        {

            class PrivateWorker : public NSObjectPromiseWorker
            {
            public:
                PrivateWorker(Napi::Env env, NSObjectPromiseWorker::Runnable *runnable) : NSObjectPromiseWorker(env), runnable(runnable)
                {
                    if (Debug::Logging)
                    {
                        NSLog(@"NSObjectPromiseWorker::run()::PrivateWorker::PrivateWorker()");
                    }
                };

                ~PrivateWorker()
                {
                    if (Debug::Logging)
                    {
                        NSLog(@"NSObjectPromiseWorker::run()::PrivateWorker::~PrivateWorker()");
                    }
                    delete runnable;
                };

                void Execute()
                {
                    if (Debug::Logging)
                    {
                        NSLog(@"NSObjectPromiseWorker::run()::PrivateWorker::Execute()");
                    }
                    try
                    {
                        this->SetValue(this->runnable->run());
                    }
                    catch (std::exception &ex)
                    {
                        this->SetError(ex.what());
                    }
                }

            private:
                Runnable *runnable;
            };

            PromiseWorker *worker = new PrivateWorker(env, runnable);
            worker->Queue();
            return worker->Promise();
        };

    protected:
        void SetValue(id val)
        {
            @autoreleasepool
            {
                this->nsObject = val;
            }
        }

    private:
        id nsObject;
    };
}

#endif