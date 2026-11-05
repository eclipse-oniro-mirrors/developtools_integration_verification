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

class TestArrayLike<T> implements ArrayLike<T> {
  private items: T[] = [];

  constructor(items: T[]) {
    this.items = items;
  }

  $_get(index: int): T {
    return this.items[index];
  }

  get length(): int {
    return this.items.length;
  }
}

export default function TypedArraysPerfTest09(): void {
  describe('TypedArraysPerfTest09', () => {
    const BASE_COUNT = 50000;
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

    // ==================== Int8Array of 补充重载 ====================

    it('PerformanceTest_Int8Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = Int8Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of', 'of(): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_of_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = Int8Array.of(1 as int, 2 as int, 3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.of(1 as int, 2 as int, 3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of', 'of(FixedArray<int>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = Int8Array.of(1 as number, 2 as number, 3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.of(1 as number, 2 as number, 3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of', 'of(FixedArray<number>): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int8Array from 补充重载 ====================

    it('PerformanceTest_Int8Array_from_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: int[] = [1 as int, 2 as int, 3 as int, 4 as int, 5 as int];
      let res: Int8Array = Int8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array from_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from', 'from(FixedArray<int>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2, 3]);
      let res: Int8Array = Int8Array.from(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from', 'from(ArrayLike<number>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<number> = [1, 2, 3, 4, 5];
      let transformFn = (x: number, index: number): number => x * 2;
      let res: Int8Array = Int8Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from', 'from(Iterable<number>, (number, number): => number): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int16Array of 补充重载 ====================

    it('PerformanceTest_Int16Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int16Array = Int16Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'of', 'of(): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_of_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int16Array = Int16Array.of(1 as int, 2 as int, 3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.of(1 as int, 2 as int, 3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'of', 'of(FixedArray<int>): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int16Array = Int16Array.of(1 as number, 2 as number, 3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.of(1 as number, 2 as number, 3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'of', 'of(FixedArray<number>): Int16Array', arkTsAveragedTime);
    })

    // ==================== Int16Array from 补充重载 ====================

    it('PerformanceTest_Int16Array_from_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: int[] = [1 as int, 2 as int, 3 as int, 4 as int, 5 as int];
      let res: Int16Array = Int16Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(FixedArray<int>): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_from_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let res: Int16Array = Int16Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(Uint16Array): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2, 3]);
      let res: Int16Array = Int16Array.from(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(ArrayLike<number>): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<number> = [1, 2, 3, 4, 5];
      let transformFn = (x: number, index: number): number => x * 2;
      let res: Int16Array = Int16Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(Iterable<number>, (number, number): => number): Int16Array', arkTsAveragedTime);
    })

    // ==================== Int32Array of 补充重载 ====================

    it('PerformanceTest_Int32Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int32Array = Int32Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'of', 'of(): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int32Array = Int32Array.of(1 as number, 2 as number, 3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.of(1 as number, 2 as number, 3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'of', 'of(FixedArray<number>): Int32Array', arkTsAveragedTime);
    })

    // ==================== Int32Array from 补充重载 ====================

    it('PerformanceTest_Int32Array_from_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: int[] = [1 as int, 2 as int, 3 as int, 4 as int, 5 as int];
      let res: Int32Array = Int32Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array from_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from', 'from(FixedArray<int>): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2, 3]);
      let res: Int32Array = Int32Array.from(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.from(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from', 'from(ArrayLike<number>): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<number> = [1, 2, 3, 4, 5];
      let transformFn = (x: number, index: number): number => x * 2;
      let res: Int32Array = Int32Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from', 'from(Iterable<number>, (number, number): => number): Int32Array', arkTsAveragedTime);
    })

    // ==================== BigInt64Array of 补充重载 ====================

    it('PerformanceTest_BigInt64Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = BigInt64Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_of_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = BigInt64Array.of(1 as int, 2 as int, 3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.of(1 as int, 2 as int, 3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(FixedArray<int>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_of_FixedLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let longVar = new Long(1);
      let res: BigInt64Array = BigInt64Array.of(longVar, new Long(2), new Long(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.of(longVar, new Long(2), new Long(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array of_FixedLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(FixedArray<long>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_of_FixedBigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = BigInt64Array.of(BigInt(1), BigInt(2), BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.of(BigInt(1), BigInt(2), BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array of_FixedBigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(FixedArray<bigint>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = BigInt64Array.of(1 as number, 2 as number, 3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.of(1 as number, 2 as number, 3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(FixedArray<number>): BigInt64Array', arkTsAveragedTime);
    })

    // ==================== BigInt64Array from 补充重载 ====================

    it('PerformanceTest_BigInt64Array_from_FixedBigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigInt[] = [BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)];
      let res: BigInt64Array = BigInt64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from_FixedBigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(FixedArray<BigInt>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcSet: Set<BigInt> = new Set<BigInt>();
      srcSet.add(BigInt(1));
      srcSet.add(BigInt(2));
      srcSet.add(BigInt(3));
      let res: BigInt64Array = BigInt64Array.from(srcSet);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(srcSet);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from_Set: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Set<BigInt>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_from_BigInt64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigInt64Array = BigInt64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from_BigInt64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(BigInt64Array): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_from_ArrayBigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<BigInt> = new Array<BigInt>();
      srcArr.push(BigInt(1));
      srcArr.push(BigInt(2));
      srcArr.push(BigInt(3));
      let res: BigInt64Array = BigInt64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from_ArrayBigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Array<BigInt>): BigInt64Array', arkTsAveragedTime);
    })
    //原因: BigInt64Array.from: not implemented
    // it('PerformanceTest_BigInt64Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2, 3]);
    //   let res: BigInt64Array = BigInt64Array.from(srcLike);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = BigInt64Array.from(srcLike);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let res1 = res;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest BigInt64Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(ArrayLike<number>): BigInt64Array', arkTsAveragedTime);
    // })

    it('PerformanceTest_BigInt64Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<BigInt> = [BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)];
      let transformFn = (x: BigInt, index: number): BigInt => x * BigInt(2);
      let res: BigInt64Array = BigInt64Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Iterable<BigInt>, (BigInt, number): => BigInt): BigInt64Array', arkTsAveragedTime);
    })

    // ==================== Float32Array of 补充重载 ====================

    it('PerformanceTest_Float32Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float32Array = Float32Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'of', 'of(): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_of_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float32Array = Float32Array.of(1 as int, 2 as int, 3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.of(1 as int, 2 as int, 3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'of', 'of(FixedArray<int>): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float32Array = Float32Array.of(1.0 as number, 2.0 as number, 3.0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.of(1.0 as number, 2.0 as number, 3.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'of', 'of(FixedArray<number>): Float32Array', arkTsAveragedTime);
    })

    // ==================== Float32Array from 补充重载 ====================

    it('PerformanceTest_Float32Array_from_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: number[] = [1.0, 2.0, 3.0, 4.0, 5.0];
      let res: Float32Array = Float32Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array from_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from', 'from(FixedArray<number>): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1.0, 2.0, 3.0]);
      let res: Float32Array = Float32Array.from(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.from(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from', 'from(ArrayLike<number>): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let transformFn = (x: number, index: number): number => x * 2.0;
      let res: Float32Array = Float32Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from', 'from(Iterable<number>, (number, number): => number): Float32Array', arkTsAveragedTime);
    })

    // ==================== Float64Array of 补充重载 ====================

    it('PerformanceTest_Float64Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = Float64Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'of', 'of(): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_of_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = Float64Array.of(1 as int, 2 as int, 3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.of(1 as int, 2 as int, 3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'of', 'of(FixedArray<int>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_of_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = Float64Array.of(1.0 as number, 2.0 as number, 3.0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.of(1.0 as number, 2.0 as number, 3.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'of', 'of(FixedArray<number>): Float64Array', arkTsAveragedTime);
    })

    // ==================== Float64Array from 补充重载 ====================

    it('PerformanceTest_Float64Array_from_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: number[] = [1.0, 2.0, 3.0, 4.0, 5.0];
      let res: Float64Array = Float64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array from_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from', 'from(FixedArray<number>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1.0, 2.0, 3.0]);
      let res: Float64Array = Float64Array.from(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from', 'from(ArrayLike<number>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_from_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let transformFn = (x: number, index: number): number => x * 2.0;
      let res: Float64Array = Float64Array.from(srcIter, transformFn);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(srcIter, transformFn);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array from_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from', 'from(Iterable<number>, (number, number): => number): Float64Array', arkTsAveragedTime);
    })
  })
}
