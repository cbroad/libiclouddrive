import Path from "path";

import * as FoundationLibrary from "./Foundation";

export type Foundation = typeof FoundationLibrary;

const PROJECT_ROOT = Path.resolve(__dirname, "../..");

export const Foundation: Foundation = process.platform === "darwin"
    ? require(Path.resolve(PROJECT_ROOT, "build/Release/iclouddrive.node"))
    : FoundationLibrary;