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
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

export default function BuiltinArrayAlgorithmsPerfTest(): void {
  describe('BuiltinArrayAlgorithmsPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
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

    // ========== lowerBoundSearch 测试 - int 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<int> = new FixedArray<int>(7, new Int());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Int_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<int>, key: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Int_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<int> = new FixedArray<int>(7, new Int());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Int_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    // ========== upperBoundSearch 测试 - int 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<int> = new FixedArray<int>(7, new Int());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Int_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<int>, key: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Int_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<int> = new FixedArray<int>(7, new Int());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Int_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    // ========== copyOf 测试 - int 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<int> = new FixedArray<int>(10, new Int());
      for (let i = 0; i < 10; i++) {
        src[i] = i;
      }
      let res: FixedArray<int> = new FixedArray<int>(0, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = copyOf(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Int_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyOf',
        'copyOf(src: FixedArray<int>): FixedArray<int>', arkTsAveragedTime);
    })

    // ========== copyTo 测试 - int 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<int> = new FixedArray<int>(10, new Int());
      for (let i = 0; i < 10; i++) {
        src[i] = i;
      }
      let dst: FixedArray<int> = new FixedArray<int>(10, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        copyTo(src, dst, 0, 0, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = dst;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Int_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyTo',
        'copyTo(src: FixedArray<int>, dst: FixedArray<int>, dstStart: int, srcStart: int, srcEnd: int): void', arkTsAveragedTime);
    })

    // ========== lowerBoundSearch 测试 - long 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<long> = new FixedArray<long>(7, new Long());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Long_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<long>, key: long): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Long_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<long> = new FixedArray<long>(7, new Long());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Long_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    // ========== upperBoundSearch 测试 - long 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<long> = new FixedArray<long>(7, new Long());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Long_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<long>, key: long): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Long_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<long> = new FixedArray<long>(7, new Long());
      arr[0] = 1; arr[1] = 1; arr[2] = 2; arr[3] = 2; arr[4] = 2; arr[5] = 3; arr[6] = 3;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Long_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    //并发格式不规范
    // ========== copyOf 测试 - long 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<long> = new FixedArray<long>(10, new Long());
      for (let i = 0; i < 10; i++) {
        src[i] = i;
      }
      let res: FixedArray<long> = new FixedArray<long>(0, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = copyOf(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Long_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyOf',
        'copyOf(src: FixedArray<long>): FixedArray<long>', arkTsAveragedTime);
    })

    //并发格式不规范
    // ========== copyTo 测试 - long 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<long> = new FixedArray<long>(10, new Long());
      for (let i = 0; i < 10; i++) {
        src[i] = i;
      }
      let res: FixedArray<long> = new FixedArray<long>(10, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        copyTo(src, res, 0, 0, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Long_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyTo',
        'copyTo(src: FixedArray<long>, dst: FixedArray<long>, dstStart: int, srcStart: int, srcEnd: int): void', arkTsAveragedTime);
    })

    // ========== lowerBoundSearch 测试 - double 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Double_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<double> = new FixedArray<double>(7, new Double());
      arr[0] = 1.0; arr[1] = 1.0; arr[2] = 2.0; arr[3] = 2.0; arr[4] = 2.0; arr[5] = 3.0; arr[6] = 3.0;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Double_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<double>, key: double): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Double_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<double> = new FixedArray<double>(7, new Double());
      arr[0] = 1.0; arr[1] = 1.0; arr[2] = 2.0; arr[3] = 2.0; arr[4] = 2.0; arr[5] = 3.0; arr[6] = 3.0;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lowerBoundSearch(arr, 2.0, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_LowerBoundSearch_Double_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'lowerBoundSearch',
        'lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    // ========== upperBoundSearch 测试 - double 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Double_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<double> = new FixedArray<double>(7, new Double());
      arr[0] = 1.0; arr[1] = 1.0; arr[2] = 2.0; arr[3] = 2.0; arr[4] = 2.0; arr[5] = 3.0; arr[6] = 3.0;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Double_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<double>, key: double): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Double_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<double> = new FixedArray<double>(7, new Double());
      arr[0] = 1.0; arr[1] = 1.0; arr[2] = 2.0; arr[3] = 2.0; arr[4] = 2.0; arr[5] = 3.0; arr[6] = 3.0;
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upperBoundSearch(arr, 2.0, 0, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_UpperBoundSearch_Double_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'upperBoundSearch',
        'upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int', arkTsAveragedTime);
    })

    //并发格式不规范
    // ========== copyOf 测试 - double 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Double_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<double> = new FixedArray<double>(10, new Double());
      for (let i = 0; i < 10; i++) {
        src[i] = i * 1.0;
      }
      let res: FixedArray<double> = new FixedArray<double>(0, new Double());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = copyOf(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyOf_Double_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyOf',
        'copyOf(src: FixedArray<double>): FixedArray<double>', arkTsAveragedTime);
    })

    // ========== copyTo 测试 - double 类型 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Double_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: FixedArray<double> = new FixedArray<double>(10, new Double());
      for (let i = 0; i < 10; i++) {
        src[i] = i * 1.0;
      }
      let dst: FixedArray<double> = new FixedArray<double>(10, new Double());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        copyTo(src, dst, 0, 0, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = dst;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_CopyTo_Double_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'copyTo',
        'copyTo(src: FixedArray<double>, dst: FixedArray<double>, dstStart: int, srcStart: int, srcEnd: int): void', arkTsAveragedTime);
    })

    // ========== KEY_NOT_FOUND 常量测试 ==========
    it('PerformanceTest_BuiltinArrayAlgorithms_KeyNotFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = KEY_NOT_FOUND;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayAlgorithms_KeyNotFound_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BuiltinArrayAlgorithms', 'KEY_NOT_FOUND',
        'const KEY_NOT_FOUND: int', arkTsAveragedTime);
    })

  })
}
