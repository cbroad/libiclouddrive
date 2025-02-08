import { PromiseAndCallback } from "../util";

import Path from "path";

import * as FileManager from "./FileManager";
import * as MetadataItem from "./MetadataItem";
import * as URL from "./URL";

const PROJECT_ROOT = Path.resolve(__dirname, "../../..");

export type RawFoundation = {
    FileManager: typeof FileManager;
    MetadataItem: typeof MetadataItem;
    URL: typeof URL;
};

export const RawFoundation: RawFoundation = process.platform === "darwin"
    ? require(Path.resolve(PROJECT_ROOT, "build/Release/iclouddrive.node"))
    : {
        FileManager,
        MetadataItem,
        URL
    };

export type Foundation = {
    FileManager: {
        downloadUbiquitousItem(path: string): Promise<boolean>;
        downloadUbiquitousItem(path: string, callback: (err?: Error | string | undefined, result?: boolean) => unknown): void;
        downloadUbiquitousItemSync(path: string): boolean;
        evictUbiquitousItem(path: string): Promise<boolean>;
        evictUbiquitousItem(path: string, callback: (err?: Error | string | undefined, result?: boolean) => unknown): void;
        evictUbiquitousItemSync(path: string): boolean;
        isUbiquitousItem(path: string): Promise<boolean>;
        isUbiquitousItem(path: string, callback: (err?: Error | string | undefined, result?: boolean) => unknown): void;
        isUbiquitousItemSync(path: string): boolean;
    };
    MetadataItem: {
        allValuesForAttributes(path: string): Promise<Record<string, any>>;
        allValuesForAttributes(path: string, callback: (err?: Error | string | undefined, result?: Record<string, any>) => unknown): void;
        allValuesForAttributesSync(path: string): Record<string, any>;
        attributes(path: string): Promise<string[]>;
        attributes(path: string, callback: (err?: Error | string | undefined, result?: string[]) => unknown): void;
        attributesSync(path: string): string[];
        valueForAttribute(path: string, key: string): Promise<any>;
        valueForAttribute(path: string, key: string, callback: (err?: Error | string | undefined, result?: any) => unknown): void;
        valueForAttributeSync(path: string, key: string): any;
        valuesForAttributes(path: string, keys: string[]): Promise<Record<string, any>>;
        valuesForAttributes(path: string, callback: (err?: Error | string | undefined, result?: Record<string, any>) => unknown): void;
        valuesForAttributesSync(path: string, keys: string[]): Record<string, any>;
    };
    URL: {
        getResourceValue(path: string, key: string): Promise<any>;
        getResourceValue(path: string, key: string, callback: (err?: Error | string | undefined, result?: any) => unknown): void;
        getResourceValueSync(path: string, key: string): any;
        ResourceKeys: URL.ResourceKeys;
    };
};

export const Foundation: Foundation = {
    FileManager: {
        downloadUbiquitousItem: (
            (path: string, callback?: (err?: NodeJS.ErrnoException | string, result?: boolean) => unknown): void | Promise<boolean> => {
                return PromiseAndCallback({ args: [path], callback, target: RawFoundation.FileManager.downloadUbiquitousItem, });
            }
        ) as typeof Foundation.FileManager.downloadUbiquitousItem,
        downloadUbiquitousItemSync: RawFoundation.FileManager.downloadUbiquitousItemSync,

        evictUbiquitousItem: (
            (path: string, callback?: (err?: NodeJS.ErrnoException | string, result?: boolean) => unknown): void | Promise<boolean> => {
                return PromiseAndCallback({ args: [path], callback, target: RawFoundation.FileManager.evictUbiquitousItem, });
            }
        ) as typeof Foundation.FileManager.evictUbiquitousItem,
        evictUbiquitousItemSync: RawFoundation.FileManager.evictUbiquitousItemSync,

        isUbiquitousItem: (
            (path: string, callback?: (err?: NodeJS.ErrnoException | string, result?: boolean) => unknown): void | Promise<boolean> => {
                return PromiseAndCallback({ args: [path], callback, target: RawFoundation.FileManager.isUbiquitousItem, });
            }
        ) as typeof Foundation.FileManager.isUbiquitousItem,
        isUbiquitousItemSync: RawFoundation.FileManager.isUbiquitousItemSync,
    },
    MetadataItem: {
        allValuesForAttributes: (
            (path: string, callback?: (err?: NodeJS.ErrnoException | string, result?: Record<string, any>) => unknown): void | Promise<Record<string, any>> => {
                return PromiseAndCallback({ args: [path], callback, target: RawFoundation.MetadataItem.allValuesForAttributes, });
            }
        ) as typeof Foundation.MetadataItem.allValuesForAttributes,
        allValuesForAttributesSync: RawFoundation.MetadataItem.allValuesForAttributesSync,

        attributes: (
            (path: string, callback?: (err?: NodeJS.ErrnoException | string, result?: string[]) => unknown): void | Promise<string[]> => {
                return PromiseAndCallback({ args: [path], callback, target: RawFoundation.MetadataItem.attributes, });
            }
        ) as typeof Foundation.MetadataItem.attributes,
        attributesSync: RawFoundation.MetadataItem.attributesSync,

        valueForAttribute: (
            (path: string, key: string, callback?: (err?: NodeJS.ErrnoException | string, result?: any) => void): void | Promise<any> => {
                return PromiseAndCallback({ args: [path, key], callback, target: RawFoundation.MetadataItem.valueForAttribute, });
            }
        ) as typeof Foundation.MetadataItem.valueForAttribute,
        valueForAttributeSync: RawFoundation.MetadataItem.valueForAttributeSync,

        valuesForAttributes: (
            (path: string, keys: string[], callback?: (err?: NodeJS.ErrnoException | string, result?: { [key: string]: any }) => void): void | Promise<{ [key: string]: any }> => {
                return PromiseAndCallback({ args: [path, keys], callback, target: RawFoundation.MetadataItem.valuesForAttributes, });
            }
        ) as typeof Foundation.MetadataItem.valuesForAttributes,
        valuesForAttributesSync: RawFoundation.MetadataItem.valuesForAttributesSync,

    },
    URL: {
        getResourceValue: (
            (path: string, key: string, callback?: (err?: NodeJS.ErrnoException | string, result?: any) => unknown): void | Promise<any> => {
                return PromiseAndCallback({ args: [path, key], callback, target: RawFoundation.URL.getResourceValue, });
            }
        ) as typeof Foundation.URL.getResourceValue,
        getResourceValueSync: RawFoundation.URL.getResourceValueSync,
        ResourceKeys: RawFoundation.URL.ResourceKeys as URL.ResourceKeys,
    },
};