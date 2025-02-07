{
    "targets": [
        {
            "conditions": [
                [
                    "OS==\"mac\"",
                    {
                        "cflags!": [ "-ObjC++" ],
                        "cflags_cc!": [ "-ObjC++" ],
                        "sources": [
                            "src/native/util/HelperFunctions.mm",
                            "src/native/util/NoOp.mm",
                            "src/native/util/PreparedErrors.mm",
                            "src/native/Foundation/FileManager.mm",
                            "src/native/Foundation/MetadataItem.mm",
                            "src/native/Foundation/URL.mm",
                            "src/native/main.mm",
                        ],
                        "xcode_settings": {
                            'CLANG_ENABLE_OBJC_ARC': 'YES',
                            'GCC_ENABLE_CPP_EXCEPTIONS': 'YES',
                            "MACOSX_DEPLOYMENT_TARGET": "10.13",
                            "OTHER_CPLUSPLUSFLAGS": [ "-std=c++20", "-stdlib=libc++" ],
                            "OTHER_LDFLAGS": [ "-framework AppKit -framework Foundation", ],
                        },
                    },
                ],
            ],
            # "defines": [ 'NAPI_DISABLE_CPP_EXCEPTIONS' ],
            # "defines": [ 'NAPI_CPP_EXCEPTIONS' ],
            "dependencies": [ "<!(node -p \"require('node-addon-api').gyp\")", ],
            "include_dirs": [ "<!@(node -p \"require('node-addon-api').include\")", ],
            "libraries": [],
            "target_name": "libiclouddrive",
        },
    ],
}