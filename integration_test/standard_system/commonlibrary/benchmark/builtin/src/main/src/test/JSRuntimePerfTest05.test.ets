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
export default function JSRuntimePerfTest05(): void {
  describe('JSRuntimePerfTest05', () => {
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
    // DynamicFunction - invoke0 ~ invoke16 (17) - _0100 ~ _1700
    // ================================================================

    it('PerformanceTest_DynamicFunction_invoke0_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke0();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke0();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke0: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke0',
          'invoke0(): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke0_0100: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke1_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke1(1 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke1(1 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke1: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke1',
          'invoke1(arg1: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke1_0200: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke2_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke2(1 as Any, 2 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke2(1 as Any, 2 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke2: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke2',
          'invoke2(arg1: Any, arg2: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke2_0300: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke3_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke3(1 as Any, 2 as Any, 3 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke3(1 as Any, 2 as Any, 3 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke3: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke3',
          'invoke3(arg1: Any, arg2: Any, arg3: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke3_0400: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke4_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke4(1 as Any, 2 as Any, 3 as Any, 4 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke4(1 as Any, 2 as Any, 3 as Any, 4 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke4: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke4',
          'invoke4(arg1: Any, arg2: Any, arg3: Any, arg4: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke4_0500: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke5_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke5(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke5(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke5: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke5',
          'invoke5(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke5_0600: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke6_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke6(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke6(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke6: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke6',
          'invoke6(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke6_0700: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke7_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke7(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke7(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke7: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke7',
          'invoke7(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke7_0800: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    // App died: DynamicFunction has no JS function binding, native layer null pointer crash (continued)
    it('PerformanceTest_DynamicFunction_invoke8_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke8(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke8(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke8: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke8',
          'invoke8(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke8_0900: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke9_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke9(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke9(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke9: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke9',
          'invoke9(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke9_1000: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke10_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke10(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke10(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke10: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke10',
          'invoke10(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke10_1100: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke11_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke11(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke11(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke11: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke11',
          'invoke11(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke11_1200: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke12_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke12(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke12(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke12: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke12',
          'invoke12(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke12_1300: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke13_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke13(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke13(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke13: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke13',
          'invoke13(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke13_1400: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke14_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke14(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke14(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke14: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke14',
          'invoke14(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke14_1500: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke15_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke15(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke15(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke15: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke15',
          'invoke15(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any, arg15: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke15_1600: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invoke16_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invoke16(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any, 16 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invoke16(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any, 16 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invoke16: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invoke16',
          'invoke16(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any, arg15: Any, arg16: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invoke16_1700: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    // ================================================================
    // DynamicFunction - invokeR0 ~ invokeR16 (17) - _1800 ~ _3400
    // ================================================================

    it('PerformanceTest_DynamicFunction_invokeR0_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR0();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR0();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR0: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR0',
          'invokeR0(...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR0_1800: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR1_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR1(1 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR1(1 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR1: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR1',
          'invokeR1(arg1: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR1_1900: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR2_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR2(1 as Any, 2 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR2(1 as Any, 2 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR2: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR2',
          'invokeR2(arg1: Any, arg2: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR2_2000: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR3_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR3(1 as Any, 2 as Any, 3 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR3(1 as Any, 2 as Any, 3 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR3: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR3',
          'invokeR3(arg1: Any, arg2: Any, arg3: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR3_2100: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR4_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR4(1 as Any, 2 as Any, 3 as Any, 4 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR4(1 as Any, 2 as Any, 3 as Any, 4 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR4: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR4',
          'invokeR4(arg1: Any, arg2: Any, arg3: Any, arg4: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR4_2200: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR5_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR5(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR5(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR5: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR5',
          'invokeR5(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR5_2300: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR6_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR6(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR6(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR6: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR6',
          'invokeR6(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR6_2400: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR7_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR7(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR7(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR7: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR7',
          'invokeR7(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR7_2500: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR8_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR8(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR8(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR8: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR8',
          'invokeR8(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR8_2600: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR9_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR9(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR9(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR9: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR9',
          'invokeR9(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR9_2700: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR10_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR10(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR10(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR10: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR10',
          'invokeR10(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR10_2800: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR11_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR11(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR11(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR11: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR11',
          'invokeR11(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR11_2900: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR12_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR12(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR12(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR12: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR12',
          'invokeR12(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR12_3000: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR13_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR13(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR13(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR13: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR13',
          'invokeR13(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR13_3100: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR14_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR14(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR14(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR14: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR14',
          'invokeR14(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR14_3200: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR15_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR15(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR15(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR15: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR15',
          'invokeR15(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any, arg15: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR15_3300: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    it('PerformanceTest_DynamicFunction_invokeR16_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.invokeR16(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any, 16 as Any);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.invokeR16(1 as Any, 2 as Any, 3 as Any, 4 as Any, 5 as Any, 6 as Any, 7 as Any, 8 as Any, 9 as Any, 10 as Any, 11 as Any, 12 as Any, 13 as Any, 14 as Any, 15 as Any, 16 as Any);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction invokeR16: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'invokeR16',
          'invokeR16(arg1: Any, arg2: Any, arg3: Any, arg4: Any, arg5: Any, arg6: Any, arg7: Any, arg8: Any, arg9: Any, arg10: Any, arg11: Any, arg12: Any, arg13: Any, arg14: Any, arg15: Any, arg16: Any, ...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_invokeR16_3400: skip - DynamicFunction may not be supported in this runtime');
      }
    })

    // ================================================================
    // DynamicFunction - unsafeCall (1) - _3500
    // ================================================================

    it('PerformanceTest_DynamicFunction_unsafeCall_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let func = new DynamicFunction();
        let result: Any = func.unsafeCall();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = func.unsafeCall();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest DynamicFunction unsafeCall: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.interop.js', 'DynamicFunction', 'unsafeCall',
          'unsafeCall(...r: FixedArray<Any>): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DynamicFunction_unsafeCall_3500: skip - DynamicFunction may not be supported in this runtime');
      }
    })
  })
}
