export type ResourceKeys = {

    // Application Keys
    IsApplicationKey: "NSURLIsApplicationKey",
    ApplicationIsScriptableKey: "NSURLApplicationIsScriptableKey",

    // Directory Keys
    IsDirectoryKey: "NSURLIsDirectoryKey",
    ParentDirectoryURLKey: "NSURLParentDirectoryURLKey",

    // File Keys
    FileAllocatedSizeKey: "NSURLFileAllocatedSizeKey",
    FileProtectionKey: "NSURLFileProtectionKey",
    FileProtectionType?: {
        Complete: "NSURLFileProtectionComplete",
        CompleteUnlessOpen: "NSURLFileProtectionCompleteUnlessOpen",
        CompleteUntilFirstUserAuthentication: "NSURLFileProtectionCompleteUntilFirstUserAuthentication",
        None: "NSURLFileProtectionNone",
    },
    FileResourceIdentifierKey: "NSURLFileResourceIdentifierKey",
    FileResourceTypeKey: "NSURLFileResourceTypeKey",
    FileResourceType: {
        NamedPipe: "NSURLFileResourceTypeNamedPipe",
        CharacterSpecial: "NSURLFileResourceTypeCharacterSpecial",
        Directory: "NSURLFileResourceTypeDirectory",
        BlockSpecial: "NSURLFileResourceTypeBlockSpecial",
        Regular: "NSURLFileResourceTypeRegular",
        SymbolicLink: "NSURLFileResourceTypeSymbolicLink",
        Socket: "NSURLFileResourceTypeSocket",
        Unknown: "NSURLFileResourceTypeUnknown",
    },
    FileSecurityKey: "NSURLFileSecurityKey",
    FileSizeKey: "NSURLFileSizeKey",
    IsAliasFileKey: "NSURLIsAliasFileKey",
    IsPackageKey: "NSURLIsPackageKey",
    IsRegularFileKey: "NSURLIsRegularFileKey",
    PreferredIOBlockSizeKey: "NSURLPreferredIOBlockSizeKey",
    TotalFileAllocatedSizeKey: "NSURLTotalFileAllocatedSizeKey",
    TotalFileSizeKey: "NSURLTotalFileSizeKey",

    // Volume Capacity Keys
    VolumeAvailableCapacityKey: "NSURLVolumeAvailableCapacityKey",
    VolumeAvailableCapacityForImportantUsageKey?: "NSURLVolumeAvailableCapacityForImportantUsageKey",
    VolumeAvailableCapacityForOpportunisticUsageKey?: "NSURLVolumeAvailableCapacityForOpportunisticUsageKey",
    VolumeTotalCapacityKey: "NSURLVolumeTotalCapacityKey",

    // Volume Status Keys
    VolumeIsAutomountedKey: "NSURLVolumeIsAutomountedKey",
    VolumeIsBrowsableKey: "NSURLVolumeIsBrowsableKey",
    VolumeIsEjectableKey: "NSURLVolumeIsEjectableKey",
    VolumeIsEncryptedKey: "NSURLVolumeIsEncryptedKey",
    VolumeIsInternalKey: "NSURLVolumeIsInternalKey",
    VolumeIsJournalingKey: "NSURLVolumeIsJournalingKey",
    VolumeIsLocalKey: "NSURLVolumeIsLocalKey",
    VolumeIsReadOnlyKey: "NSURLVolumeIsReadOnlyKey",
    VolumeIsRemovableKey: "NSURLVolumeIsRemovableKey",
    VolumeIsRootFileSystemKey: "NSURLVolumeIsRootFileSystemKey",

    // Volume Support Keys
    IsMountTriggerKey: "NSURLIsMountTriggerKey",
    IsVolumeKey: "NSURLIsVolumeKey",
    VolumeCreationDateKey: "NSURLVolumeCreationDateKey",
    VolumeIdentifierKey: "NSURLVolumeIdentifierKey",
    VolumeLocalizedFormatDescriptionKey: "NSURLVolumeLocalizedFormatDescriptionKey",
    VolumeLocalizedNameKey: "NSURLVolumeLocalizedNameKey",
    VolumeMaximumFileSizeKey: "NSURLVolumeMaximumFileSizeKey",
    VolumeNameKey: "NSURLVolumeNameKey",
    VolumeResourceCountKey: "NSURLVolumeResourceCountKey",
    VolumeSupportsAccessPermissionsKey?: "NSURLVolumeSupportsAccessPermissionsKey",
    VolumeSupportsAdvisoryFileLockingKey: "NSURLVolumeSupportsAdvisoryFileLockingKey",
    VolumeSupportsCasePreservedNamesKey: "NSURLVolumeSupportsCasePreservedNamesKey",
    VolumeSupportsCaseSensitiveNamesKey: "NSURLVolumeSupportsCaseSensitiveNamesKey",
    VolumeSupportsCompressionKey: "NSURLVolumeSupportsCompressionKey",
    VolumeSupportsExclusiveRenamingKey: "NSURLVolumeSupportsExclusiveRenamingKey",
    VolumeSupportsExtendedSecurityKey: "NSURLVolumeSupportsExtendedSecurityKey",
    VolumeSupportsFileCloningKey: "NSURLVolumeSupportsFileCloningKey",
    VolumeSupportsHardLinksKey: "NSURLVolumeSupportsHardLinksKey",
    VolumeSupportsImmutableFilesKey?: "NSURLVolumeSupportsImmutableFilesKey",
    VolumeSupportsJournalingKey: "NSURLVolumeSupportsJournalingKey",
    VolumeSupportsPersistentIDsKey: "NSURLVolumeSupportsPersistentIDsKey",
    VolumeSupportsRenamingKey: "NSURLVolumeSupportsRenamingKey",
    VolumeSupportsRootDirectoryDatesKey: "NSURLVolumeSupportsRootDirectoryDatesKey",
    VolumeSupportsSparseFilesKey: "NSURLVolumeSupportsSparseFilesKey",
    VolumeSupportsSwapRenamingKey: "NSURLVolumeSupportsSwapRenamingKey",
    VolumeSupportsSymbolicLinksKey: "NSURLVolumeSupportsSymbolicLinksKey",
    VolumeSupportsVolumeSizesKey: "NSURLVolumeSupportsVolumeSizesKey",
    VolumeSupportsZeroRunsKey: "NSURLVolumeSupportsZeroRunsKey",
    VolumeURLForRemountingKey: "NSURLVolumeURLForRemountingKey",
    VolumeURLKey: "NSURLVolumeURLKey",
    VolumeUUIDStringKey: "NSURLVolumeUUIDStringKey",

    // Ubiquitous Keys
    IsUbiquitousItemKey: "NSURLIsUbiquitousItemKey",
    UbiquitousSharedItemMostRecentEditorNameComponentsKey: "NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey",
    UbiquitousItemDownloadRequestedKey: "NSURLUbiquitousItemDownloadRequestedKey",
    UbiquitousItemIsDownloadingKey: "NSURLUbiquitousItemIsDownloadingKey",
    UbiquitousItemDownloadingErrorKey: "NSURLUbiquitousItemDownloadingErrorKey",
    UbiquitousItemDownloadingStatusKey: "NSURLUbiquitousItemDownloadingStatusKey",
    UbiquitousItemDownloadingStatus: {
        Current: "NSURLUbiquitousItemDownloadingStatusCurrent",
        Downloaded: "NSURLUbiquitousItemDownloadingStatusDownloaded",
        NotDownloaded: "NSURLUbiquitousItemDownloadingStatusNotDownloaded",
    },
    UbiquitousItemIsUploadedKey: "NSURLUbiquitousItemIsUploadedKey",
    UbiquitousItemIsUploadingKey: "NSURLUbiquitousItemIsUploadingKey",
    UbiquitousItemUploadingErrorKey: "NSURLUbiquitousItemUploadingErrorKey",
    UbiquitousItemHasUnresolvedConflictsKey: "NSURLUbiquitousItemHasUnresolvedConflictsKey",
    UbiquitousItemContainerDisplayNameKey: "NSURLUbiquitousItemContainerDisplayNameKey",
    UbiquitousSharedItemOwnerNameComponentsKey: "NSURLUbiquitousSharedItemOwnerNameComponentsKey",
    UbiquitousSharedItemCurrentUserPermissionsKey: "NSURLUbiquitousSharedItemCurrentUserPermissionsKey",
    UbiquitousSharedItemCurrentUserRoleKey: "NSURLUbiquitousSharedItemCurrentUserRoleKey",
    UbiquitousItemIsSharedKey: "NSURLUbiquitousItemIsSharedKey",
    UbiquitousSharedItemRole?: {
        Owner: "NSURLUbiquitousSharedItemRoleOwner",
        Participant: "NSURLUbiquitousSharedItemRoleParticipant",
    },
    UbiquitousSharedItemPermissions?: {
        ReadOnly: "NSURLUbiquitousSharedItemPermissionsReadOnly",
        ReadWrite: "NSURLUbiquitousSharedItemPermissionsReadWrite",
    },

    // Thumbnail Keys
    ThumbnailKey: "NSURLThumbnailKey",
    ThumbnailDictionaryKey: "NSURLThumbnailDictionaryKey",
    ThumbnailDictionaryItem?: {
        "1024x1024SizeKey": "NSThumbnail1024x1024SizeKey",
    },

    // Other Resource Keys
    KeysOfUnsetValuesKey: "NSURLKeysOfUnsetValuesKey",
    QuarantinePropertiesKey: "NSURLQuarantinePropertiesKey",
    AddedToDirectoryDateKey: "NSURLAddedToDirectoryDateKey",
    AttributeModificationDateKey: "NSURLAttributeModificationDateKey",
    ContentAccessDateKey: "NSURLContentAccessDateKey",
    ContentModificationDateKey: "NSURLContentModificationDateKey",
    CreationDateKey: "NSURLCreationDateKey",
    CustomIconKey: "NSURLCustomIconKey",
    DocumentIdentifierKey: "NSURLDocumentIdentifierKey",
    EffectiveIconKey: "NSURLEffectiveIconKey",
    GenerationIdentifierKey: "NSURLGenerationIdentifierKey",
    HasHiddenExtensionKey: "NSURLHasHiddenExtensionKey",
    IsExcludedFromBackupKey: "NSURLIsExcludedFromBackupKey",
    IsExecutableKey: "NSURLIsExecutableKey",
    IsHiddenKey: "NSURLIsHiddenKey",
    IsReadableKey: "NSURLIsReadableKey",
    IsSymbolicLinkKey: "NSURLIsSymbolicLinkKey",
    IsSystemImmutableKey: "NSURLIsSystemImmutableKey",
    IsUserImmutableKey: "NSURLIsUserImmutableKey",
    IsWritableKey: "NSURLIsWritableKey",
    LabelColorKey: "NSURLLabelColorKey",
    LabelNumberKey: "NSURLLabelNumberKey",
    LinkCountKey: "NSURLLinkCountKey",
    LocalizedLabelKey: "NSURLLocalizedLabelKey",
    LocalizedNameKey: "NSURLLocalizedNameKey",
    LocalizedTypeDescriptionKey: "NSURLLocalizedTypeDescriptionKey",
    NameKey: "NSURLNameKey",
    PathKey: "NSURLPathKey",
    CanonicalPathKey: "NSURLCanonicalPathKey",
    TagNamesKey: "NSURLTagNamesKey",
    ContentTypeKey?: "NSURLContentTypeKey",
    // Type Properties
    FileContentIdentifierKey?: "NSURLFileContentIdentifierKey",
    IsPurgeableKey?: "NSURLIsPurgeableKey",
    IsSparseKey?: "NSURLIsSparseKey",
    MayHaveExtendedAttributesKey?: "NSURLMayHaveExtendedAttributesKey",
    MayShareFileContentKey?: "NSURLMayShareFileContentKey",
    UbiquitousItemIsExcludedFromSyncKey?: "NSURLUbiquitousItemIsExcludedFromSyncKey",
    VolumeSupportsFileProtectionKey?: "NSURLVolumeSupportsFileProtectionKey",
};

