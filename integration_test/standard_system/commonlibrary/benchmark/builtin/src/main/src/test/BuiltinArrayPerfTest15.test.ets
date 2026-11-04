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

export default function BuiltinArrayPerfTest15(): void {
  describe('BuiltinArrayPerfTest15', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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

    // ==================== slice ====================

    it('PerformanceTest_BuiltinArrayTest_40000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(FixedArray<byte>, int): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(FixedArray<float>, int): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(FixedArray<int>, int): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(FixedArray<long>, int): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(FixedArray<short>, int): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<boolean>, int): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<byte>, int): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<double>, int): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<float>, int): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_40900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_40900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<int>, int): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<long>, int): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
        'slice(ValueArray<short>, int): ValueArray<short>', arkTsAveragedTime);
    })


    // ==================== toSpliced ====================

    it('PerformanceTest_BuiltinArrayTest_41200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(FixedArray<byte>, int): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(FixedArray<float>, int): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(FixedArray<int>, int): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(FixedArray<long>, int): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(FixedArray<short>, int): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<boolean>, int): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<byte>, int): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_41900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<double>, int): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<float>, int): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<int>, int): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<long>, int): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
        'toSpliced(ValueArray<short>, int): ValueArray<short>', arkTsAveragedTime);
    })


    // ==================== with ====================

    it('PerformanceTest_BuiltinArrayTest_42400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<boolean>, int, boolean): FixedArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<byte>, int, byte): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, 9.9f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<float>, int, float): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<int>, int, int): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, 9999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<long>, int, long): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_42900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(FixedArray<short>, int, short): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<boolean>, int, boolean): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<byte>, int, byte): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 9.99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<double>, int, double): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 9.9f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<float>, int, float): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<int>, int, int): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 9999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<long>, int, long): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(va, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
        'with(ValueArray<short>, int, short): ValueArray<short>', arkTsAveragedTime);
    })


    // ==================== entries ====================

    it('PerformanceTest_BuiltinArrayTest_43700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result: IterableIterator<[int, boolean]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<boolean>): IterableIterator<[int, boolean]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: IterableIterator<[int, byte]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<byte>): IterableIterator<[int, byte]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_43900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: IterableIterator<[int, char]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<char>): IterableIterator<[int, char]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: IterableIterator<[int, double]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<double>): IterableIterator<[int, double]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: IterableIterator<[int, float]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<float>): IterableIterator<[int, float]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: IterableIterator<[int, int]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<int>): IterableIterator<[int, int]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: IterableIterator<[int, long]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<long>): IterableIterator<[int, long]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: IterableIterator<[int, short]> = entries(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(FixedArray<short>): IterableIterator<[int, short]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_44500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: IterableIterator<[int, boolean]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<boolean>): IterableIterator<[int, boolean]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: IterableIterator<[int, byte]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<byte>): IterableIterator<[int, byte]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: IterableIterator<[int, double]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<double>): IterableIterator<[int, double]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: IterableIterator<[int, float]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<float>): IterableIterator<[int, float]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: IterableIterator<[int, int]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<int>): IterableIterator<[int, int]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: IterableIterator<[int, long]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<long>): IterableIterator<[int, long]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: IterableIterator<[int, short]> = entries(va);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(va);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
        'entries(ValueArray<short>): IterableIterator<[int, short]>', arkTsAveragedTime);
    })


  })
}
