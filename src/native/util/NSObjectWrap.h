#ifndef __LIBICLOUDDRIVE_NSOBJECTWRAP_H__
#define __LIBICLOUDDRIVE_NSOBJECTWRAP_H__

#import <Foundation/Foundation.h>

#include <iostream>
#include <napi.h>

#include "./Debug.h"
#include "./HelperFunctions.h"

namespace LibICloudDrive
{

    template <typename T, class N>
    class NSObjectWrap : public Napi::ObjectWrap<T>
    {

    public:
        NSObjectWrap(const Napi::CallbackInfo &info) : Napi::ObjectWrap<T>(info)
        {
            if (Debug::Logging)
            {
                NSLog(@"NSObjectWrap::NSObjectWrap()");
            }
        };

        ~NSObjectWrap()
        {
            if (Debug::Logging)
            {
                NSLog(@"NSObjectWrap::~NSObjectWrap()");
            }
            @autoreleasepool
            {
                if (this->nsObject != nil)
                {
                    // if( Debug::Logging ) { NSLog( @"NSObjectWrap::~NSObjectWrap() pre-release [ nsObject retainCount ]=%lu", [ this->nsObject retainCount ] ); }
                    // [ this->nsObject release ];
                    this->nsObject = nil;
                }
            }
        }

        static Napi::Value FromNSObject(id nsObject)
        {
            if (Debug::Logging)
            {
                NSLog(@"NSObjectWrap::FromNSObject() %@", nsObject);
            }
            // Napi::Object instance = T::GetConstructor()->New( {} );

            if (nsObject == nil)
            {
                return T::GetConstructor()->Env().Null();
            }

            Napi::Object instance = T::GetConstructor()->New({});
            NSObjectWrap *unwrapped = Napi::ObjectWrap<T>::Unwrap(instance);
            unwrapped->SetNSObject(nsObject);
            return instance;
        }

        N *GetNSObject() { return (N *)this->nsObject; };

        void SetNSObject(N *nsObject)
        {
            // if( Debug::Logging ) { NSLog( @"NSObjectWrap::SetNSObject() env, %@", nsObject ); }

            @autoreleasepool
            {
                if (nsObject == nil)
                {
                    this->nsObject = nil;
                }
                else
                {
                    // this->nsObject = [ nsObject copy ];
                    this->nsObject = nsObject;
                }
            }
        };

        // virtual std::string GetType();
        static Napi::FunctionReference *GetConstructor();

        // static void StaticVoidSetter( const Napi::CallbackInfo& info, const Napi::Value& value ){};
        // void VoidSetter( const Napi::CallbackInfo& info, const Napi::Value& value ){};

    protected:
    private:
        id nsObject = nil;
    };
}

#endif