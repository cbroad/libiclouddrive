#ifndef __LIBICLOUDDRIVE_FOUNDATION_FILEMANAGER_H__
#define __LIBICLOUDDRIVE_FOUNDATION_FILEMANAGER_H__
#include <napi.h>

namespace LibICloudDrive::Foundation
{
    class FileManager
    {
    public:
        static Napi::Object Init(Napi::Env, Napi::Object);

        static Napi::Value downloadUbiquitousItem(const Napi::CallbackInfo &);
        static Napi::Value downloadUbiquitousItemSync(const Napi::CallbackInfo &);
        static Napi::Value evictUbiquitousItem(const Napi::CallbackInfo &);
        static Napi::Value evictUbiquitousItemSync(const Napi::CallbackInfo &);
        static Napi::Value isUbiquitousItem(const Napi::CallbackInfo &);
        static Napi::Value isUbiquitousItemSync(const Napi::CallbackInfo &);
    };
}

#endif
