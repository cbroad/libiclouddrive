#ifndef __LIBICLOUDDRIVE_FOUNDATION_METADATAITEM_H___
#define __LIBICLOUDDRIVE_FOUNDATION_METADATAITEM_H___

#include <napi.h>

namespace LibICloudDrive::Foundation
{
    class MetadataItem
    {
    public:
        static Napi::Object Init(Napi::Env, Napi::Object);
        static Napi::Value allValuesForAttributes(const Napi::CallbackInfo &);
        static Napi::Value allValuesForAttributesSync(const Napi::CallbackInfo &);
        static Napi::Value attributes(const Napi::CallbackInfo &);
        static Napi::Value attributesSync(const Napi::CallbackInfo &);
        static Napi::Value valueForAttribute(const Napi::CallbackInfo &);
        static Napi::Value valueForAttributeSync(const Napi::CallbackInfo &);
        static Napi::Value valuesForAttributes(const Napi::CallbackInfo &);
        static Napi::Value valuesForAttributesSync(const Napi::CallbackInfo &);
    };
}

#endif
