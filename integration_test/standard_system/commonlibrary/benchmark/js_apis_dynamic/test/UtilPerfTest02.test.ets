/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe, it, TestType, Size, Level, beforeEach, afterAll, expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { util } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

function getArgs(...args: Object[]): Object {
  return args;
}

class Temperature implements util.ScopeComparable {
  private readonly _temp: number;

  constructor(value: number) {
    this._temp = value;
  }

  compareTo(value: Temperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): number {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export default function UtilPerfTest02(): void {
  describe('UtilPerfTest02', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('UtilPerfTest02_string_Base64Helper_encodeToStringSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101,
          100, 110, 111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117,
          116, 98, 121, 116, 104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102,
          114, 111, 109, 111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97,
          108, 117, 115, 116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116,
          104, 101, 115, 104, 111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97,
          114, 110, 97, 108, 112, 108, 101, 97, 115, 117, 114, 101]);
        let res = base64Helper.encodeToStringSync(array, util.Type.MIME);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = base64Helper.encodeToStringSync(array, util.Type.MIME);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_string_Base64Helper_encodeToStringSync_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64Helper', 'encodeToStringSync',
          'encodeToStringSync(src: Uint8Array, options?: Type): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_Uint8Array_decodeSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base64Helper = new util.Base64Helper();
        let buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\n' +
          'aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\n' +
          'aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
        let res: Uint8Array = new Uint8Array();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = base64Helper.decodeSync(buff, util.Type.MIME);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_Uint8Array_decodeSync_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64Helper', 'decodeSync',
          'decodeSync(src: Uint8Array | string, options?: Type): Uint8Array', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_Promise<Uint8Array>_encode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([115,49,51]);
        await base64Helper.encode(array);
        let res = await base64Helper.encode(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64Helper.encode(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_Promise<Uint8Array>_encode_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64Helper', 'encode',
          'encode(src: Uint8Array, options?: Type): Promise<Uint8Array>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_Promise<string>_encodeToString_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,
          104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,
          117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,
          110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,
          105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,
          115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,
          121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        await base64Helper.encodeToString(array, util.Type.MIME);
        let res: string = await base64Helper.encodeToString(array, util.Type.MIME);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64Helper.encodeToString(array, util.Type.MIME);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_Promise<string>_encodeToString_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64Helper', 'encodeToString',
          'encodeToString(src: Uint8Array, options?: Type): Promise<string>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_Promise<Uint8Array>_decode_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        let base64Helper = new util.Base64Helper();
        let array = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\n' +
          'aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\n' +
          'aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
        await base64Helper.decode(array, util.Type.MIME);
        let res = await base64Helper.decode(array, util.Type.MIME);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64Helper.decode(array, util.Type.MIME);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_Promise<Uint8Array>_decode_0500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64Helper', 'decode',
          'decode(src: Uint8Array | string, options?: Type): Promise<Uint8Array>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_String_StringDecoder_constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = new util.StringDecoder();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new util.StringDecoder();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_String_StringDecoder_constructor_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'StringDecoder', 'constructor',
          'constructor(encoding?: string)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_string_write_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let decoder = new util.StringDecoder('utf-8');
        let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let res = decoder.write(input);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = decoder.write(input);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_string_write_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'StringDecoder', 'write',
          'write(chunk: string | Uint8Array): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_string_end_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let decoder = new util.StringDecoder('utf-8');
        let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let res = decoder.end(input);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = decoder.end(input);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_string_end_0800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'StringDecoder', 'end',
          'end(chunk?: string | Uint8Array): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_Types_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = new util.types();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new util.types();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
          'UtilPerfTest02_Types_Constructor_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'Constructor',
          'constructor();', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isAnyArrayBuffer_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let arrayBuffer = new ArrayBuffer(0);
        let res = type.isAnyArrayBuffer(arrayBuffer);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isAnyArrayBuffer(arrayBuffer);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isAnyArrayBuffer_1000: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isAnyArrayBuffer',
          'isAnyArrayBuffer(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isArrayBufferView_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let int8Arr = new Int8Array([]);
        let res = type.isArrayBufferView(int8Arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isArrayBufferView(int8Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isArrayBufferView_1100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isArrayBufferView',
          'isArrayBufferView(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isArgumentsObject_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let args: Object = getArgs(1, 2, 3);
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isArgumentsObject(args);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isArgumentsObject_1200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isArgumentsObject',
          'isArgumentsObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isArrayBuffer_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let arrayBuffer = new ArrayBuffer(0);
        let res = type.isArrayBuffer(arrayBuffer);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isArrayBuffer(arrayBuffer);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isArrayBuffer_1300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isArrayBuffer',
          'isArrayBuffer(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isAsyncFunction_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let asyncFunc = async () => {};
        let res = type.isAsyncFunction(asyncFunc);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isAsyncFunction(asyncFunc);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isAsyncFunction_1400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isAsyncFunction',
          'isAsyncFunction(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isDataView_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        const ab = new ArrayBuffer(20);
        let dataView = new DataView(ab);
        let res = type.isDataView(dataView);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isDataView(dataView);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isDataView_1500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isDataView',
          'isDataView(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isDate_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let date = new Date();
        let res = type.isDate(date);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isDate(date);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isDate_1600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Types', 'isDate',
          'isDate(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    //it('UtilPerfTest02_boolean_isExternal_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //  (done: Function) => {
    //    let type = new util.types();
    //    const data = testNapi.testexternal();
    //    let res = type.isExternal(data);
    //    let Stime = systemDateTime.getTime(true);
    //    for (let i = 0; i < BASE_COUNT; i++) {
    //      res = type.isExternal(data);
    //    }
    //    let Dtime = systemDateTime.getTime(true) - Stime;
    //    let res1 = res;
    //    let arkTsAveragedTime = Dtime / BASE_COUNT;
    //    console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isExternal_1700: ' +
    //      arkTsAveragedTime + 'ns');
    //    performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isExternal',
    //      'isExternal(value: Object): boolean;', arkTsAveragedTime);
    //    expect(res).assertTrue();
    //    setTimeout(() => { done(); }, 10);
    //  })

    //it('UtilPerfTest02_boolean_isExternal_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //  (done: Function) => {
    //    let type = new util.types();
    //    let res = type.isExternal(true);
    //    let Stime = systemDateTime.getTime(true);
    //    for (let i = 0; i < BASE_COUNT; i++) {
    //      res = type.isExternal(true);
    //    }
    //    let Dtime = systemDateTime.getTime(true) - Stime;
    //    let res1 = res;
    //    let arkTsAveragedTime = Dtime / BASE_COUNT;
    //    console.info('arkTsUtilPerfTest02 arkTsAveragedTime ' +
    //      'UtilPerfTest02_boolean_isExternal_1800: ' + arkTsAveragedTime + 'ns');
    //    performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isExternal',
    //      'isExternal(value: Object): boolean;', arkTsAveragedTime);
    //    expect(!res).assertTrue();
    //    setTimeout(() => { done(); }, 10);
    //  })
    //
    it('UtilPerfTest02_boolean_isFloat32Array_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let float32Array = new Float32Array();
        let res = type.isFloat32Array(float32Array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isFloat32Array(float32Array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isFloat32Array_1700: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isFloat32Array',
          'isFloat32Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isFloat64Array_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let float64Array = new Float64Array();
        let res = type.isFloat64Array(float64Array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isFloat64Array(float64Array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isFloat64Array_1800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isFloat64Array',
          'isFloat64Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isGeneratorFunction_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let genFunc = (): void => {};
        let res = type.isGeneratorFunction(genFunc);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isGeneratorFunction(genFunc);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isGeneratorFunction_1900: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isGeneratorFunction',
          'isGeneratorFunction(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isGeneratorObject_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let type = new util.types();
        let genObj = (): void => {};
        let res = type.isGeneratorObject(genObj);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isGeneratorObject(genObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isGeneratorObject_2000: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'util.types', 'isGeneratorObject',
          'isGeneratorObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isInt8Array_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let int8Arr = new Int8Array([]);
        let res = types.isInt8Array(int8Arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isInt8Array(int8Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt8Array_2100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isInt8Array',
          'isInt8Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isInt16Array_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let int16Arr = new Int16Array([]);
        let res = types.isInt16Array(int16Arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isInt16Array(int16Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt16Array_2200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isInt16Array',
          'isInt16Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isInt32Array_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let int32Arr = new Int32Array([]);
        let res = types.isInt32Array(int32Arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isInt32Array(int32Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt32Array_2300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isInt32Array',
          'isInt32Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isMap_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let mapObj: Map<number, number> = new Map();
        let res = types.isMap(mapObj);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isMap(mapObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isMap_2400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isMap',
          'isMap(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isMapIterator_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        const map: Map<number, number> = new Map();
        let iterator = map.keys();
        let res = types.isMapIterator(iterator);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isMapIterator(iterator);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isMapIterator_2500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isMapIterator',
          'isMapIterator(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isNativeError_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let errorObj = new TypeError();
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isNativeError(errorObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isNativeError_2600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isNativeError',
          'isNativeError(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isPromise_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let promiseObj = Promise.resolve(1);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isPromise(promiseObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isPromise_2700: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isPromise',
          'isPromise(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isProxy_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        class Target{
        }
        let type = new util.types();
        const target : Target = {};
        const proxy = new Proxy(target, target);
        let res: boolean = type.isProxy(proxy);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = type.isProxy(proxy);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isProxy_2800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isProxy',
          'isProxy(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isRegExp_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let regExpObj = new RegExp('abc');
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isRegExp(regExpObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isRegExp_2900: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isRegExp',
          'isRegExp(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isSet_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let setObj: Set<number> = new Set();
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isSet(setObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isSet_3000: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isSet',
          'isSet(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isSetIterator_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        const set: Set<number> = new Set();
        const iterator = set.keys();
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isSetIterator(iterator);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isSetIterator_3100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isSetIterator',
          'isSetIterator(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isTypedArray_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let typedArrayObj = new Float64Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isTypedArray(typedArrayObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isTypedArray_3200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isTypedArray',
          'isTypedArray(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isUint8Array_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let uint8Arr = new Uint8Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isUint8Array(uint8Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint8Array_3300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isUint8Array',
          'isUint8Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isUint8ClampedArray_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let clampedArr = new Uint8ClampedArray([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isUint8ClampedArray(clampedArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint8ClampedArray_3400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isUint8ClampedArray',
          'isUint8ClampedArray(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isUint16Array_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let uint16Arr = new Uint16Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isUint16Array(uint16Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint16Array_3500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isUint16Array',
          'isUint16Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isUint32Array_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let uint32Arr = new Uint32Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isUint32Array(uint32Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint32Array_3600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isUint32Array',
          'isUint32Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isWeakMap_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let weakMapObj: WeakMap<object, number> = new WeakMap();
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isWeakMap(weakMapObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isWeakMap_3700: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isWeakMap',
          'isWeakMap(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isWeakSet_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let weakSetObj = new WeakSet();
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isWeakSet(weakSetObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isWeakSet_3800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isWeakSet',
          'isWeakSet(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isBigInt64Array_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let bigInt64Arr = new BigInt64Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isBigInt64Array(bigInt64Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isBigInt64Array_3900: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isBigInt64Array',
          'isBigInt64Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isBigUint64Array_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let bigUint64Arr = new BigUint64Array([]);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isBigUint64Array(bigUint64Arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isBigUint64Array_4000: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isBigUint64Array',
          'isBigUint64Array(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isModuleNamespaceObject_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let res: boolean = types.isModuleNamespaceObject({});
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isModuleNamespaceObject({});
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isModuleNamespaceObject_4100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isModuleNamespaceObject',
          'isModuleNamespaceObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isSharedArrayBuffer_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let sharedBuffer = new SharedArrayBuffer(0);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isSharedArrayBuffer(sharedBuffer);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isSharedArrayBuffer_4200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isSharedArrayBuffer',
          'isSharedArrayBuffer(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isBooleanObject_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let boolObj = new Boolean(true);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isBooleanObject(boolObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isBooleanObject_4300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isBooleanObject',
          'isBooleanObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isBoxedPrimitive_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let boxedObj = new Boolean(false);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isBoxedPrimitive(boxedObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isBoxedPrimitive_4400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isBoxedPrimitive',
          'isBoxedPrimitive(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isNumberObject_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let numObj = new Number(0);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isNumberObject(numObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isNumberObject_4500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isNumberObject',
          'isNumberObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest02_boolean_isStringObject_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let types = new util.types();
        let strObj = new String('foo');
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = types.isStringObject(strObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isStringObject_4600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'types', 'isStringObject',
          'isStringObject(value: Object): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('ScopePerfTest_ScopeType_Constructor_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let res = new util.ScopeHelper(tempLower, tempUpper);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.ScopeHelper(tempLower, tempUpper);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Constructor_4700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'Scope', 'constructor',
        'constructor(lowerObj: ScopeType, upperObj: ScopeType): Scope;', arkTsAveragedTime);
    });

    it('ScopePerfTest_String_ToString_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let res = range.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_String_ToString_4800: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'ToString',
          'toString(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Scope_Intersect_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let tempMidS = new Temperature(39);
        let rangeFir = new util.Scope(tempMiDF, tempMidS);
        let res = range.intersect(rangeFir);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.intersect(rangeFir);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Scope_Intersect_4900: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Intersect',
          'intersect(range: Scope): Scope;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Scope_Intersect_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let tempMidS = new Temperature(39);
        let res = range.intersect(tempMiDF, tempMidS);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.intersect(tempMiDF, tempMidS);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Scope_Intersect_5000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Intersect',
          'intersect(lowerObj: ScopeType, upperObj: ScopeType): Scope;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_ScopeType_GetUpper_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let res = range.getUpper() as Temperature;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.getUpper() as Temperature;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_ScopeType_GetUpper_5100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'GetUpper',
          'getUpper(): ScopeType;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Temperature_GetLower_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let res = range.getLower() as Temperature;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.getLower() as Temperature;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Temperature_GetLower_5200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'GetLower',
          'getLower(): ScopeType;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Scope_Expand_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let tempMidS = new Temperature(39);
        let res = range.expand(tempMiDF, tempMidS);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.expand(tempMiDF, tempMidS);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Scope_Expand_5300: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Expand',
          'expand(lowerObj: ScopeType, upperObj: ScopeType): Scope;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Scope_Expand_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let tempMidS = new Temperature(39);
        let rangeFir = new util.Scope(tempMiDF, tempMidS);
        let res = range.expand(rangeFir);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.expand(rangeFir);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Scope_Expand_5400: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Expand',
          'expand(range: Scope): Scope;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Scope_Expand_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let res = range.expand(tempMiDF);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.expand(tempMiDF);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Scope_Expand_5500: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Expand',
          'expand(value: ScopeType): Scope;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Boolean_Contains_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.contains(tempMiDF);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Boolean_Contains_5600: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Contains',
          'contains(value: ScopeType): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_Boolean_Contains_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempLess = new Temperature(20);
        let tempMore = new Temperature(45);
        let rangeSec = new util.Scope(tempLess, tempMore);
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.contains(rangeSec);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_Boolean_Contains_5700: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Contains',
          'contains(range: Scope): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('ScopePerfTest_ScopeType_Clamp_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.Scope(tempLower, tempUpper);
        let tempMiDF = new Temperature(35);
        let res = range.clamp(tempMiDF) as Temperature;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = range.clamp(tempMiDF) as Temperature;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsScopePerfTest arkTsAveragedTime ScopePerfTest_ScopeType_Clamp_5800: ' + arkTsAveragedTime +
          'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Scope', 'Clamp',
          'clamp(value: ScopeType): ScopeType;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_Base64_Constructor_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: util.Base64 | null = new util.Base64();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new util.Base64();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_Base64_Constructor_5900: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'Constructor',
          'constructor();', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_Uint8Array_EncodeSync_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base64 = new util.Base64();
        let array = new Uint8Array([115, 49, 51]);
        let res = base64.encodeSync(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = base64.encodeSync(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_Uint8Array_EncodeSync_6000: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'EncodeSync',
          'encodeSync(src: Uint8Array): Uint8Array;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_String_EncodeToStringSync_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base64 = new util.Base64();
        let array = new Uint8Array([115, 49, 51]);
        let res = base64.encodeToStringSync(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = base64.encodeToStringSync(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_String_EncodeToStringSync_6100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'EncodeToStringSync',
          'encodeToStringSync(src: Uint8Array): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_Uint8Array_DecodeSync_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base64 = new util.Base64();
        let buff = 'czEz';
        let res = base64.decodeSync(buff);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = base64.decodeSync(buff);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_Uint8Array_DecodeSync_6200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'DecodeSync',
          'decodeSync(src: Uint8Array | string): Uint8Array;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_Uint8Array_Encode_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let base64 = new util.Base64();
        let array = new Uint8Array([115, 49, 51]);
        let res = await base64.encode(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64.encode(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_Uint8Array_Encode_6300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'Encode',
          'encode(src: Uint8Array): Promise<Uint8Array>;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_String_EncodeToString_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let base64 = new util.Base64();
        let array = new Uint8Array([115, 49, 51]);
        let res = await base64.encodeToString(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64.encodeToString(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_String_EncodeToString_6400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'EncodeToString',
          'encodeToString(src: Uint8Array): Promise<string>;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });

    it('Base64PerfTest_Uint8Array_Decode_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let base64 = new util.Base64();
        let array = new Uint8Array([99, 122, 69, 122]);
        let res = await base64.decode(array);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = await base64.decode(array);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsBase64PerfTest arkTsAveragedTime Base64PerfTest_Uint8Array_Decode_6500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'Base64', 'Decode',
          'decode(src: Uint8Array | string): Promise<Uint8Array>;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      });
  })
}