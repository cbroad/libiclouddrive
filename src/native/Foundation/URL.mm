#include <napi.h>

#include "../async/NSObjectPromiseWorker.h"
#include "../util/Debug.h"
#include "../util/HelperFunctions.h"
#include "./URL.h"

using namespace LibICloudDrive;

Napi::Value ResourceKeys( Napi::Env env ) {
    Napi::Object obj = Napi::Object::New( env );
    obj.Set( Napi::String::New( env, "IsApplicationKey" ), Napi::String::New( env, [ NSURLIsApplicationKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "ApplicationIsScriptableKey" ), Napi::String::New( env, [ NSURLApplicationIsScriptableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsDirectoryKey" ), Napi::String::New( env, [ NSURLIsDirectoryKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "ParentDirectoryURLKey" ), Napi::String::New( env, [ NSURLParentDirectoryURLKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "FileAllocatedSizeKey" ), Napi::String::New( env, [ NSURLFileAllocatedSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "FileProtectionKey" ), Napi::String::New( env, [ NSURLFileProtectionKey UTF8String ] ) );

    if( @available( macOS 10.16, * ) ) {
        Napi::Object fileProtectionType = Napi::Object::New( env );
        fileProtectionType.Set( Napi::String::New( env, "Complete" ), Napi::String::New( env, [ NSURLFileProtectionComplete UTF8String ] ) );
        fileProtectionType.Set( Napi::String::New( env, "CompleteUnlessOpen" ), Napi::String::New( env, [ NSURLFileProtectionCompleteUnlessOpen UTF8String ] ) );
        fileProtectionType.Set( Napi::String::New( env, "CompleteUntilFirstUserAuthentication" ), Napi::String::New( env, [ NSURLFileProtectionCompleteUntilFirstUserAuthentication UTF8String ] ) );
        fileProtectionType.Set( Napi::String::New( env, "None" ), Napi::String::New( env, [ NSURLFileProtectionNone UTF8String ] ) );
        obj.Set( Napi::String::New( env, "FileProtectionType" ), fileProtectionType );
    }

    obj.Set( Napi::String::New( env, "FileResourceIdentifierKey" ), Napi::String::New( env, [ NSURLFileResourceIdentifierKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "FileResourceTypeKey" ), Napi::String::New( env, [ NSURLFileResourceTypeKey UTF8String ] ) );

    Napi::Object fileResourceType = Napi::Object::New( env );
        fileResourceType.Set( Napi::String::New( env, "NamedPipe" ), Napi::String::New( env, [ NSURLFileResourceTypeNamedPipe UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "CharacterSpecial" ), Napi::String::New( env, [ NSURLFileResourceTypeCharacterSpecial UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "Directory" ), Napi::String::New( env, [ NSURLFileResourceTypeDirectory UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "BlockSpecial" ), Napi::String::New( env, [ NSURLFileResourceTypeBlockSpecial UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "Regular" ), Napi::String::New( env, [ NSURLFileResourceTypeRegular UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "SymbolicLink" ), Napi::String::New( env, [ NSURLFileResourceTypeSymbolicLink UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "Socket" ), Napi::String::New( env, [ NSURLFileResourceTypeSocket UTF8String ] ) );
        fileResourceType.Set( Napi::String::New( env, "Unknown" ), Napi::String::New( env, [ NSURLFileResourceTypeUnknown UTF8String ] ) );
    obj.Set( Napi::String::New( env, "FileResourceType" ), fileResourceType );

    obj.Set( Napi::String::New( env, "FileSecurityKey" ), Napi::String::New( env, [ NSURLFileSecurityKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "FileSizeKey" ), Napi::String::New( env, [ NSURLFileSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsAliasFileKey" ), Napi::String::New( env, [ NSURLIsAliasFileKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsPackageKey" ), Napi::String::New( env, [ NSURLIsPackageKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsRegularFileKey" ), Napi::String::New( env, [ NSURLIsRegularFileKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "PreferredIOBlockSizeKey" ), Napi::String::New( env, [ NSURLPreferredIOBlockSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "TotalFileAllocatedSizeKey" ), Napi::String::New( env, [ NSURLTotalFileAllocatedSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "TotalFileSizeKey" ), Napi::String::New( env, [ NSURLTotalFileSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeAvailableCapacityKey" ), Napi::String::New( env, [ NSURLVolumeAvailableCapacityKey UTF8String ] ) );

    if( @available( macOS 10.13, * ) ) {
        obj.Set( Napi::String::New( env, "VolumeAvailableCapacityForImportantUsageKey" ), Napi::String::New( env, [ NSURLVolumeAvailableCapacityForImportantUsageKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "VolumeAvailableCapacityForOpportunisticUsageKey" ), Napi::String::New( env, [ NSURLVolumeAvailableCapacityForOpportunisticUsageKey UTF8String ] ) );
    }

    obj.Set( Napi::String::New( env, "VolumeTotalCapacityKey" ), Napi::String::New( env, [ NSURLVolumeTotalCapacityKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsAutomountedKey" ), Napi::String::New( env, [ NSURLVolumeIsAutomountedKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsBrowsableKey" ), Napi::String::New( env, [ NSURLVolumeIsBrowsableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsEjectableKey" ), Napi::String::New( env, [ NSURLVolumeIsEjectableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsEncryptedKey" ), Napi::String::New( env, [ NSURLVolumeIsEncryptedKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsInternalKey" ), Napi::String::New( env, [ NSURLVolumeIsInternalKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsJournalingKey" ), Napi::String::New( env, [ NSURLVolumeIsJournalingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsLocalKey" ), Napi::String::New( env, [ NSURLVolumeIsLocalKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsReadOnlyKey" ), Napi::String::New( env, [ NSURLVolumeIsReadOnlyKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsRemovableKey" ), Napi::String::New( env, [ NSURLVolumeIsRemovableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIsRootFileSystemKey" ), Napi::String::New( env, [ NSURLVolumeIsRootFileSystemKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsMountTriggerKey" ), Napi::String::New( env, [ NSURLIsMountTriggerKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsVolumeKey" ), Napi::String::New( env, [ NSURLIsVolumeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeCreationDateKey" ), Napi::String::New( env, [ NSURLVolumeCreationDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeIdentifierKey" ), Napi::String::New( env, [ NSURLVolumeIdentifierKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeLocalizedFormatDescriptionKey" ), Napi::String::New( env, [ NSURLVolumeLocalizedFormatDescriptionKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeLocalizedNameKey" ), Napi::String::New( env, [ NSURLVolumeLocalizedNameKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeMaximumFileSizeKey" ), Napi::String::New( env, [ NSURLVolumeMaximumFileSizeKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeNameKey" ), Napi::String::New( env, [ NSURLVolumeNameKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeResourceCountKey" ), Napi::String::New( env, [ NSURLVolumeResourceCountKey UTF8String ] ) );

    if( @available( macOS 10.13, * ) ) {
        obj.Set( Napi::String::New( env, "VolumeSupportsAccessPermissionsKey" ), Napi::String::New( env, [ NSURLVolumeSupportsAccessPermissionsKey UTF8String ] ) );
    }

    obj.Set( Napi::String::New( env, "VolumeSupportsAdvisoryFileLockingKey" ), Napi::String::New( env, [ NSURLVolumeSupportsAdvisoryFileLockingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsCasePreservedNamesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsCasePreservedNamesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsCaseSensitiveNamesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsCaseSensitiveNamesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsCompressionKey" ), Napi::String::New( env, [ NSURLVolumeSupportsCompressionKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsExclusiveRenamingKey" ), Napi::String::New( env, [ NSURLVolumeSupportsExclusiveRenamingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsExtendedSecurityKey" ), Napi::String::New( env, [ NSURLVolumeSupportsExtendedSecurityKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsFileCloningKey" ), Napi::String::New( env, [ NSURLVolumeSupportsFileCloningKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsHardLinksKey" ), Napi::String::New( env, [ NSURLVolumeSupportsHardLinksKey UTF8String ] ) );

    if( @available( macOS 10.13, * ) ) {
        obj.Set( Napi::String::New( env, "VolumeSupportsImmutableFilesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsImmutableFilesKey UTF8String ] ) );
    }

    obj.Set( Napi::String::New( env, "VolumeSupportsJournalingKey" ), Napi::String::New( env, [ NSURLVolumeSupportsJournalingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsPersistentIDsKey" ), Napi::String::New( env, [ NSURLVolumeSupportsPersistentIDsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsRenamingKey" ), Napi::String::New( env, [ NSURLVolumeSupportsRenamingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsRootDirectoryDatesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsRootDirectoryDatesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsSparseFilesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsSparseFilesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsSwapRenamingKey" ), Napi::String::New( env, [ NSURLVolumeSupportsSwapRenamingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsSymbolicLinksKey" ), Napi::String::New( env, [ NSURLVolumeSupportsSymbolicLinksKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsVolumeSizesKey" ), Napi::String::New( env, [ NSURLVolumeSupportsVolumeSizesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeSupportsZeroRunsKey" ), Napi::String::New( env, [ NSURLVolumeSupportsZeroRunsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeURLForRemountingKey" ), Napi::String::New( env, [ NSURLVolumeURLForRemountingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeURLKey" ), Napi::String::New( env, [ NSURLVolumeURLKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "VolumeUUIDStringKey" ), Napi::String::New( env, [ NSURLVolumeUUIDStringKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsUbiquitousItemKey" ), Napi::String::New( env, [ NSURLIsUbiquitousItemKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousSharedItemMostRecentEditorNameComponentsKey" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemDownloadRequestedKey" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadRequestedKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemIsDownloadingKey" ), Napi::String::New( env, [ NSURLUbiquitousItemIsDownloadingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemDownloadingErrorKey" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadingErrorKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemDownloadingStatusKey" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadingStatusKey UTF8String ] ) );

    Napi::Object ubiquitousItemDownloadingStatus = Napi::Object::New( env );
        ubiquitousItemDownloadingStatus.Set( Napi::String::New( env, "Current" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadingStatusCurrent UTF8String ] ) );
        ubiquitousItemDownloadingStatus.Set( Napi::String::New( env, "Downloaded" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadingStatusDownloaded UTF8String ] ) );
        ubiquitousItemDownloadingStatus.Set( Napi::String::New( env, "NotDownloaded" ), Napi::String::New( env, [ NSURLUbiquitousItemDownloadingStatusNotDownloaded UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemDownloadingStatus" ), ubiquitousItemDownloadingStatus );

    obj.Set( Napi::String::New( env, "UbiquitousItemIsUploadedKey" ), Napi::String::New( env, [ NSURLUbiquitousItemIsUploadedKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemIsUploadingKey" ), Napi::String::New( env, [ NSURLUbiquitousItemIsUploadingKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemUploadingErrorKey" ), Napi::String::New( env, [ NSURLUbiquitousItemUploadingErrorKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemHasUnresolvedConflictsKey" ), Napi::String::New( env, [ NSURLUbiquitousItemHasUnresolvedConflictsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemContainerDisplayNameKey" ), Napi::String::New( env, [ NSURLUbiquitousItemContainerDisplayNameKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousSharedItemOwnerNameComponentsKey" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemOwnerNameComponentsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousSharedItemCurrentUserPermissionsKey" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemCurrentUserPermissionsKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousSharedItemCurrentUserRoleKey" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemCurrentUserRoleKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "UbiquitousItemIsSharedKey" ), Napi::String::New( env, [ NSURLUbiquitousItemIsSharedKey UTF8String ] ) );


    if( @available( macOS 10.13, * ) ) {
        Napi::Object ubiquitousSharedItemRole = Napi::Object::New( env );
            ubiquitousSharedItemRole.Set( Napi::String::New( env, "Owner" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemRoleOwner UTF8String ] ) );
            ubiquitousSharedItemRole.Set( Napi::String::New( env, "Participant" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemRoleParticipant UTF8String ] ) );
        obj.Set( Napi::String::New( env, "UbiquitousSharedItemRole" ), ubiquitousSharedItemRole );

        Napi::Object ubiquitousSharedItemPermissions = Napi::Object::New( env );
            ubiquitousSharedItemPermissions.Set( Napi::String::New( env, "ReadOnly" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemPermissionsReadOnly UTF8String ] ) );
            ubiquitousSharedItemPermissions.Set( Napi::String::New( env, "ReadWrite" ), Napi::String::New( env, [ NSURLUbiquitousSharedItemPermissionsReadWrite UTF8String ] ) );
        obj.Set( Napi::String::New( env, "UbiquitousSharedItemPermissions" ), ubiquitousSharedItemPermissions );
    }

    if( @available( macOS 10.15, * ) ) { } else if( @available( macOS 10.10, * ) ) {
        obj.Set( Napi::String::New( env, "ThumbnailKey" ), Napi::String::New( env, [ NSURLThumbnailKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "ThumnailDictionaryKey" ), Napi::String::New( env, [ NSURLThumbnailDictionaryKey UTF8String ] ) );
    }

    if( @available( macOS 10.12, * ) ) {
        Napi::Object thumbnailDictionaryItem = Napi::Object::New( env );
            thumbnailDictionaryItem.Set( Napi::String::New( env, "1024x1024SizeKey" ), Napi::String::New( env, [ NSThumbnail1024x1024SizeKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "ThumbnailDictionaryItem" ), thumbnailDictionaryItem );
    }

    obj.Set( Napi::String::New( env, "KeysOfUnsetValuesKey" ), Napi::String::New( env, [ NSURLKeysOfUnsetValuesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "QuarantinePropertiesKey" ), Napi::String::New( env, [ NSURLQuarantinePropertiesKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "AddedToDirectoryDateKey" ), Napi::String::New( env, [ NSURLAddedToDirectoryDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "AttributeModificationDateKey" ), Napi::String::New( env, [ NSURLAttributeModificationDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "ContentAccessDateKey" ), Napi::String::New( env, [ NSURLContentAccessDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "ContentModificationDateKey" ), Napi::String::New( env, [ NSURLContentModificationDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "CreationDateKey" ), Napi::String::New( env, [ NSURLCreationDateKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "CustomIconKey" ), Napi::String::New( env, [ NSURLCustomIconKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "DocumentIdentifierKey" ), Napi::String::New( env, [ NSURLDocumentIdentifierKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "EffectiveIconKey" ), Napi::String::New( env, [ NSURLEffectiveIconKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "GenerationIdentifierKey" ), Napi::String::New( env, [ NSURLGenerationIdentifierKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "HasHiddenExtensionKey" ), Napi::String::New( env, [ NSURLHasHiddenExtensionKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsExcludedFromBackupKey" ), Napi::String::New( env, [ NSURLIsExcludedFromBackupKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsExecutableKey" ), Napi::String::New( env, [ NSURLIsExecutableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsHiddenKey" ), Napi::String::New( env, [ NSURLIsHiddenKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsReadableKey" ), Napi::String::New( env, [ NSURLIsReadableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsSymbolicLinkKey" ), Napi::String::New( env, [ NSURLIsSymbolicLinkKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsSystemImmutableKey" ), Napi::String::New( env, [ NSURLIsSystemImmutableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsUserImmutableKey" ), Napi::String::New( env, [ NSURLIsUserImmutableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "IsWritableKey" ), Napi::String::New( env, [ NSURLIsWritableKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LabelColorKey" ), Napi::String::New( env, [ NSURLLabelColorKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LabelNumberKey" ), Napi::String::New( env, [ NSURLLabelNumberKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LinkCountKey" ), Napi::String::New( env, [ NSURLLinkCountKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LocalizedLabelKey" ), Napi::String::New( env, [ NSURLLocalizedLabelKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LocalizedNameKey" ), Napi::String::New( env, [ NSURLLocalizedNameKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "LocalizedTypeDescriptionKey" ), Napi::String::New( env, [ NSURLLocalizedTypeDescriptionKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "NameKey" ), Napi::String::New( env, [ NSURLNameKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "PathKey" ), Napi::String::New( env, [ NSURLPathKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "CanonicalPathKey" ), Napi::String::New( env, [ NSURLCanonicalPathKey UTF8String ] ) );
    obj.Set( Napi::String::New( env, "TagNamesKey" ), Napi::String::New( env, [ NSURLTagNamesKey UTF8String ] ) );

    if( @available( macOS 10.16, * ) ) {
        obj.Set( Napi::String::New( env, "ContentTypeKey" ), Napi::String::New( env, [ NSURLContentTypeKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "FileContentIdentifierKey" ), Napi::String::New( env, [ NSURLFileContentIdentifierKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "IsPurgeableKey" ), Napi::String::New( env, [ NSURLIsPurgeableKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "IsSparseKey" ), Napi::String::New( env, [ NSURLIsSparseKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "MayHaveExtendedAttributesKey" ), Napi::String::New( env, [ NSURLMayHaveExtendedAttributesKey UTF8String ] ) );
        obj.Set( Napi::String::New( env, "MayShareFileContentKey" ), Napi::String::New( env, [ NSURLMayShareFileContentKey UTF8String ] ) );
    }

    if( @available( macOS 11.3, * ) ) {
        obj.Set( Napi::String::New( env, "UbiquitousItemIsExcludedFromSyncKey" ), Napi::String::New( env, [ NSURLUbiquitousItemIsExcludedFromSyncKey UTF8String ] ) );
    }


    if( @available( macOS 10.16, * ) ) {
        obj.Set( Napi::String::New( env, "VolumeSupportsFileProtectionKey" ), Napi::String::New( env, [ NSURLVolumeSupportsFileProtectionKey UTF8String ] ) );
    }

    return obj;
}


NSObject* getResourceValueShared( std::string path, std::string key ) {
    @autoreleasepool {

        NSURL* nsUrl = [ NSURL fileURLWithPath: [ NSString stringWithUTF8String: path.c_str() ] ];
        NSString* nsKey = [ NSString stringWithUTF8String: key.c_str() ];

        NSError* error = nil;
        NSObject* val = nil;

        [ nsUrl getResourceValue: &val forKey: nsKey error: &error ];

        if( error != nil ) {
            throw std::runtime_error( error.localizedDescription.UTF8String );
        } else {
            return val;
        }
    }
}

Napi::Value LibICloudDrive::Foundation::URL::getResourceValue( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();
    try {
        if( info.Length()!=2 ) {
            throw Napi::RangeError::New( env, "Expected two string arguments." );
        }
        if( ! info[0].IsString() ) {
            throw Napi::TypeError::New( env, "Expected first argument to be a string." );
        }
        if( ! info[1].IsString() ) {
            throw Napi::TypeError::New( env, "Expected second argument to be a string." );
        }
    } catch( Napi::Error err ) {
        Napi::Promise::Deferred deferredPromise = Napi::Promise::Deferred::New( env );
        deferredPromise.Reject( err.Value() );
        return deferredPromise.Promise();
    }
    std::string path = info[0].As<Napi::String>().Utf8Value();
    std::string key = info[1].As<Napi::String>().Utf8Value();


    class GetResourceValueRunnable : public NSObjectPromiseWorker::Runnable {
        public:
            GetResourceValueRunnable( std::string path, std::string key ): NSObjectPromiseWorker::Runnable(), path( path ), key( key ) {
                if( Debug::Logging) { NSLog( @"GetResourceValueRunnable::GetResourceValueRunnable()" ); }
            }

            ~GetResourceValueRunnable() {
                if( Debug::Logging) { NSLog( @"GetResourceValueRunnable::~GetResourceValueRunnable()" ); }
            }

            NSObject* run() {
                if( Debug::Logging) { NSLog( @"GetResourceValueRunnable::run()" ); }
                return getResourceValueShared( this->path, this->key );
            }
        
        private:
            std::string path;
            std::string key;
    };

    Napi::Promise promise = NSObjectPromiseWorker::run( env, new GetResourceValueRunnable( path, key ) );
    return promise;
}


Napi::Value LibICloudDrive::Foundation::URL::getResourceValueSync( const Napi::CallbackInfo& info ) {
    Napi::Env env = info.Env();

    if( info.Length()!=2 ) {
        throw Napi::RangeError::New( env, "Expected two string arguments." );
    }
    if( ! info[0].IsString() ) {
        throw Napi::TypeError::New( env, "Expected first argument to be a string." );
    }
    if( ! info[1].IsString() ) {
        throw Napi::TypeError::New( env, "Expected second argument to be a string." );
    }

    std::string path = info[0].As<Napi::String>().Utf8Value();
    std::string key = info[1].As<Napi::String>().Utf8Value();
    
    try {
        return NSObjectToNapiValue( env, getResourceValueShared( path, key ) );
    } catch( std::exception &ex ) {
        throw Napi::TypeError::New( env, ex.what() );
    }
}



Napi::Object LibICloudDrive::Foundation::URL::Init( Napi::Env env, Napi::Object exports ) {
	Napi::Object url = Napi::Object::New( env );
		url.Set( Napi::String::New( env, "getResourceValue" ), Napi::Function::New( env, URL::getResourceValue ) );
		url.Set( Napi::String::New( env, "getResourceValueSync" ), Napi::Function::New( env, URL::getResourceValueSync ) );
        url.Set( Napi::String::New( env, "ResourceKeys" ), ResourceKeys( env ) );
	// exports.Set( Napi::String::New( env, "URL" ), url );
	exports.Set( Napi::String::New( env, "URL" ), url );
  return exports;
}