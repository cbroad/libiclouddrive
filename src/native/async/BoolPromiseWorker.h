#ifndef __LIBICLOUDDRIVE_BOOLPROMISEWORKER_H__
#define __LIBICLOUDDRIVE_BOOLPROMISEWORKER_H__

#import <Foundation/Foundation.h>
#include <napi.h>

#include "../util/Debug.h"
#include "../util/HelperFunctions.h"
#include "./PromiseWorker.h"

namespace LibICloudDrive
{

    class BoolPromiseWorker : public PromiseWorker
    {
    public:
        BoolPromiseWorker(Napi::Env env) : PromiseWorker(env)
        {
            if (Debug::Logging)
            {
                NSLog(@"BoolPromiseWorker::BoolPromiseWorker()");
            }
        }

        ~BoolPromiseWorker()
        {
            if (Debug::Logging)
            {
                NSLog(@"BoolPromiseWorker::~BoolPromiseWorker()");
            }
        }

        void OnOK()
        {
            PromiseWorker::SetValue(NSObjectToNapiValue(this->Env(), this->boolValue));
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

            virtual bool run();
        };

        static Napi::Promise run(Napi::Env env, Runnable *runnable)
        {

            class PrivateWorker : public BoolPromiseWorker
            {
            public:
                PrivateWorker(Napi::Env env, BoolPromiseWorker::Runnable *runnable) : BoolPromiseWorker(env), runnable(runnable)
                {
                    if (Debug::Logging)
                    {
                        NSLog(@"BoolPromiseWorker::run()::PrivateWorker()");
                    }
                };

                ~PrivateWorker()
                {
                    if (Debug::Logging)
                    {
                        NSLog(@"BoolPromiseWorker::run()::~PrivateWorker()");
                    }
                    delete runnable;
                };

                void Execute()
                {
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
        void SetValue(bool val)
        {
            this->boolValue = val;
        }

        bool boolValue;
    };
}

#endif