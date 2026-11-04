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

export default function BuiltinArrayPerfTest14(): void {
  describe('BuiltinArrayPerfTest14', () => {
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

    // ==================== at ====================

    it('PerformanceTest_BuiltinArrayTest_52700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte = 2;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<byte>, int): Byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double = 3.33;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<double>, int): Double', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float = 3.3f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<float>, int): Float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: Int = 200;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<int>, int): Int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long = 3000;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<long>, int): Long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: Short = 30;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(FixedArray<short>, int): Short', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: boolean = true;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<boolean>, int): Boolean', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte = 2;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<byte>, int): Byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double = 3.33;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<double>, int): Double', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float = 3.3f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<float>, int): Float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: Int = 200;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<int>, int): Int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long = 3000;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<long>, int): Long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_53900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: Short = 30;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(va, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_53900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
        'at(ValueArray<short>, int): Short', arkTsAveragedTime);
    })


    // ==================== concat ====================

    it('PerformanceTest_BuiltinArrayTest_54000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let fixArray2: FixedArray<boolean> = [false, true, false, true, false];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<boolean>, FixedArray<boolean>, FixedArray<FixedArray<boolean>>): FixedArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let fixArray2: FixedArray<byte> = [6, 7, 8, 9, 10];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<byte>, FixedArray<byte>, FixedArray<FixedArray<byte>>): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let fixArray2: FixedArray<float> = [6.6f, 7.7f, 8.8f, 9.9f, 10.0f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<float>, FixedArray<float>, FixedArray<FixedArray<float>>): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let fixArray2: FixedArray<int> = [600, 700, 800, 900, 1000];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<int>, FixedArray<int>, FixedArray<FixedArray<int>>): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let fixArray2: FixedArray<long> = [6000, 7000, 8000, 9000, 10000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<long>, FixedArray<long>, FixedArray<FixedArray<long>>): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let fixArray2: FixedArray<short> = [60, 70, 80, 90, 100];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(FixedArray<short>, FixedArray<short>, FixedArray<FixedArray<short>>): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let va2: ValueArray<boolean> = [false, true, false, true, false];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<boolean>, ValueArray<boolean>, FixedArray<ValueArray<boolean>>): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let va2: ValueArray<byte> = [6, 7, 8, 9, 10];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<byte>, ValueArray<byte>, FixedArray<ValueArray<byte>>): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let va2: ValueArray<double> = [6.66, 7.77, 8.88, 9.99, 10.10];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<double>, ValueArray<double>, FixedArray<ValueArray<double>>): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_54900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let va2: ValueArray<float> = [6.6f, 7.7f, 8.8f, 9.9f, 10.0f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_54900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<float>, ValueArray<float>, FixedArray<ValueArray<float>>): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let va2: ValueArray<int> = [600, 700, 800, 900, 1000];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<int>, ValueArray<int>, FixedArray<ValueArray<int>>): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let va2: ValueArray<long> = [6000, 7000, 8000, 9000, 10000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<long>, ValueArray<long>, FixedArray<ValueArray<long>>): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let va2: ValueArray<short> = [60, 70, 80, 90, 100];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(va, va2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'concat',
        'concat(ValueArray<short>, ValueArray<short>, FixedArray<ValueArray<short>>): ValueArray<short>', arkTsAveragedTime);
    })


    // ==================== copyWithin ====================

    it('PerformanceTest_BuiltinArrayTest_55300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(FixedArray<byte>, int): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(FixedArray<float>, int): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(FixedArray<int>, int): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(FixedArray<long>, int): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(FixedArray<short>, int): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<boolean>, int): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_55900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_55900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<byte>, int): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<double>, int): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<float>, int): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<int>, int): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<long>, int): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(va, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
        'copyWithin(ValueArray<short>, int): ValueArray<short>', arkTsAveragedTime);
    })


    // ==================== fill ====================

    it('PerformanceTest_BuiltinArrayTest_56500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(FixedArray<byte>, byte, int, int): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 9.9f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(FixedArray<float>, float, int, int): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(FixedArray<int>, int, int, int): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 9999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(FixedArray<long>, long, int, int): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_56900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_56900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(FixedArray<short>, short, int, int): FixedArray<short>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: ValueArray<boolean> = [true, false, true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<boolean>, boolean, int, int): ValueArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: ValueArray<byte> = [1, 2, 3, 4, 5];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<byte>, byte, int, int): ValueArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 9.99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<double>, double, int, int): ValueArray<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 9.9f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<float>, float, int, int): ValueArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: ValueArray<int> = [100, 200, 300, 400, 500];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<int>, int, int, int): ValueArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 9999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<long>, long, int, int): ValueArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_57600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: ValueArray<short> = [10, 20, 30, 40, 50];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(va, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_57600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
        'fill(ValueArray<short>, short, int, int): ValueArray<short>', arkTsAveragedTime);
    })


  })
}
