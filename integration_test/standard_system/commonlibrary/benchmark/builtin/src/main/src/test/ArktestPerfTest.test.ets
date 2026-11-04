/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

import {
  arktest
} from 'std/testing';

export default function ArktestPerfTest() : void {
  describe('ArktestPerfTest', () => {

    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    const UNIT_TIME = 1000000;
    const ASYNC_BASE_COUNT = 1000;

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
    // 1. arktest Namespace — Asserts (void)
    // ================================================================
    it('PerformanceTest_arktest_AssertTrue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertTrue(true);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertTrue(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertTrue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertTrue', 'assertTrue(condition: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertFalse_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertFalse(false);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertFalse(false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertFalse_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertFalse', 'assertFalse(condition: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertEQ_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertEQ(1, 1);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertEQ(1, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertEQ_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertEQ', 'assertEQ<T1, T2>(value1: T1, value2: T2)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertNE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertNE(1, 2);;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertNE(1, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertNE_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertNE', 'assertNE<T1, T2>(value1: T1, value2: T2)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertDoubleEQ_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertDoubleEQ(1.0, 1.0, 0.0001);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertDoubleEQ(1.0, 1.0, 0.0001);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertDoubleEQ_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertDoubleEQ', 'assertDoubleEQ(value1: double, value2: double, absError: double)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. arktest Namespace: LT (Less Than)
    // ================================================================
    it('PerformanceTest_arktest_AssertLT_Int_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1 as int, 2 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1 as int, 2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Int_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: int, value2: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLT_Double_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1.0 , 2.0 );
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1.0 , 2.0 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Double_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: double, value2: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLT_Byte_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1 as byte, 2 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1 as byte, 2 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Byte_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: byte, value2: byte)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLT_Short_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1 as short, 2 as short);;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1 as short, 2 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Short_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: short, value2: short)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLT_Long_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1 as long, 2 as long);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1 as long, 2 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Long_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: long, value2: long)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLT_Float_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLT(1.0f, 2.0f);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLT(1.0f, 2.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLT_Float_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLT', 'assertLT(value1: float, value2: float)', arkTsAveragedTime);
    })

    // ================================================================
    // 3. arktest Namespace: LE (Less Than or Equal)
    // ================================================================
    it('PerformanceTest_arktest_AssertLE_Int_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1 as int, 1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1 as int, 1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Int_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE', 'assertLE(value1: int, value2: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLE_Double_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1.0 as double, 1.0 as double);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1.0 as double, 1.0 as double);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Double_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE', 'assertLE(value1: double, value2: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLE_Byte_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1 as byte, 1 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1 as byte, 1 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Byte_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE', 'assertLE(value1: byte, value2: byte)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLE_Short_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1 as short, 1 as short);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1 as short, 1 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Short_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE',
        'assertLE(value1: short, value2: short)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLE_Long_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1 as long, 1 as long);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1 as long, 1 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Long_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE',
        'assertLE(value1: long, value2: long)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_AssertLE_Float_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = arktest.assertLE(1.0 as float, 1.0 as float);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.assertLE(1.0 as float, 1.0 as float);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_AssertLE_Float_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'assertLE',
        'assertLE(value1: float, value2: float)', arkTsAveragedTime);
    })

    // ================================================================
    // 4. arktest Namespace: expectThrow/expectError/expectNoThrow
    // ================================================================
    it('PerformanceTest_arktest_ExpectThrow_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockThrowFunc = () => { throw new Error("Expected"); };
      let res = arktest.expectThrow(mockThrowFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.expectThrow(mockThrowFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectThrow_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectThrow',
        'expectThrow(cb: () => void, test?: ...)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_ExpectError_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockThrowFunc = () => { throw new Error("Expected"); };
      let res = arktest.expectError(mockThrowFunc, "Expected");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.expectError(mockThrowFunc, "Expected");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectError_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectError',
        'expectError(fn: () => void, expect?: string | Error)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_ExpectNoThrow_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockSafeFunc = () => { let a = 1; };
      let  res = arktest.expectNoThrow(mockSafeFunc)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arktest.expectNoThrow(mockSafeFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectNoThrow_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectNoThrow',
        'expectNoThrow(fn: () => void)', arkTsAveragedTime);
    })

    // ================================================================
    // 4b. arktest Namespace: expectThrowAsync/expectErrorAsync/expectNoThrowAsync
    // ================================================================
    it('PerformanceTest_arktest_ExpectThrowAsync_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mockAsyncThrowFunc = async () => { throw new Error("Expected"); };
      let  res = await arktest.expectThrowAsync(mockAsyncThrowFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        res = await arktest.expectThrowAsync(mockAsyncThrowFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectThrowAsync_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectThrowAsync',
        'expectThrowAsync(cb: () => Promise<void>, test?: ...)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_ExpectErrorAsync_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mockAsyncThrowFunc = async () => { throw new Error("Expected"); };
      let res = await arktest.expectErrorAsync(mockAsyncThrowFunc, "Expected");
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        res = await arktest.expectErrorAsync(mockAsyncThrowFunc, "Expected");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectErrorAsync_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectErrorAsync',
        'expectErrorAsync(fn: () => Promise<void>, expect?: string | Error)', arkTsAveragedTime);
    })

    it('PerformanceTest_arktest_ExpectNoThrowAsync_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mockAsyncSafeFunc = async () => { let a = 1; };
      let res = await arktest.expectNoThrowAsync(mockAsyncSafeFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        res = await arktest.expectNoThrowAsync(mockAsyncSafeFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_arktest_ExpectNoThrowAsync_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'arktest', 'expectNoThrowAsync',
        'expectNoThrowAsync(fn: () => Promise<void>)', arkTsAveragedTime);
    })

    // ================================================================
    // 5. ArkTestSync Class - 需要 arktext.ets 导出 ArkTestSync 后启用
    // ================================================================
    // it('PerformanceTest_ArkTest_Constructor_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let mockFn = () => {};
    //   let res = new arktest.ArkTestSync("Test", mockFn);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) { res = new arktest.ArkTestSync("Test", mockFn); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestSync', 'constructor', 'constructor(name: string, callback: () => void)', arkTsAveragedTime);
    // })

    // it('PerformanceTest_ArkTest_Run_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let testObj = new arktest.ArkTestSync("RunTest", () => { arktest.assertTrue(true); });
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) { res = testObj.run(); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestSync', 'run', 'run(): boolean', arkTsAveragedTime);
    // })

    // it('PerformanceTest_ArkTest_GetFullName_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let suite = new arktest.ArkTestsuite("Suite");
    //   let testObj = new arktest.ArkTestSync("NameTest", () => {});
    //   testObj.setSuite(suite);
    //   let res: string = "";
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) { res = testObj.getFullName(); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestSync', 'getFullName', 'getFullName(): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_ArkTest_SetSuite_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let suite = new arktest.ArkTestsuite("Suite");
    //   let testObj = new arktest.ArkTestSync("SetTest", () => {});
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) { testObj.setSuite(suite); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = testObj;
    //   performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestSync', 'setSuite', 'setSuite(suite: ArkTestsuite): void', arkTsAveragedTime);
    // })

    // ================================================================
    // 6. ArkTestsuite Class
    // ================================================================
    it('PerformanceTest_ArkTestsuite_Constructor_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new arktest.ArkTestsuite("Suite");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new arktest.ArkTestsuite("Suite");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_Constructor_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'constructor',
        'constructor(name: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_Before_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("Suite");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        suite.before();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = suite;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_Before_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite',
        'before', 'before(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_After_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("Suite");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        suite.after();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = suite;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_After_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'after',
        'after(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_AddTestNameCb_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("Suite");
      let mockFn = () => {};
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        suite.addTest("T" , mockFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = suite;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_AddTestNameCb_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'addTest',
        'addTest(name: string, callback: () => void)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_AddAsyncTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("Suite");
      let mockAsyncFn = async () => {};
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        suite.addAsyncTest("A", mockAsyncFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = suite;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_AddAsyncTest_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'addAsyncTest',
        'addAsyncTest(name: string, asyncCallback: () => Promise<void>)', arkTsAveragedTime);
    })

    // it('PerformanceTest_ArkTestsuite_AddTestInstance_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let suite = new arktest.ArkTestsuite("Suite");
    //   let testObj = new arktest.ArkTestSync("Obj", () => {});
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) { suite.addTest(testObj); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = suite;
    //   performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'addTest', 'addTest(test: ArkTestSync)', arkTsAveragedTime);
    // })

    it('PerformanceTest_ArkTestsuite_Run_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("RunSuite");
      suite.addTest("Empty", () => { arktest.assertTrue(true); });
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = suite.run();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_Run_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'run', 'run(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_Name_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let suite = new arktest.ArkTestsuite("SuiteName");
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = suite.name;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_Name_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'name', 'readonly name: string', arkTsAveragedTime);
    })

    it('PerformanceTest_ArkTestsuite_RunAsync_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let suite = new arktest.ArkTestsuite("RunAsyncSuite");
      suite.addTest("Empty", () => { arktest.assertTrue(true); });
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        res = await suite.runAsync();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArkTestsuite_RunAsync_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.testing', 'ArkTestsuite', 'runAsync', 'runAsync(): Promise<int>', arkTsAveragedTime);
    })

  })
}