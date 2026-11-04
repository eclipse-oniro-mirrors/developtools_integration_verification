/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
*     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";
import performance from './Performance.util';
export default function JSRuntimePerfTest03(): void {
  describe('JSRuntimePerfTest03', () => {
    const BASE_COUNT = 1000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ================================================================
    // 1. JSRuntime - getElement (10) - _15000 ~ _15900
    // ================================================================

    /* Error: This method must not be called */
    it('PerformanceTest_JSRuntime_getElementBoolean_15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementBoolean(arr, 0, true);
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementBoolean(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementBoolean: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementBoolean',
          'static getElementBoolean(object: JSValue, index: int): boolean', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementBoolean_15000: skip - This method must not be called');
      }
    })


    it('PerformanceTest_JSRuntime_getElementByte_15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementInt(arr, 0, 42);
        let result: byte = 0 as byte;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementByte(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementByte: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementByte',
          'static getElementByte(object: JSValue, index: int): byte', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementByte_15100: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementChar_15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementInt(arr, 0, 65);
        let result: char = c'\0';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementChar(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementChar: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementChar',
          'static getElementChar(object: JSValue, index: int): char', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementChar_15200: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementShort_15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementInt(arr, 0, 100);
        let result: short = 0 as short;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementShort(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementShort: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementShort',
          'static getElementShort(object: JSValue, index: int): short', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementShort_15300: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementInt_15400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 123.0);
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementInt(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementInt',
          'static getElementInt(object: JSValue, index: int): int', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementInt_15400: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementLong_15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 999.0);
        let result: long = 0 as long;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementLong(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementLong: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementLong',
          'static getElementLong(object: JSValue, index: int): long', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementLong_15500: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementFloat_15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 3.14);
        let result: float = 0 as float;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementFloat(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementFloat: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementFloat',
          'static getElementFloat(object: JSValue, index: int): float', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementFloat_15600: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementDouble_15700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 3.14159);
        let result: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementDouble(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementDouble: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementDouble',
          'static getElementDouble(object: JSValue, index: int): double', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementDouble_15700: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_getElementJSValue_15800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val = JSRuntime.newJSValueInt(42);
        JSRuntime.setElementJSValue(arr, 0, val);
        let result: JSValue = JSRuntime.getElementJSValue(arr, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementJSValue(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementJSValue: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementJSValue',
          'static getElementJSValue(object: JSValue, index: int): JSValue', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementJSValue_15800: skip - getElementJSValue failed');
      }
    })

    it('PerformanceTest_JSRuntime_getElementObject_15900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 123.0);
        let result: Any = null;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.getElementObject(arr, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime getElementObject: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getElementObject',
          'static getElementObject(object: Any, index: int): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_getElementObject_15900: skip - This method must not be called');
      }
    })

    // ================================================================
    // 2. JSRuntime - setElement (10) - _16000 ~ _16900
    // ================================================================

    it('PerformanceTest_JSRuntime_setElementBoolean_16000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementBoolean(arr, 0, true);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementBoolean(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementBoolean: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementBoolean',
          'static setElementBoolean(object: JSValue, index: int, value: boolean): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementBoolean_16000: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementByte_16100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: byte = 42;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementByte(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementByte(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementByte: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementByte',
          'static setElementByte(object: JSValue, index: int, value: byte): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementByte_16100: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementChar_16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: char = c'A';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementChar(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementInt(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementChar: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementChar',
          'static setElementChar(object: JSValue, index: int, value: char): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementChar_16200: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementShort_16300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: short = 100;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementShort(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementShort(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementShort: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementShort',
          'static setElementShort(object: JSValue, index: int, value: short): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementShort_16300: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementInt_16400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: int = 123;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementInt(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementInt(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementInt',
          'static setElementInt(object: JSValue, index: int, value: int): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementInt_16400: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementLong_16500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: long = 999;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementLong(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementLong(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementLong: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementLong',
          'static setElementLong(object: JSValue, index: int, value: long): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementLong_16500: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementFloat_16600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: float = 3.14 as float;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementFloat(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementFloat(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementFloat: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementFloat',
          'static setElementFloat(object: JSValue, index: int, value: float): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementFloat_16600: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementDouble_16700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: double = 3.14159;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementDouble(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementDouble(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementDouble: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementDouble',
          'static setElementDouble(object: JSValue, index: int, value: double): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementDouble_16700: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_setElementJSValue_16800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val = JSRuntime.newJSValueInt(42);
        JSRuntime.setElementJSValue(arr, 0, val);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementJSValue(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementJSValue(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementJSValue: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementJSValue',
          'static setElementJSValue(object: JSValue, index: int, value: JSValue): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementJSValue_16800: skip - setElementJSValue failed');
      }
    })

    it('PerformanceTest_JSRuntime_setElementObject_16900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        let val: Object = new Object();
        JSRuntime.setElementObject(arr, 0, val);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.setElementObject(arr, 0, val);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = JSRuntime.getElementObject(arr, 0);
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime setElementObject: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setElementObject',
          'static setElementObject(object: Any, index: int, value: Any): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_setElementObject_16900: skip - setElementObject failed');
      }
    })

    // ================================================================
    // 3. JSRuntime - 工程方法 (4) - _17000 ~ _17300
    // ================================================================

    /* App died: __initJSCallClass intrinsic not registered in current runtime */
    it('PerformanceTest_JSRuntime___initJSCallClass_17000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = JSRuntime.__initJSCallClass();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.__initJSCallClass();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime __initJSCallClass: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', '__initJSCallClass',
          'static __initJSCallClass(): boolean', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime___initJSCallClass_17000: skip - __initJSCallClass intrinsic not registered in current runtime');
      }
    })

    /* App died: __initJSNewClass intrinsic not registered in current runtime */
    it('PerformanceTest_JSRuntime___initJSNewClass_17100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = JSRuntime.__initJSNewClass();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.__initJSNewClass();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime __initJSNewClass: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', '__initJSNewClass',
          'static __initJSNewClass(): boolean', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime___initJSNewClass_17100: skip - __initJSNewClass intrinsic not registered in current runtime');
      }
    })

    /* Error: This method must not be called — intrinsic not intended for direct use */
    it('PerformanceTest_JSRuntime___createLambdaProxy_17200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let lambda: Object = () => { return; };
        let result: JSValue = JSRuntime.__createLambdaProxy(lambda);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSRuntime.__createLambdaProxy(lambda);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime __createLambdaProxy: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', '__createLambdaProxy',
          'static __createLambdaProxy(lambda: Object): JSValue', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime___createLambdaProxy_17200: skip - This method must not be called');
      }
    })

    it('PerformanceTest_JSRuntime_iterate_17300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arr = JSRuntime.createArray() as JSValue;
        JSRuntime.setElementDouble(arr, 0, 1.0);
        JSRuntime.setElementDouble(arr, 1, 2.0);
        let acc: int = 0;
        let cb = (elem: Any): void => { acc++; };
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          JSRuntime.iterate(arr, cb);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = acc;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest JSRuntime iterate: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'iterate',
          'static iterate(object: Any, callback: (arrElem: Any) => void): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_JSRuntime_iterate_17300: skip - iterate may not be supported in this runtime');
      }
    })
  })
}
