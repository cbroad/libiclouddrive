#include <napi.h>

#include "./NoOp.h"

using namespace LibICloudDrive;

Napi::Value LibICloudDrive::NoOp(const Napi::CallbackInfo &info) {
  return info.Env().Undefined();
}