import { spawnSync } from "child_process";

const VersionPattern = /^(\d+)\.(\d+)(?:\.(\d+))?(?:(b|dp)(\d+))?$/i;

export class OSXVersion {

    get [Symbol.toStringTag](): string { return this.constructor.name };

    major: number;
    minor: number;
    patch: number | undefined;

    constructor(osxVersion: string) {
        const match = osxVersion.match(VersionPattern);
        if (match === null) {
            throw new Error("Invalid Input");
        } else {
            this.major = Number(match[1]);
            this.minor = Number(match[2]);
            if (match[3] !== undefined) {
                this.patch = Number(match[3]);
            }
        }

    }

    atLeast(version: OSXVersion | string): boolean {
        return this.compareTo(version) >= 0;
    }

    static compare(a: OSXVersion | string, b: OSXVersion | string): number {
        if (a === undefined || b === undefined) throw new Error("OSXVersion.compare(): invalid input")
        if (typeof (a) === "string") a = new OSXVersion(a);
        if (typeof (b) === "string") b = new OSXVersion(b);

        function runTest(prop: "major" | "minor" | "patch"): number {
            return ((a as OSXVersion)[prop] ?? 0) - ((b as OSXVersion)[prop] ?? 0);
        }

        return runTest("major") || runTest("minor") || runTest("patch") || 0;
    }

    compareTo(other: OSXVersion | string): number {
        return OSXVersion.compare(this, other);
    }

    static get(): OSXVersion | undefined {
        return localVersion;
    }

    newerThan(version: OSXVersion | string): boolean {
        return this.compareTo(version) > 0;
    }

    toJSON(): string {
        let str = `${this.major}.${this.minor}`;
        if (this.patch !== undefined) str = `${str}.${this.minor}`;
        return str;
    }
}

const localVersion: OSXVersion | undefined = (() => {
    if (process.platform !== "darwin") return undefined;
    const spawnResults = spawnSync("sw_vers");
    if (spawnResults.error) return undefined;
    const output = String(spawnResults.stdout);
    const outputObj = output.split("\n").reduce((R, line) => {
        if (line !== "") {
            const parts = line.split(":");
            R[parts[0].trim()] = parts[1].trim();
        }
        return R;
    }, {} as { [key: string]: string });
    const result = outputObj["ProductVersion"];
    if (result === undefined) throw new Error("there was a problem parsing sw_vers output");
    return new OSXVersion(result);
})();