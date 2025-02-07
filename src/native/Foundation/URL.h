#ifndef __LIBICLOUDDRIVE_FOUNDATION_URL_H__
#define __LIBICLOUDDRIVE_FOUNDATION_URL_H__

#include <napi.h>

namespace LibICloudDrive::Foundation
{
    class URL
    {
    public:
        static Napi::Object Init(Napi::Env, Napi::Object);
        static Napi::Value getResourceValue(const Napi::CallbackInfo &);
        static Napi::Value getResourceValueSync(const Napi::CallbackInfo &);
    };
}

#endif