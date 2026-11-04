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

async function fn() {
  return 'hello world';
}

declare class ArkTools {
  static forceFullGC(): void;
}

export default function UtilPerfTest01(): void {
  describe('UtilPerfTest01', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('UtilPerfTest01_String_Format_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let name = 'John';
      let age = 20;
      let formattedString = util.format('My name is %s and I am %s years old', name, age);
      let res = formattedString;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.format('My name is %s and I am %s years old', name, age);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_Format_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'format',
        'format(format: string, ...args: Object[]): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_ErrnoToString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let errnum = -1;
      let result = util.errnoToString(errnum);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.errnoToString(errnum);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_ErrnoToString_0200: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'errnoToString',
        'errnoToString(errno: number): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_CallbackWrapper_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let cb = util.callbackWrapper(fn);
      let res = cb;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.callbackWrapper(fn);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_CallbackWrapper_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'callbackWrapper',
        'callbackWrapper(original: Function): (err: Object, value: Object) => void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Function_Promisify_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const addCall = util.promisify(util.callbackWrapper(fn));
      let res = addCall;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.promisify(util.callbackWrapper(fn));
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Function_Promisify_0400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'promisify',
        'promisify(original: (err: Object, value: Object) => void): Function;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_GenerateRandomUUID_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let uuid = util.generateRandomUUID(true);
      let res = uuid;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.generateRandomUUID(true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_GenerateRandomUUID_0500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'generateRandomUUID',
        'generateRandomUUID(entropyCache?: boolean): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Uint8Array_GenerateRandomBinaryUUID_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let uuid = util.generateRandomBinaryUUID(true);
        let res = uuid;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = util.generateRandomBinaryUUID(true);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_GenerateRandomBinaryUUID_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util', 'generateRandomBinaryUUID',
          'generateRandomBinaryUUID(entropyCache?: boolean): Uint8Array;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_Uint8Array_ParseUUID_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let uuid = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
      let res = uuid;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_ParseUUID_0700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'parseUUID',
        'parseUUID(uuid: string): Uint8Array;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetHash_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      interface Person {
        name: string,
        age: number
      }
      let obj: Person = { name: 'Jack', age: 20 };
      let result1 = util.getHash(obj);
      let result2 = util.getHash(obj);
      let res = result1;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.getHash(obj);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetHash_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'getHash',
        'getHash(object: object): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_GetMainThreadStackTrace_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let stack = util.getMainThreadStackTrace();
      let res = stack;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.getMainThreadStackTrace();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_GetMainThreadStackTrace_0900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'getMainThreadStackTrace',
        'getMainThreadStackTrace(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_ArkTSVM_SetMultithreadingDetectionEnabled_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let res = util.ArkTSVM.setMultithreadingDetectionEnabled(true);

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.ArkTSVM.setMultithreadingDetectionEnabled(true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      const res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_ArkTSVM_SetMultithreadingDetectionEnabled_1000: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'ArkTSVM', 'setMultithreadingDetectionEnabled',
        'static setMultithreadingDetectionEnabled(enabled: boolean): void', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    });

    it('UtilPerfTest01_Void_EnableLocalHandleDetection_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          util.ArkTSVM.enableLocalHandleDetection();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_EnableLocalHandleDetection_1100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.ArkTSVM', 'enableLocalHandleDetection',
          'static enableLocalHandleDetection(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_Boolean_OnVMHeapMemoryPressure_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let callback = (event: string) => {};
      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: 75,
        sharedHeapThreshold: 80,
        processHeapThreshold: 85
      };
      let result: boolean = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      const res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_OnVMHeapMemoryPressure_1200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ArkTSVM', 'onVMHeapMemoryPressure',
        'static onVMHeapMemoryPressure(callback: Callback<string>, heapMemoryThreshold: HeapMemoryThreshold): ' +
          'boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_OffVMHeapMemoryPressure_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        util.ArkTSVM.offVMHeapMemoryPressure();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_OffVMHeapMemoryPressure_1300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ArkTSVM', 'offVMHeapMemoryPressure',
        'static offVMHeapMemoryPressure(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_Printf_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let res = util.printf("%s", "hello world!");
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.printf("%s", "hello world!");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_Printf_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'printf',
        'printf(format: string, ...args: Object[]): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_GetErrorString_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let errnum = -1;
      let result = util.getErrorString(errnum);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.getErrorString(errnum);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_GetErrorString_1700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'getErrorString',
        'getErrorString(errno: number): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Object_PromiseWrapper_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let original = (err: Object, value: Object) => {};
      let res = util.promiseWrapper(original);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.promiseWrapper(original);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Object_PromiseWrapper_1800: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'promiseWrapper',
        'promiseWrapper(original: (err: Object, value: Object) => void): Object;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_AddBefore_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      class MyClass {
        msg: string = 'msg000';
        foo(arg: string): string {
          console.info('foo arg is ' + arg);
          return this.msg;
        }

        static data: string = 'data000';
        static bar(arg: string): string {
          console.info('bar arg is ' + arg);
          return MyClass.data;
        }
      }

      let asp = new MyClass();
      let result = asp.foo('123');

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        let res = util.Aspect.addBefore(MyClass, 'foo', false, (instance: MyClass, arg: string) => {
          instance.msg = 'msg111';
        });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_AddBefore_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.Aspect', 'addBefore',
        'static addBefore(targetClass: Object, methodName: string, isStatic: boolean, before: Function): void;',
        arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_AddAfter_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      class MyClass {
        msg: string = 'msg000';
        foo(arg: string): string {
          return this.msg;
        }
      }

      let asp = new MyClass();
      let result = asp.foo('123');

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        let res = util.Aspect.addAfter(MyClass, 'foo', false, (instance: MyClass, ret: string, arg: string): string => {
          instance.msg = 'msg111';
          return 'msg222';
        });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_AddAfter_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.Aspect', 'addAfter',
        'static addAfter(targetClass: Object, methodName: string, isStatic: boolean, after: Function): void;',
        arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_Replace_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      class MyClass {
        msg: string = 'msg000';
        foo(arg: string): string {
          return this.msg;
        }
      }

      let asp = new MyClass();
      let result = asp.foo('123');

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        let res = util.Aspect.replace(MyClass, 'foo', false, (instance: MyClass, arg: string): string => {
          instance.msg = 'msg111';
          return 'msg222';
        });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_Replace_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.Aspect', 'replace',
        'static replace(targetClass: Object, methodName: string, isStatic: boolean, instead: Function): void;',
        arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_TextDecoder_TextDecoderConstructor_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textDecoder = new util.TextDecoder();
      let retStr = textDecoder.encoding;
      let res = retStr;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.TextDecoder().encoding;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_TextDecoder_TextDecoderConstructor_2500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'constructor',
        'constructor();', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_TextDecoder_TextDecoderCreate_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textDecoderOptions: util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
      };
      let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
      let res = textDecoder;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.TextDecoder.create('utf-8', textDecoderOptions);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_TextDecoder_TextDecoderCreate_2600: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'create',
        'static create(encoding?: string, options?: TextDecoderOptions): TextDecoder;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_DecodeToString_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textDecoderOptions: util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
      };
      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: false
      };
      let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
      let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]);
      let retStr = textDecoder.decodeToString(uint8, decodeToStringOptions);
      let res = retStr;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textDecoder.decodeToString(uint8, decodeToStringOptions);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_DecodeToString_2700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'decodeToString',
        'decodeToString(input: Uint8Array, options?: DecodeToStringOptions): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_DecodeWithStream_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textDecoderOptions: util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
      };
      let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
        stream: false
      };
      let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
      let uint8 = new Uint8Array(6);
      uint8[0] = 0xEF;
      uint8[1] = 0xBB;
      uint8[2] = 0xBF;
      uint8[3] = 0x61;
      uint8[4] = 0x62;
      uint8[5] = 0x63;
      console.info("input num:");
      let retStr = textDecoder.decodeWithStream(uint8, decodeWithStreamOptions);
      let res = retStr;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textDecoder.decodeWithStream(uint8, decodeWithStreamOptions);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_DecodeWithStream_2900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'decodeWithStream',
        'decodeWithStream(input: Uint8Array, options?: DecodeWithStreamOptions): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_TextDecoder_TextDecoderConstructorDeprecated_3000', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, (done: () => void) => {
      let textDecoder = new util.TextDecoder("utf-8", { ignoreBOM: true });
      let res = textDecoder;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.TextDecoder("utf-8", { ignoreBOM: true });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_TextDecoder_TextDecoderConstructorDeprecated_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'constructor',
        'constructor(encoding?: string, options?: { fatal?: boolean; ignoreBOM?: boolean });', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_string_Decode_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textDecoder = new util.TextDecoder("utf-8", { ignoreBOM: true });
      let uint8 = new Uint8Array(6);
      uint8[0] = 0xEF;
      uint8[1] = 0xBB;
      uint8[2] = 0xBF;
      uint8[3] = 0x61;
      uint8[4] = 0x62;
      uint8[5] = 0x63;
      console.info("input num:");
      let retStr = textDecoder.decode(uint8, { stream: false });
      let res = retStr;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textDecoder.decode(uint8, { stream: false });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_string_Decode_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextDecoder', 'decode',
        'decode(input: Uint8Array, options?: { stream?: false }): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_TextEncoder_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder();
      let res = textEncoder;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.TextEncoder();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_TextEncoder_3300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'constructor',
        'constructor(encoding?: string);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_TextEncoder_TextEncoderConstructor_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let textEncoder = new util.TextEncoder();
        let res = textEncoder;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new util.TextEncoder();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_TextEncoder_TextEncoderConstructor_3400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'constructor',
          'constructor();', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_TextEncoder_TextEncoderConstructorWithEncoding_3500', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder("utf-8");
      let res = textEncoder;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.TextEncoder("utf-8");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_TextEncoder_TextEncoderConstructorWithEncoding_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'constructor',
        'constructor(encoding?: string);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_TextEncoder_TextEncoderCreate_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textEncoder = util.TextEncoder.create("utf-8");
      let res = textEncoder;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.TextEncoder.create("utf-8");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_TextEncoder_TextEncoderCreate_3600: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'create',
        'static create(encoding?: string): TextEncoder;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Uint8Array_EncodeInto_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto("\uD800¥¥");
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textEncoder.encodeInto("\uD800¥¥");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_EncodeInto_3700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'encodeInto',
        'encodeInto(input?: string): Uint8Array;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_EncodeIntoUint8ArrayInfo_EncodeIntoUint8Array_3800', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let uint8 = new Uint8Array(buffer);
      let result = textEncoder.encodeIntoUint8Array('abcd', uint8);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textEncoder.encodeIntoUint8Array('abcd', uint8);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_EncodeIntoUint8ArrayInfo_EncodeIntoUint8Array_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'encodeIntoUint8Array',
        'encodeIntoUint8Array(input: string, dest: Uint8Array): EncodeIntoUint8ArrayInfo;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_{ read: number; written: number }_EncodeIntoDeprecated_3900', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let uint8 = new Uint8Array(buffer);
      let result = textEncoder.encodeInto('abcd', uint8);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textEncoder.encodeInto('abcd', uint8);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_{ read: number; written: number }_EncodeIntoDeprecated_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'encodeInto',
        'encodeInto(input: string, dest: Uint8Array): { read: number; written: number };', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Uint8Array_EncodeDeprecated_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encode("\uD800¥¥");
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = textEncoder.encode("\uD800¥¥");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_EncodeDeprecated_4000: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.TextEncoder', 'encode',
        'encode(input?: string): Uint8Array;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_RationalNumber_RationalNumberConstructor_4100', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, (done: () => void) => {
      let rationalNumber = new util.RationalNumber();
      let res = rationalNumber;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.RationalNumber();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_RationalNumber_RationalNumberConstructor_4100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'constructor',
        'constructor();', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_RationalNumber_ParseRationalNumber_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
        let res = rationalNumber;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = util.RationalNumber.parseRationalNumber(1, 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_RationalNumber_ParseRationalNumber_4200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'parseRationalNumber',
          'static parseRationalNumber(numerator: number, denominator: number): RationalNumber;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_RationalNumber_CreateRationalFromString_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let rational = util.RationalNumber.createRationalFromString("3/4");
        let res = rational;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = util.RationalNumber.createRationalFromString("3/4");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_RationalNumber_CreateRationalFromString_4300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'createRationalFromString',
          'static createRationalFromString(rationalString: string): RationalNumber;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_Number_Compare_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let rational = util.RationalNumber.createRationalFromString("3/4");
      let result = rationalNumber.compare(rational);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.compare(rational);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_Compare_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'compare',
        'compare(another: RationalNumber): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_ValueOf_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.valueOf();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.valueOf();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_ValueOf_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'valueOf',
        'valueOf(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_Equals_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let rational = util.RationalNumber.createRationalFromString("3/4");
      let result = rationalNumber.equals(rational);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.equals(rational);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_Equals_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'equals',
        'equals(obj: Object): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetCommonFactor_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.RationalNumber.getCommonFactor(4, 6);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetCommonFactor_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'getCommonFactor',
        'static getCommonFactor(number1: number, number2: number): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetNumerator_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.getNumerator();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.getNumerator();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetNumerator_4800: ' + arkTsAveragedTime +
        'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'getNumerator',
        'getNumerator(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetDenominator_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.getDenominator();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.getDenominator();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetDenominator_4900: ' + arkTsAveragedTime +
        'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'getDenominator',
        'getDenominator(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_IsZero_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.isZero();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.isZero();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_IsZero_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'isZero',
        'isZero(): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_IsNaN_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.isNaN();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.isNaN();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_IsNaN_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'isNaN',
        'isNaN(): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_IsFinite_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.isFinite();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.isFinite();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_IsFinite_5200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'isFinite',
        'isFinite(): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_ToString_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result = rationalNumber.toString();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rationalNumber.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_ToString_5300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_RationalNumber_RationalNumberConstructorDeprecated_5400', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, (done: () => void) => {
      let rationalNumber = new util.RationalNumber(1, 2);
      let res = rationalNumber;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.RationalNumber(1, 2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'RationalNumbervPerfTest_RationalNumber_RationalNumberConstructorDeprecated_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.RationalNumber', 'constructor',
        'constructor(numerator: number, denominator: number);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_LRUCache_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(1, 8);
      let result = pro.length;
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_LRUCache_5500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'LRUCache',
        'class LRUCache<K, V> { length: number; }', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_LRUCacheConstructor_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      let res = pro;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.LRUCache<number, number>();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_LRUCacheConstructor_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'constructor',
        'constructor(capacity?: number);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_UpdateCapacity_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let caches: util.LRUCache<number, number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        caches.push(new util.LRUCache<number, number>());
      }
      let res = caches[0].updateCapacity(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = caches[i].updateCapacity(100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_UpdateCapacity_5700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'updateCapacity',
        'updateCapacity(newCapacity: number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_String_LRUCacheToString_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      pro.get(3);
      let result = pro.toString();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_LRUCacheToString_5800: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetCapacity_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.getCapacity();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.getCapacity();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetCapacity_5900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getCapacity',
        'getCapacity(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_Clear_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let caches: util.LRUCache<number, number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let cache = new util.LRUCache<number, number>();
        cache.put(2, 10);
        caches.push(cache);
      }
      let res = caches[0].clear();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = caches[i].clear();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_Clear_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'clear',
        'clear(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetCreateCount_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      class ChildLRUCache extends util.LRUCache<number, number> {
        constructor() {
          super();
        }

        createDefault(key: number): number {
          return key;
        }
      }
      let lru = new ChildLRUCache();
      lru.put(2, 10);
      lru.get(3);
      lru.get(5);
      let res = lru.getCreateCount();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lru.getCreateCount();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetCreateCount_6100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getCreateCount',
        'getCreateCount(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetMissCount_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      let result = pro.getMissCount();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.getMissCount();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetMissCount_6200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getMissCount',
        'getMissCount(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetRemovalCount_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.updateCapacity(2);
      pro.put(50, 22);
      let result = pro.getRemovalCount();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.getRemovalCount();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetRemovalCount_6300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getRemovalCount',
        'getRemovalCount(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetMatchCount_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      let result = pro.getMatchCount();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.getMatchCount();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetMatchCount_6400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getMatchCount',
        'getMatchCount(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Number_GetPutCount_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.getPutCount();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.getPutCount();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Number_GetPutCount_6500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'getPutCount',
        'getPutCount(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_IsEmpty_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.isEmpty();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.isEmpty();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_IsEmpty_6600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'isEmpty',
        'isEmpty(): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_V_Get_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.get(2);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.get(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_V_Get_6700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'get',
        'get(key: K): V | undefined;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_V_Put_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let caches: util.LRUCache<number, number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        caches.push(new util.LRUCache<number, number>());
      }
      let res = caches[0].put(2, 10);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = caches[i].put(2, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_V_Put_6800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'put',
        'put(key: K, value: V): V;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_V_Values_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, string>();
      pro.put(1, 'A');
      pro.put(2, "B");
      pro.put(3, 'C');
      pro.put(4, 'D');
      pro.put(5, 'E');
      pro.put(6, 'F');
      let result = pro.values();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_V_Values_6900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'values',
        'values(): V[];', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_K_Keys_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, string>();
      pro.put(1, 'A');
      pro.put(2, "B");
      pro.put(3, 'C');
      pro.put(4, 'D');
      pro.put(5, 'E');
      pro.put(6, 'F');
      let result = pro.keys();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.keys();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_K_Keys_7000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'keys',
        'keys(): K[];', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_V_Remove_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let caches: util.LRUCache<number, number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let cache = new util.LRUCache<number, number>();
        cache.put(2, 10);
        caches.push(cache);
      }
      let res = caches[0].get(2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = caches[i].remove(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_V_Remove_7100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'remove',
        'remove(key: K): V | undefined;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Void_AfterRemoval_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor(capacity?: number) {
          super(capacity);
        }

        afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
          if (isEvict === true) {
            console.info('key = ' + key);
            console.info('value = ' + value);
            console.info('newValue = ' + newValue);
          }
        }
      }
      let lru = new ChildLRUCache<number, number>(2);
      lru.put(1, 1);
      lru.put(2, 2);
      let res = lru.put(3, 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lru.put(3, 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Void_AfterRemoval_7200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'afterRemoval',
        'afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_Contains_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.contains(2);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.contains(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_Contains_7300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'contains',
        'contains(key: K): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_V_CreateDefault_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.createDefault(50);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.createDefault(50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_V_CreateDefault_7400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'createDefault',
        'createDefault(key: K): V;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_IterableIterator<[K, V]>_Entries_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 15);
      let res = pro.entries();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pro.entries();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_IterableIterator<[K, V]>_Entries_7500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', 'entries',
        'entries(): IterableIterator<[K, V]>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_IterableIterator<[K, V]>_SymbolIterator_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let pro = new util.LRUCache<number, number>();
        pro.put(2, 10);
        pro.put(3, 15);
        let res = pro[Symbol.iterator]();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro[Symbol.iterator]();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_IterableIterator<[K, V]>_SymbolIterator_7600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.LRUCache', '[Symbol.iterator]',
          '[Symbol.iterator](): IterableIterator<[K, V]>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_Boolean_CompareTo_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let temp1 = new Temperature(25);
      let temp2 = new Temperature(20);
      let result = temp1.compareTo(temp2);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = temp1.compareTo(temp2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Boolean_CompareTo_7700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'ScopeComparable',
        'interface ScopeComparable { compareTo(other: ScopeComparable): boolean; }', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeType_ScopeHelperConstructor_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
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
        let tempLower = new Temperature(30);
        let tempUpper = new Temperature(40);
        let range = new util.ScopeHelper(tempLower, tempUpper);
        let res = range;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new util.ScopeHelper(tempLower, tempUpper);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeType_ScopeHelperConstructor_7800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'constructor',
          'constructor(lowerObj: ScopeType, upperObj: ScopeType);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
      })

    it('UtilPerfTest01_String_ScopeHelperToString_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.toString();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_String_ScopeHelperToString_7900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeHelper_Intersect_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let rangeFir = new util.ScopeHelper(tempMiDF, tempMidS);
      let res = range.intersect(rangeFir);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.intersect(rangeFir);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeHelper_Intersect_8000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'intersect',
        'intersect(range: ScopeHelper): ScopeHelper;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeType_GetUpper_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.getUpper();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.getUpper();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeType_GetUpper_8100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'getUpper',
        'getUpper(): ScopeType;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeType_GetLower_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.getLower();
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.getLower();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeType_GetLower_8200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'getLower',
        'getLower(): ScopeType;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeHelper_Expand_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.expand(tempMiDF, tempMidS);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.expand(tempMiDF, tempMidS);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeHelper_Expand_8300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'expand',
        'expand(lowerObj: ScopeType, upperObj: ScopeType): ScopeHelper;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeHelper_ExpandWithRange_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let rangeFir = new util.ScopeHelper(tempMiDF, tempMidS);
      let result = range.expand(rangeFir);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.expand(rangeFir);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeHelper_ExpandWithRange_8400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'expand',
        'expand(range: ScopeHelper): ScopeHelper;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeHelper_ExpandWithValue_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.expand(tempMiDF);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.expand(tempMiDF);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_ScopeHelper_ExpandWithValue_8500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'expand',
        'expand(value: ScopeType): ScopeHelper;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_Contains_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.contains(tempMiDF);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.contains(tempMiDF);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_Boolean_Contains_8600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'contains',
        'contains(value: ScopeType): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Boolean_ContainsRange_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let tempLess = new Temperature(20);
      let tempMore = new Temperature(45);
      let rangeSec = new util.ScopeHelper(tempLess, tempMore);
      let result = range.contains(rangeSec);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.contains(rangeSec);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime ' +
        'UtilPerfTest01_Boolean_ContainsRange_8700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'contains',
        'contains(range: ScopeHelper): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_ScopeType_Clamp_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
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
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let result = range.clamp(tempMiDF);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = range.clamp(tempMiDF);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_ScopeType_Clamp_8800: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.ScopeHelper', 'clamp',
        'clamp(value: ScopeType): ScopeType;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Base64Helper_Base64Helper_Constructor_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let base64Helper = new util.Base64Helper();
      let res = base64Helper;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new util.Base64Helper();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Base64Helper_Base64Helper_Constructor_8900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'Base64Helper',
        'class Base64Helper', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UtilPerfTest01_Uint8Array_EncodeSync_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let result = base64Helper.encodeSync(array);
      let res = result;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = base64Helper.encodeSync(array);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_EncodeSync_9000: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.util', 'util.Base64Helper', 'encodeSync',
        'encodeSync(src: Uint8Array, options?: Type): Uint8Array;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })
  })
}