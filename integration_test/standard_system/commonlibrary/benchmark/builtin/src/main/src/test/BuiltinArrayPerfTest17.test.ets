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

export default function BuiltinArrayPerfTest17(): void {
  describe('BuiltinArrayPerfTest17', () => {
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

    // ==================== filter ====================

    it('PerformanceTest_BuiltinArrayTest_58300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: boolean): boolean => value > true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<boolean>, boolean, int, FixedArray<boolean>): => boolean): FixedArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: byte): boolean => value > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<byte>, byte, int, FixedArray<byte>): => boolean): FixedArray<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: float): boolean => value > 3.3f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<float>, float, int, FixedArray<float>): => boolean): FixedArray<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: int): boolean => value > 200);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<int>, int, int, FixedArray<int>): => boolean): FixedArray<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: long): boolean => value > 3000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<long>, long, int, FixedArray<long>): => boolean): FixedArray<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_58800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: short): boolean => value > 30);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
        'filter(FixedArray<short>, short, int, FixedArray<short>): => boolean): FixedArray<short>', arkTsAveragedTime);
    })


    // ==================== find ====================

    it('PerformanceTest_BuiltinArrayTest_58900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result: Boolean | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: boolean) => value == true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_58900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<boolean>, boolean, int, FixedArray<boolean>): => boolean): Boolean | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<byte>, byte, int, FixedArray<byte>): => boolean): Byte | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: Char | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: char) => value > c'c');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<char>, char, int, FixedArray<char>): => boolean): Char | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: double) => value > 3.33);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<double>, double, int, FixedArray<double>): => boolean): Double | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: float) => value > 3.3f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<float>, float, int, FixedArray<float>): => boolean): Float | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: int) => value > 300);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<int>, int, int, FixedArray<int>): => boolean): Int | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: long) => value > 3000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<long>, long, int, FixedArray<long>): => boolean): Long | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: Short | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: short) => value > 30);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(FixedArray<short>, short, int, FixedArray<short>): => boolean): Short | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: Boolean | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: boolean) => value == true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<boolean>, boolean, int, ValueArray<boolean>): => boolean): Boolean | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<byte>, byte, int, ValueArray<byte>): => boolean): Byte | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_59900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: Char | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: char) => value > c'c');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_59900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<char>, char, int, ValueArray<char>): => boolean): Char | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_60000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: double) => value > 3.33);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_60000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<double>, double, int, ValueArray<double>): => boolean): Double | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_60100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: float) => value > 3.3f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_60100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<float>, float, int, ValueArray<float>): => boolean): Float | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_60200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: int) => value > 300);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_60200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<int>, int, int, ValueArray<int>): => boolean): Int | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_60300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: long) => value > 3000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_60300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<long>, long, int, ValueArray<long>): => boolean): Long | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_60400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: Short | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(va, (value: short) => value > 30);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_60400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
        'find(ValueArray<short>, short, int, ValueArray<short>): => boolean): Short | undefined', arkTsAveragedTime);
    })


    // ==================== findLast ====================

    it('PerformanceTest_BuiltinArrayTest_47400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result: Boolean | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: boolean) => value == true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<boolean>, boolean, int, FixedArray<boolean>): => boolean): Boolean | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_47500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<byte>, byte, int, FixedArray<byte>): => boolean): Byte | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_47600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: Char | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: char) => value > c'c');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<char>, char, int, FixedArray<char>): => boolean): Char | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_47700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: double) => value > 3.33);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<double>, double, int, FixedArray<double>): => boolean): Double | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_47800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: float) => value > 3.3f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<float>, float, int, FixedArray<float>): => boolean): Float | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_47900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: int) => value > 300);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_47900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<int>, int, int, FixedArray<int>): => boolean): Int | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: long) => value > 3000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<long>, long, int, FixedArray<long>): => boolean): Long | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: Short | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value: short) => value > 30);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(FixedArray<short>, short, int, FixedArray<short>): => boolean): Short | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: Boolean | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: boolean) => value == true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<boolean>, boolean, int, ValueArray<boolean>): => boolean): Boolean | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<byte>, byte, int, ValueArray<byte>): => boolean): Byte | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: Char | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: char) => value > c'c');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<char>, char, int, ValueArray<char>): => boolean): Char | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: Double | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: double) => value > 3.33);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<double>, double, int, ValueArray<double>): => boolean): Double | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: Float | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: float) => value > 3.3f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<float>, float, int, ValueArray<float>): => boolean): Float | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: int) => value > 300);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<int>, int, int, ValueArray<int>): => boolean): Int | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: Long | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: long) => value > 3000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<long>, long, int, ValueArray<long>): => boolean): Long | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_48900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: Short | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(va, (value: short) => value > 30);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_48900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
        'findLast(ValueArray<short>, short, int, ValueArray<short>): => boolean): Short | undefined', arkTsAveragedTime);
    })


    // ==================== keys ====================

    it('PerformanceTest_BuiltinArrayTest_49000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = keys(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = keys(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'keys',
        'keys(FixedArray<int>): IterableIterator<int>', arkTsAveragedTime);
    })


    // ==================== values ====================

    it('PerformanceTest_BuiltinArrayTest_49100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<boolean>): IterableIterator<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<byte>): IterableIterator<byte>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<char>): IterableIterator<char>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<double>): IterableIterator<double>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<float>): IterableIterator<float>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<int>): IterableIterator<int>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<long>): IterableIterator<long>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_49800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = values(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_49800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
        'values(FixedArray<short>): IterableIterator<short>', arkTsAveragedTime);
    })


  })
}