export const ResourceKeys = {

    // Application Keys
    IsApplicationKey: "NSURLIsApplicationKey",
    ApplicationIsScriptableKey: "NSURLApplicationIsScriptableKey",

    // Directory Keys
    IsDirectoryKey: "NSURLIsDirectoryKey",
    ParentDirectoryURLKey: "NSURLParentDirectoryURLKey",

    // File Keys
    FileAllocatedSizeKey: "NSURLFileAllocatedSizeKey",
    FileProtectionKey: "NSURLFileProtectionKey",
    FileProtectionType: {
        Complete: "NSURLFileProtectionComplete",
        CompleteUnlessOpen: "NSURLFileProtectionCompleteUnlessOpen",
        CompleteUntilFirstUserAuthentication: "NSURLFileProtectionCompleteUntilFirstUserAuthentication",
        None: "NSURLFileProtectionNone",
    },
    FileResourceIdentifierKey: "NSURLFileResourceIdentifierKey",
    FileResourceTypeKey: "NSURLFileResourceTypeKey",
    FileResourceType: {
        NamedPipe: "NSURLFileResourceTypeNamedPipe",
        CharacterSpecial: "NSURLFileResourceTypeCharacterSpecial",
        Directory: "NSURLFileResourceTypeDirectory",
        BlockSpecial: "NSURLFileResourceTypeBlockSpecial",
        Regular: "NSURLFileResourceTypeRegular",
        SymbolicLink: "NSURLFileResourceTypeSymbolicLink",
        Socket: "NSURLFileResourceTypeSocket",
        Unknown: "NSURLFileResourceTypeUnknown",
    },
    FileSecurityKey: "NSURLFileSecurityKey",
    FileSizeKey: "NSURLFileSizeKey",
    IsAliasFileKey: "NSURLIsAliasFileKey",
    IsPackageKey: "NSURLIsPackageKey",
    IsRegularFileKey: "NSURLIsRegularFileKey",
    PreferredIOBlockSizeKey: "NSURLPreferredIOBlockSizeKey",
    TotalFileAllocatedSizeKey: "NSURLTotalFileAllocatedSizeKey",
    TotalFileSizeKey: "NSURLTotalFileSizeKey",

    // Volume Capacity Keys
    VolumeAvailableCapacityKey: "NSURLVolumeAvailableCapacityKey",
    VolumeAvailableCapacityForImportantUsageKey: "NSURLVolumeAvailableCapacityForImportantUsageKey",
    VolumeAvailableCapacityForOpportunisticUsageKey: "NSURLVolumeAvailableCapacityForOpportunisticUsageKey",
    VolumeTotalCapacityKey: "NSURLVolumeTotalCapacityKey",

    // Volume Status Keys
    VolumeIsAutomountedKey: "NSURLVolumeIsAutomountedKey",
    VolumeIsBrowsableKey: "NSURLVolumeIsBrowsableKey",
    VolumeIsEjectableKey: "NSURLVolumeIsEjectableKey",
    VolumeIsEncryptedKey: "NSURLVolumeIsEncryptedKey",
    VolumeIsInternalKey: "NSURLVolumeIsInternalKey",
    VolumeIsJournalingKey: "NSURLVolumeIsJournalingKey",
    VolumeIsLocalKey: "NSURLVolumeIsLocalKey",
    VolumeIsReadOnlyKey: "NSURLVolumeIsReadOnlyKey",
    VolumeIsRemovableKey: "NSURLVolumeIsRemovableKey",
    VolumeIsRootFileSystemKey: "NSURLVolumeIsRootFileSystemKey",

    // Volume Support Keys
    IsMountTriggerKey: "NSURLIsMountTriggerKey",
    IsVolumeKey: "NSURLIsVolumeKey",
    VolumeCreationDateKey: "NSURLVolumeCreationDateKey",
    VolumeIdentifierKey: "NSURLVolumeIdentifierKey",
    VolumeLocalizedFormatDescriptionKey: "NSURLVolumeLocalizedFormatDescriptionKey",
    VolumeLocalizedNameKey: "NSURLVolumeLocalizedNameKey",
    VolumeMaximumFileSizeKey: "NSURLVolumeMaximumFileSizeKey",
    VolumeNameKey: "NSURLVolumeNameKey",
    VolumeResourceCountKey: "NSURLVolumeResourceCountKey",
    VolumeSupportsAccessPermissionsKey: "NSURLVolumeSupportsAccessPermissionsKey",
    VolumeSupportsAdvisoryFileLockingKey: "NSURLVolumeSupportsAdvisoryFileLockingKey",
    VolumeSupportsCasePreservedNamesKey: "NSURLVolumeSupportsCasePreservedNamesKey",
    VolumeSupportsCaseSensitiveNamesKey: "NSURLVolumeSupportsCaseSensitiveNamesKey",
    VolumeSupportsCompressionKey: "NSURLVolumeSupportsCompressionKey",
    VolumeSupportsExclusiveRenamingKey: "NSURLVolumeSupportsExclusiveRenamingKey",
    VolumeSupportsExtendedSecurityKey: "NSURLVolumeSupportsExtendedSecurityKey",
    VolumeSupportsFileCloningKey: "NSURLVolumeSupportsFileCloningKey",
    VolumeSupportsHardLinksKey: "NSURLVolumeSupportsHardLinksKey",
    VolumeSupportsImmutableFilesKey: "NSURLVolumeSupportsImmutableFilesKey",
    VolumeSupportsJournalingKey: "NSURLVolumeSupportsJournalingKey",
    VolumeSupportsPersistentIDsKey: "NSURLVolumeSupportsPersistentIDsKey",
    VolumeSupportsRenamingKey: "NSURLVolumeSupportsRenamingKey",
    VolumeSupportsRootDirectoryDatesKey: "NSURLVolumeSupportsRootDirectoryDatesKey",
    VolumeSupportsSparseFilesKey: "NSURLVolumeSupportsSparseFilesKey",
    VolumeSupportsSwapRenamingKey: "NSURLVolumeSupportsSwapRenamingKey",
    VolumeSupportsSymbolicLinksKey: "NSURLVolumeSupportsSymbolicLinksKey",
    VolumeSupportsVolumeSizesKey: "NSURLVolumeSupportsVolumeSizesKey",
    VolumeSupportsZeroRunsKey: "NSURLVolumeSupportsZeroRunsKey",
    VolumeURLForRemountingKey: "NSURLVolumeURLForRemountingKey",
    VolumeURLKey: "NSURLVolumeURLKey",
    VolumeUUIDStringKey: "NSURLVolumeUUIDStringKey",

    // Ubiquitous Keys
    IsUbiquitousItemKey: "NSURLIsUbiquitousItemKey",
    UbiquitousSharedItemMostRecentEditorNameComponentsKey: "NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey",
    UbiquitousItemDownloadRequestedKey: "NSURLUbiquitousItemDownloadRequestedKey",
    UbiquitousItemIsDownloadingKey: "NSURLUbiquitousItemIsDownloadingKey",
    UbiquitousItemDownloadingErrorKey: "NSURLUbiquitousItemDownloadingErrorKey",
    UbiquitousItemDownloadingStatusKey: "NSURLUbiquitousItemDownloadingStatusKey",
    UbiquitousItemDownloadingStatus: {
        Current: "NSURLUbiquitousItemDownloadingStatusCurrent",
        Downloaded: "NSURLUbiquitousItemDownloadingStatusDownloaded",
        NotDownloaded: "NSURLUbiquitousItemDownloadingStatusNotDownloaded",
    },
    UbiquitousItemIsUploadedKey: "NSURLUbiquitousItemIsUploadedKey",
    UbiquitousItemIsUploadingKey: "NSURLUbiquitousItemIsUploadingKey",
    UbiquitousItemUploadingErrorKey: "NSURLUbiquitousItemUploadingErrorKey",
    UbiquitousItemHasUnresolvedConflictsKey: "NSURLUbiquitousItemHasUnresolvedConflictsKey",
    UbiquitousItemContainerDisplayNameKey: "NSURLUbiquitousItemContainerDisplayNameKey",
    UbiquitousSharedItemOwnerNameComponentsKey: "NSURLUbiquitousSharedItemOwnerNameComponentsKey",
    UbiquitousSharedItemCurrentUserPermissionsKey: "NSURLUbiquitousSharedItemCurrentUserPermissionsKey",
    UbiquitousSharedItemCurrentUserRoleKey: "NSURLUbiquitousSharedItemCurrentUserRoleKey",
    UbiquitousItemIsSharedKey: "NSURLUbiquitousItemIsSharedKey",
    UbiquitousSharedItemRole: {
        Owner: "NSURLUbiquitousSharedItemRoleOwner",
        Participant: "NSURLUbiquitousSharedItemRoleParticipant",
    },
    UbiquitousSharedItemPermissions: {
        ReadOnly: "NSURLUbiquitousSharedItemPermissionsReadOnly",
        ReadWrite: "NSURLUbiquitousSharedItemPermissionsReadWrite",
    },

    // Thumbnail Keys
    ThumbnailKey: "NSURLThumbnailKey",
    ThumbnailDictionaryKey: "NSURLThumbnailDictionaryKey",
    ThumbnailDictionaryItem: {
        "1024x1024SizeKey": "NSThumbnail1024x1024SizeKey",
    },

    // Other Resource Keys
    KeysOfUnsetValuesKey: "NSURLKeysOfUnsetValuesKey",
    QuarantinePropertiesKey: "NSURLQuarantinePropertiesKey",
    AddedToDirectoryDateKey: "NSURLAddedToDirectoryDateKey",
    AttributeModificationDateKey: "NSURLAttributeModificationDateKey",
    ContentAccessDateKey: "NSURLContentAccessDateKey",
    ContentModificationDateKey: "NSURLContentModificationDateKey",
    CreationDateKey: "NSURLCreationDateKey",
    CustomIconKey: "NSURLCustomIconKey",
    DocumentIdentifierKey: "NSURLDocumentIdentifierKey",
    EffectiveIconKey: "NSURLEffectiveIconKey",
    GenerationIdentifierKey: "NSURLGenerationIdentifierKey",
    HasHiddenExtensionKey: "NSURLHasHiddenExtensionKey",
    IsExcludedFromBackupKey: "NSURLIsExcludedFromBackupKey",
    IsExecutableKey: "NSURLIsExecutableKey",
    IsHiddenKey: "NSURLIsHiddenKey",
    IsReadableKey: "NSURLIsReadableKey",
    IsSymbolicLinkKey: "NSURLIsSymbolicLinkKey",
    IsSystemImmutableKey: "NSURLIsSystemImmutableKey",
    IsUserImmutableKey: "NSURLIsUserImmutableKey",
    IsWritableKey: "NSURLIsWritableKey",
    LabelColorKey: "NSURLLabelColorKey",
    LabelNumberKey: "NSURLLabelNumberKey",
    LinkCountKey: "NSURLLinkCountKey",
    LocalizedLabelKey: "NSURLLocalizedLabelKey",
    LocalizedNameKey: "NSURLLocalizedNameKey",
    LocalizedTypeDescriptionKey: "NSURLLocalizedTypeDescriptionKey",
    NameKey: "NSURLNameKey",
    PathKey: "NSURLPathKey",
    CanonicalPathKey: "NSURLCanonicalPathKey",
    TagNamesKey: "NSURLTagNamesKey",
    ContentTypeKey: "NSURLContentTypeKey",
    // Type Properties
    FileContentIdentifierKey: "NSURLFileContentIdentifierKey",
    IsPurgeableKey: "NSURLIsPurgeableKey",
    IsSparseKey: "NSURLIsSparseKey",
    MayHaveExtendedAttributesKey: "NSURLMayHaveExtendedAttributesKey",
    MayShareFileContentKey: "NSURLMayShareFileContentKey",
    UbiquitousItemIsExcludedFromSyncKey: "NSURLUbiquitousItemIsExcludedFromSyncKey",
    VolumeSupportsFileProtectionKey: "NSURLVolumeSupportsFileProtectionKey",
};
