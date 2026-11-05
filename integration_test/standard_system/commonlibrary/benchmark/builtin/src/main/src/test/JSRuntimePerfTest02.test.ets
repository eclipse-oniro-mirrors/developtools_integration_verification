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
export default function JSRuntimePerfTest02(): void {
  describe('JSRuntimePerfTest02', () => {
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
    // 1. JSRuntime - setProperty (11) - _10000 ~ _11000
    // ================================================================

    it('PerformanceTest_JSRuntime_setPropertyBoolean_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyBoolean(obj, "test", true);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyBoolean(obj, "test", true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyBoolean(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyBoolean: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyBoolean',
        'static setPropertyBoolean(object: JSValue, name: String, value: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyByte_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: byte = 42;
      JSRuntime.setPropertyByte(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyByte(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyByte(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyByte: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyByte',
        'static setPropertyByte(object: JSValue, name: String, value: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyChar_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: char = c'A';
      JSRuntime.setPropertyChar(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyChar(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyInt(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyChar: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyChar',
        'static setPropertyChar(object: JSValue, name: String, value: char): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyShort_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: short = 100;
      JSRuntime.setPropertyShort(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyShort(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyShort(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyShort',
        'static setPropertyShort(object: JSValue, name: String, value: short): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyInt_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: int = 123;
      JSRuntime.setPropertyInt(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyInt(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyInt(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyInt',
        'static setPropertyInt(object: JSValue, name: String, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyLong_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: long = 999;
      JSRuntime.setPropertyLong(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyLong(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyLong(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyLong',
        'static setPropertyLong(object: JSValue, name: String, value: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyFloat_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: float = 3.14 as float;
      JSRuntime.setPropertyFloat(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyFloat(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyFloat(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyFloat: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyFloat',
        'static setPropertyFloat(object: JSValue, name: String, value: float): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyDouble_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: double = 3.14159;
      JSRuntime.setPropertyDouble(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyDouble(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyDouble(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyDouble: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyDouble',
        'static setPropertyDouble(object: JSValue, name: String, value: double): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyString_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: String = "hello";
      JSRuntime.setPropertyString(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyString(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyString(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyString',
        'static setPropertyString(object: JSValue, name: String, value: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyJSValue_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val = JSRuntime.newJSValueInt(42);
      JSRuntime.setPropertyJSValue(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyJSValue(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyJSValue(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyJSValue: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyJSValue',
        'static setPropertyJSValue(object: JSValue, name: String, value: JSValue): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setPropertyObject_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let val: Object = new Object();
      JSRuntime.setPropertyObject(obj, "test", val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setPropertyObject(obj, "test", val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getPropertyObject(obj, "test");
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setPropertyObject: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setPropertyObject',
        'static setPropertyObject(object: Any, name: String, value: Any): void', arkTsAveragedTime);
    })

    // ================================================================
    // 2. JSRuntime - 类型判断 (6) - _11100 ~ _11600
    // ================================================================

    it('PerformanceTest_JSRuntime_typeOf_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let result: string = JSRuntime.typeOf(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.typeOf(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime typeOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'typeOf',
        'static typeOf(object: JSValue): string', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_isPromise_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let result: boolean = JSRuntime.isPromise(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.isPromise(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime isPromise: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'isPromise',
        'static isPromise(object: JSValue): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_isStaticValue_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let result: boolean = JSRuntime.isStaticValue(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.isStaticValue(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime isStaticValue: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'isStaticValue',
        'static isStaticValue(object: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_instanceOfStaticType_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let ObjType = Type.of(new Object());
      let result: boolean = JSRuntime.instanceOfStaticType(obj, ObjType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.instanceOfStaticType(obj, ObjType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime instanceOfStaticType: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'instanceOfStaticType',
        'static instanceOfStaticType(recv: JSValue, type: Type): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_instanceOfDynamic_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let ClsObj = Class.of(new Object());
      let result: boolean = JSRuntime.instanceOfDynamic(obj, ClsObj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.instanceOfDynamic(obj, ClsObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime instanceOfDynamic: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'instanceOfDynamic',
        'static instanceOfDynamic(object: Any, ctor: Any): boolean', arkTsAveragedTime);
    })

    /* Error: std.core.Object cannot be cast to std.interop.js.JSValue
    it('PerformanceTest_JSRuntime_instanceOfStatic_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let ClsObj = Class.of(new Object());
      let result: boolean = JSRuntime.instanceOfStatic(obj, ClsObj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.instanceOfStatic(obj, ClsObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime instanceOfStatic: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'instanceOfStatic',
        'static instanceOfStatic(object: JSValue, cls: Class): boolean', arkTsAveragedTime);
    })
    */

    // ================================================================
    // 3. JSRuntime - 其他 (3) - _11700 ~ _11900
    // ================================================================

    it('PerformanceTest_JSRuntime_strictEqual_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lhs = JSRuntime.newJSValueInt(42);
      let rhs = JSRuntime.newJSValueInt(42);
      let result: boolean = JSRuntime.strictEqual(lhs, rhs);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.strictEqual(lhs, rhs);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime strictEqual: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'strictEqual',
        'static strictEqual(lhs: JSValue, rhs: JSValue): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_setProperty_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      let key = JSRuntime.newJSValueString("test");
      let value = JSRuntime.newJSValueInt(42);
      JSRuntime.setProperty(obj, key, value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        JSRuntime.setProperty(obj, key, value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = JSRuntime.getProperty(obj, key);
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime setProperty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'setProperty',
        'static setProperty(object: Any, key: Any, value: Any): void', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_xgc_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: long = JSRuntime.xgc();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.xgc();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime xgc: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'xgc',
        'static native xgc(): long', arkTsAveragedTime);
    })
  })
}
