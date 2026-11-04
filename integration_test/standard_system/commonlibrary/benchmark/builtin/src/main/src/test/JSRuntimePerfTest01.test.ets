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
export default function JSRuntimePerfTest01(): void {
  describe('JSRuntimePerfTest01', () => {
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
    // 1. JSRuntime - getValue (4) - _5100 ~ _5400
    // ================================================================

    it('PerformanceTest_JSRuntime_getValueBoolean_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsVal = JSRuntime.newJSValueBoolean(true);
      let result: boolean = JSRuntime.getValueBoolean(jsVal);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getValueBoolean(jsVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getValueBoolean: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getValueBoolean',
        'static getValueBoolean(value: JSValue): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getValueDouble_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsVal = JSRuntime.newJSValueDouble(42.0);
      let result: double = JSRuntime.getValueDouble(jsVal);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getValueDouble(jsVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getValueDouble: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getValueDouble',
        'static getValueDouble(value: JSValue): double', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getValueString_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsVal = JSRuntime.newJSValueString("hello");
      let result: String = JSRuntime.getValueString(jsVal);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getValueString(jsVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getValueString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getValueString',
        'static getValueString(value: JSValue): String', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getValueObject_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let innerObj = new Object();
      let jsVal = JSRuntime.newJSValueObject(innerObj);
      let ClsObj = Class.of(new Object());
      let result: Any = JSRuntime.getValueObject(jsVal, ClsObj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getValueObject(jsVal, ClsObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getValueObject: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getValueObject',
        'static getValueObject(value: Any, t: Class): Any', arkTsAveragedTime);
    })

    // ================================================================
    // 2. JSRuntime - getProperty (12) - _5500 ~ _6600
    // ================================================================

    it('PerformanceTest_JSRuntime_getPropertyBoolean_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyBoolean(obj, "test", true);
      let result: boolean = JSRuntime.getPropertyBoolean(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyBoolean(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyBoolean: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyBoolean',
        'static getPropertyBoolean(object: JSValue, name: String): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyByte_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyInt(obj, "test", 42);
      let result: byte = JSRuntime.getPropertyByte(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyByte(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyByte: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyByte',
        'static getPropertyByte(object: JSValue, name: String): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyChar_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyInt(obj, "test", 65);
      let result: char = JSRuntime.getPropertyChar(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyChar(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyChar: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyChar',
        'static getPropertyChar(object: JSValue, name: String): char', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyShort_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyInt(obj, "test", 100);
      let result: short = JSRuntime.getPropertyShort(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyShort(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyShort',
        'static getPropertyShort(object: JSValue, name: String): short', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyInt_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 123.0);
      let result: int = JSRuntime.getPropertyInt(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyInt(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyInt',
        'static getPropertyInt(object: JSValue, name: String): int', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyLong_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 999.0);
      let result: long = JSRuntime.getPropertyLong(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyLong(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyLong',
        'static getPropertyLong(object: JSValue, name: String): long', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyFloat_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 3.14);
      let result: float = JSRuntime.getPropertyFloat(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyFloat(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyFloat: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyFloat',
        'static getPropertyFloat(object: JSValue, name: String): float', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyDouble_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 3.14159);
      let result: double = JSRuntime.getPropertyDouble(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyDouble(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyDouble: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyDouble',
        'static getPropertyDouble(object: JSValue, name: String): double', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyString_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyString(obj, "test", "value");
      let result: String = JSRuntime.getPropertyString(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyString(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyString',
        'static getPropertyString(object: JSValue, name: String): String', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyJSValue_String_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let propValue = JSRuntime.newJSValueInt(42);
      JSRuntime.setPropertyJSValue(obj, "test", propValue);
      let result: JSValue = JSRuntime.getPropertyJSValue(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyJSValue(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyJSValue_String: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyJSValue',
        'static getPropertyJSValue(object: JSValue, name: String): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyJSValue_Value_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let jsKey = JSRuntime.newJSValueString("test");
      let propValue = JSRuntime.newJSValueInt(42);
      JSRuntime.setPropertyJSValue(obj, "test", propValue);
      let result: JSValue = JSRuntime.getPropertyJSValue(obj, jsKey);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyJSValue(obj, jsKey);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyJSValue_Value: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyJSValue',
        'static getPropertyJSValue(object: JSValue, key: JSValue): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getPropertyObject_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 123.0);
      let result: Any = JSRuntime.getPropertyObject(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getPropertyObject(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getPropertyObject: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getPropertyObject',
        'static getPropertyObject(object: Any, name: String): Any', arkTsAveragedTime);
    })

    // ================================================================
    // 3. JSRuntime - 全局/创建 (7) - _6700 ~ _7300
    // ================================================================

    it('PerformanceTest_JSRuntime_getUndefined_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: JSValue = JSRuntime.getUndefined();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getUndefined();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getUndefined: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getUndefined',
        'static getUndefined(): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getNull_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: JSValue = JSRuntime.getNull();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getNull();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getNull: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getNull',
        'static getNull(): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getGlobal_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: JSValue = JSRuntime.getGlobal();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getGlobal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getGlobal: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getGlobal',
        'static getGlobal(): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_createObject_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: JSValue = JSRuntime.createObject();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.createObject();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime createObject: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'createObject',
        'static createObject(): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_createArray_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Any = JSRuntime.createArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.createArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime createArray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'createArray',
        'static createArray(): Any', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getNumSharedJSValues_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: int = JSRuntime.getNumSharedJSValues();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getNumSharedJSValues();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getNumSharedJSValues: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getNumSharedJSValues',
        'static getNumSharedJSValues(): int', arkTsAveragedTime);
    })
    // app died
    // it('PerformanceTest_JSRuntime_loadModule_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let result: JSValue | null = null;
    //   try {
    //     result = JSRuntime.loadModule("std.core");
    //   } catch (e) {
    //     console.error('JSRuntime loadModule pre-check failed: ' + e);
    //     return;
    //   }
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = JSRuntime.loadModule("std.core");
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result!;
    //   console.info('arkTsPerformanceTest JSRuntime loadModule: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'loadModule',
    //     'static loadModule(m: String): JSValue', arkTsAveragedTime);
    // })

    // ================================================================
    // 4. JSRuntime - has* 属性检测 (6) - _7400 ~ _7900
    // ================================================================

    it('PerformanceTest_JSRuntime_hasProperty_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 123.0);
      let result: boolean = JSRuntime.hasProperty(obj, "test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.hasProperty(obj, "test");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime hasProperty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'hasProperty',
        'static hasProperty(object: Any, name: String): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_hasPropertyObject_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 123.0);
      let prop = JSRuntime.newJSValueString("test");
      let result: boolean = JSRuntime.hasPropertyObject(obj, prop);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.hasPropertyObject(obj, prop);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime hasPropertyObject: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'hasPropertyObject',
        'static hasPropertyObject(object: Any, property: Any): boolean', arkTsAveragedTime);
    })

    /* Error: This method must not be called
    it('PerformanceTest_JSRuntime_hasElement_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = JSRuntime.createArray() as JSValue;
      JSRuntime.setElementDouble(arr, 0, 1.0);
      let result: boolean = JSRuntime.hasElement(arr, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.hasElement(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime hasElement: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'hasElement',
        'static hasElement(object: Any, index: int): boolean', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_JSRuntime_hasOwnProperty_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "ownKey", 123.0);
      let result: boolean = JSRuntime.hasOwnProperty(obj, "ownKey");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.hasOwnProperty(obj, "ownKey");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime hasOwnProperty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'hasOwnProperty',
        'static hasOwnProperty(object: Any, name: String): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_hasOwnPropertyJSValue_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "ownKey", 123.0);
      let prop = JSRuntime.newJSValueString("ownKey");
      let result: boolean = JSRuntime.hasOwnPropertyJSValue(obj, prop);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.hasOwnPropertyJSValue(obj, prop);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime hasOwnPropertyJSValue: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'hasOwnPropertyJSValue',
        'static hasOwnPropertyJSValue(object: Any, property: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_getProperty_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "test", 123.0);
      let key = JSRuntime.newJSValueString("test");
      let result: Any = JSRuntime.getProperty(obj, key);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.getProperty(obj, key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime getProperty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'getProperty',
        'static getProperty(object: Any, property: Any): Any', arkTsAveragedTime);
    })
  })
}
