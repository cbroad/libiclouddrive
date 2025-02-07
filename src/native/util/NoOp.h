#ifndef __LIBICLOUDDRIVE_NOOP_H__
#define __LIBICLOUDDRIVE_NOOP_H__

#include <napi.h>

namespace LibICloudDrive
{
    Napi::Value NoOp(const Napi::CallbackInfo &);
}

#endif