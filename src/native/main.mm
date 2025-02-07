#include <napi.h>

#include "./Foundation/FileManager.h"
#include "./Foundation/MetadataItem.h"
#include "./Foundation/URL.h"

using namespace LibICloudDrive;

Napi::Object Init(Napi::Env env, Napi::Object exports) {
	Foundation::FileManager::Init( env, exports );
	Foundation::MetadataItem::Init( env, exports );
	Foundation::URL::Init( env, exports );
	return exports;
}

NODE_API_MODULE(LibICloudDrive, Init);