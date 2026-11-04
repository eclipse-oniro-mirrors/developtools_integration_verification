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
export default function JSRuntimePerfTest(): void {
  describe('JSRuntimePerfTest', () => {
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
    // JSRuntime - newJSValue (12)
    // ================================================================
    it('PerformanceTest_JSRuntime_newJSValueBoolean_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueBoolean(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueBoolean_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueBoolean',
        'newJSValueBoolean(value: boolean): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueByte_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueByte(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueByte_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueByte',
        'newJSValueByte(value: byte): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueChar_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let mockChar: char = c'a';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueChar(mockChar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueChar_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueChar',
        'newJSValueChar(v: char): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueShort_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueShort(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueShort_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueShort',
        'newJSValueShort(value: short): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueInt_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueInt(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueInt_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueInt',
        'newJSValueInt(value: int): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueLong_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueLong(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueLong_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueLong',
        'newJSValueLong(value: long): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueFloat_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueFloat(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueFloat_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueFloat',
        'newJSValueFloat(value: float): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueDouble_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueDouble(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueDouble_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueDouble',
        'newJSValueDouble(value: double): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueString_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let mockString = "test";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueString(mockString);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueString_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueString',
        'newJSValueString(value: String): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueObject_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let mockObj = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueObject(mockObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueObject_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueObject',
        'newJSValueObject(value: Object): JSValue', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_isJSValue_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockValue: Object = new Object();
      let res = JSRuntime.isJSValue(mockValue);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.isJSValue(mockValue);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_isJSValue_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'isJSValue',
        'isJSValue(value: Object): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_JSRuntime_newJSValueBigInt_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Any = null;
      let bi = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = JSRuntime.newJSValueBigInt(bi);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSRuntime_newJSValueBigInt_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'newJSValueBigInt',
        'newJSValueBigInt(bi: BigInt): JSValue', arkTsAveragedTime);
    })
  })
}
