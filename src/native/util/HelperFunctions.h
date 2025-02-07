#ifndef __LIBICLOUDDRIVE_HELPERFUNCTIONS_H__
#define __LIBICLOUDDRIVE_HELPERFUNCTIONS_H__

#import <Foundation/Foundation.h>

#include <concepts>

#include <napi.h>

namespace LibICloudDrive
{

    NSURL *NSStringToNSURL(NSString *str);

    NSString *stringToNSString(std::string *str);

    NSURL *stringToNSURL(std::string *str);

    Napi::Boolean NSObjectToNapiValue(Napi::Env env, bool b);

    // Napi::Boolean NSObjectToNapiValue(Napi::Env env, BOOL b);

    Napi::Value NSObjectToNapiValue(Napi::Env env, NSObject *obj);

    std::string NapiValueToJsonString(Napi::Env env, Napi::Value val);

    Napi::Value getValueFromInfo(const Napi::CallbackInfo &info, unsigned int idx, bool throwException);
    Napi::Value getValueFromInfo(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool throwException);

    bool GetBooleanFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool def);

    Napi::Function GetFunctionFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool def);

    long GetDoubleFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool def);

    long GetIntFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool def);

    std::string GetStringFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, bool def);

    double GetUnixTimeStampMSFromParameter(const Napi::CallbackInfo &info, unsigned int idx, const char *propertyName, double def);

    Napi::Function validateFunction(const Napi::CallbackInfo &info, unsigned int idx);

    Napi::Number validateNumber(const Napi::CallbackInfo &info, unsigned int idx);

    std::string validateString(const Napi::CallbackInfo &info, unsigned int idx);

    Napi::Value validateStringOrSymbol(const Napi::CallbackInfo &info, unsigned int idx);

    Napi::Value Console(std::string channel, Napi::Value val);

    Napi::Value ErrorToRejectedPromise(Napi::Env env, Napi::Error err);

    // template< typename ...NVs >
    // Napi::Value Console_Log( Napi::Env env, NVs... vals );

    void inheritFrom(Napi::Object target, std::string parentClass);
    void inheritFrom(Napi::Object target, Napi::Object superClass);

    Napi::Value requireModule(Napi::Env env, std::string moduleName);
}

#endif