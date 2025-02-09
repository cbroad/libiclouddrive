import { OSXVersion } from "./util/OSXVersion";

export const OSX_VERSION = process.platform === "darwin" ? OSXVersion.get() : undefined;
export const SUPPORTED = !!OSX_VERSION && OSX_VERSION.atLeast("10.7");


