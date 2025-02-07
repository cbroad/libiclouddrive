#ifndef __LIBICLOUDDRIVE_PREPAREDERRORS_H__
#define __LIBICLOUDDRIVE_PREPAREDERRORS_H__

#include <napi.h>

namespace LibICloudDrive
{

    std::string NotImplementedMessage = "Not Implemented";
    std::string NotSupportedMessage = "This functionality is not supported on your operating system.";

    Napi::Value ThrowNotImplementedError(Napi::Env);
    Napi::Value RejectNotImplementedError(Napi::Env);
    Napi::Value ThrowNotSupportedError(Napi::Env);
    Napi::Value RejectNotSupportedError(Napi::Env);
}

#endif