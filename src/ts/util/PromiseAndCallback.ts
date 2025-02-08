/**
 * @typedef {Function} CallbackFunction
 * 
 * @param {Error|string|undefined} err set if an error has occurred
 * @param {any} val return value
 * @returns {any} this value will be ignored
 */

/**
 * @typedef {Function} PromiseFunction
 * 
 * @returns {Promise<any>} return value from function
 */


/**
 * @typedef {Object} PACParams
 * 
 * @property {any[]} args arguments for target function
 * @property {CallbackFunction} [callback] the promise from target function will be used to populate the function parameters
 * @property {PromiseFunction} target asynchronous function that being called.
 */

export type PACParams = {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: any) => unknown;
    target: (...args: any[]) => Promise<any>;
};


/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {PromiseFunction} params.target asynchronous function that being called.
 * @returns {Promise}
 */

export function PromiseAndCallback(params: {
    args: any[] | undefined;
    target: (...args: any[]) => Promise<any>;
}): Promise<any>;

/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {CallbackFunction} [params.callback] the promise from target function will be used to populate the function parameters
 * @param {PromiseFunction} params.target asynchronous function that being called.
 * @returns {undefined}
 */
export function PromiseAndCallback(params: {
    args: any[] | undefined;
    callback: (err?: Error | string | undefined, val?: any) => unknown;
    target: (...args: any[]) => Promise<any>;
}): undefined;

/**
 * Makes a promised-based asynchronous function work as callback asynchronous function as well.
 * 
 * @param {Object} params
 * 
 * @param {any[]} params.args arguments for target function
 * @param {CallbackFunction} [params.callback] (optional) the promise from target function will be used to populate the function parameters
 * @param {PromiseFunction} params.target asynchronous function that being called.
 * @returns {Promise|undefined} if a callback is defined, undefined is returned, otherwise a promise will be returned.
 */

export function PromiseAndCallback(params: {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: any) => unknown;
    target: (...args: any[]) => Promise<any>;
}): Promise<any> | undefined;
export function PromiseAndCallback(params: {
    args: any[] | undefined;
    callback?: (err?: Error | string | undefined, val?: any) => unknown;
    target: (...args: any[]) => Promise<any>;
}): Promise<any> | undefined {
    const { args = [], callback, target, } = params;
    if (callback == undefined) {
        return target(...args)
            .catch(async (errorMessage: string): Promise<void> => { throw new Error(errorMessage); });
    }
    target(...args)
        .then((val: any | undefined) => callback!(undefined, val))
        .catch((err: string | undefined) => callback(new Error(err), undefined));
}