#include <napi.h>

#include "./HelperFunctions.h"

#include "./PreparedErrors.h"

using namespace LibICloudDrive;

Napi::Value LibICloudDrive::ThrowNotImplementedError(Napi::Env env ) {
    throw Napi::Error::New( env, NotImplementedMessage );
    return env.Undefined();
}

Napi::Value LibICloudDrive::RejectNotImplementedError( Napi::Env env ) {
    try {
        ThrowNotImplementedError( env );
    } catch( Napi::Error err ) {
        return ErrorToRejectedPromise( env, err );
    }
    return env.Undefined();
}

Napi::Value LibICloudDrive::ThrowNotSupportedError(Napi::Env env ) {
    throw Napi::Error::New( env, NotImplementedMessage );
    return env.Undefined();
}

Napi::Value LibICloudDrive::RejectNotSupportedError( Napi::Env env ) {
    try {
        ThrowNotSupportedError( env );
    } catch( Napi::Error err ) {
        return ErrorToRejectedPromise( env, err );
    }
    return env.Undefined();
}