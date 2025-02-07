#ifndef __LIBICLOUDDRIVE_PROMISEWORKER_H__
#define __LIBICLOUDDRIVE_PROMISEWORKER_H__

#include <napi.h>

namespace LibICloudDrive
{
    class PromiseWorker : public Napi::AsyncWorker
    {

    public:
        PromiseWorker(Napi::Env env) : Napi::AsyncWorker(env), value(env.Undefined()), deferred(Napi::Promise::Deferred::New(env)) {};

        void OnError(const Napi::Error &error)
        {
            this->deferred.Reject(error.Value());
        };

        void OnOK()
        {
            this->deferred.Resolve(value);
        };

        const Napi::Promise Promise()
        {
            return this->deferred.Promise();
        }

    protected:
        void SetValue(Napi::Value val)
        {
            this->value = val;
        };

    private:
        Napi::Value value;

        const Napi::Promise::Deferred deferred;
    };
}

#endif