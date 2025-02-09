/**
 * @typedef {Function} CallbackFunction<T>
 * 
 * @param {Error|string|undefined} err set if an error has occurred
 * @param {T} val return value
 * @returns {void} this value will be ignored
 */

/**
 * @typedef {Function} PromiseFunction<T>
 * 
 * @returns {Promise<T>} return value from function
 */


/**
 * @typedef {Object} PACParams
 * 
 * @property {any[]} args arguments for target function
 * @property {CallbackFunction} [callback] the promise from target function will be used to populate the function parameters
 * @property {PromiseFunction<T>} target asynchronous function that being called.
 */

export type PACParams<T, U extends T> = {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: U) => unknown;
    target: (...args: any[]) => Promise<T>;
};


/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {PromiseFunction<T>} params.target asynchronous function that being called.
 * @returns {Promise<T>}
 */

export function PromiseAndCallback<T>(params: {
    args: any[] | undefined;
    target: (...args: any[]) => Promise<T>;
}): Promise<T>;

/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {CallbackFunction<U extends T>} [params.callback] the promise from target function will be used to populate the function parameters
 * @param {PromiseFunction<T>} params.target asynchronous function that being called.
 * @returns {void}
 */
export function PromiseAndCallback<T, U extends T>(params: {
    args: any[] | undefined;
    callback: (err?: Error | string | undefined, val?: U) => unknown;
    target: (...args: any[]) => Promise<T>;
}): void;

/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {CallbackFunction<U extends T>} [params.callback] (optional) the promise from target function will be used to populate the function parameters
 * @param {PromiseFunction<T>} params.target asynchronous function that being called.
 * @returns {Promise<T>|void} if a callback is defined, undefined is returned, otherwise a promise will be returned.
 */

export function PromiseAndCallback<T, U extends T>(params: {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: U) => void;
    target: (...args: any[]) => Promise<T>;
}): Promise<T> | void;

export function PromiseAndCallback<T, U extends T>(params: {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: U) => void;
    target: (...args: any[]) => Promise<T>;
}): Promise<T> | void {
    const { args = [], target, } = params;
    let { callback } = params;
    let response: Promise<T> | undefined = undefined;
    if (!callback) {
        response = new Promise<T>((resolve, reject) => {
            callback = (err: Error | string | undefined, val?: T) => err && reject(err) || resolve(val!);
        });
    }
    target(...args)
        .then((val: T) => callback!(undefined, val as U))
        .catch(callback);
    return response;
}