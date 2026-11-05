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

export default function TypedArraysPerfTest08(): void {
  describe('TypedArraysPerfTest08', () => {
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

    // ==================== Int8Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_Int8Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'copyWithin', 'copyWithin(int): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_fill_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(5 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array fill_three: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'fill', 'fill(number, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_pos_val', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_pos_val: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_FixedByte', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_FixedByte: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(FixedArray<byte>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_FixedByte_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_FixedByte_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(FixedArray<byte>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_FixedNumber_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_FixedNumber_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_Int8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let srcArr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_Int8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(Int8Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_Int8Array_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let srcArr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_Int8Array_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(Int8Array, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== Int16Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_Int16Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'copyWithin', 'copyWithin(int): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_fill_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(5 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array fill_three: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'fill', 'fill(number, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_set_pos_val', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_pos_val: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_set_FixedShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_FixedShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_set_FixedShort_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_FixedShort_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    // DUPLICATE: Int16Array_set_FixedNumber 与 set_FixedShort(238行)完全相同,都使用相同的数组和签名
    // it('PerformanceTest_Int16Array_set_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: Int16Array = new Int16Array(100);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr.set([1, 2, 3, 4, 5]);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let res1 = arr;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest Int16Array set_FixedNumber: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(FixedArray<number>): void', arkTsAveragedTime);
    // })

    // DUPLICATE: Int16Array_set_FixedNumber_offset 与 set_FixedShort_offset(251行)完全相同,都使用相同的数组和签名
    // it('PerformanceTest_Int16Array_set_FixedNumber_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: Int16Array = new Int16Array(100);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr.set([1, 2, 3, 4, 5], 10 as int);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let res1 = arr;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest Int16Array set_FixedNumber_offset: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    // })

    it('PerformanceTest_Int16Array_set_Int16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let srcArr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_Int16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(Int16Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_set_Int16Array_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let srcArr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_Int16Array_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(Int16Array, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== Int32Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_Int32Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'copyWithin', 'copyWithin(int): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_fill_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(5 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array fill_three: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'fill', 'fill(number, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_pos_val', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_pos_val: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_FixedInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1 as int, 2 as int, 3 as int, 4 as int, 5 as int] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_FixedInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(FixedArray<int>, int = 0): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_FixedInt_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1 as int, 2 as int, 3 as int, 4 as int, 5 as int] as FixedArray<int>, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_FixedInt_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(FixedArray<int>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_FixedNumber_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1, 2, 3, 4, 5], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_FixedNumber_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_Int32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let srcArr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_Int32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(Int32Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_Int32Array_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let srcArr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_Int32Array_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(Int32Array, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== BigInt64Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_BigInt64Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'copyWithin', 'copyWithin(int): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_fill_long', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      let longVar = new Long(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(longVar, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array fill_long: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'fill', 'fill(long, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_fill_BigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(BigInt(10), 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array fill_BigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'fill', 'fill(BigInt, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_set_pos_long', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      let longVar = new Long(5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array set_pos_long: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'set', 'set(int, long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_set_pos_BigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, BigInt(5));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array set_pos_BigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'set', 'set(int, BigInt): void', arkTsAveragedTime);
    })

    // ==================== Float32Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_Float32Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'copyWithin', 'copyWithin(int): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_fill_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(5.0 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array fill_three: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'fill', 'fill(number, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_pos_val', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, 5.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_pos_val: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_FixedFloat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0 as float, 2.0 as float, 3.0 as float, 4.0 as float, 5.0 as float] as FixedArray<float>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_FixedFloat: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(FixedArray<float>, int = 0): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_FixedFloat_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0 as float, 2.0 as float, 3.0 as float, 4.0 as float, 5.0 as float] as FixedArray<float>, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_FixedFloat_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(FixedArray<float>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_FixedNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0, 2.0, 3.0, 4.0, 5.0]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_FixedNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_FixedNumber_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0, 2.0, 3.0, 4.0, 5.0], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_FixedNumber_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_Float32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let srcArr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_Float32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(Float32Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1.0, 2.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== Float64Array copyWithin/fill/set 补充重载 ====================

    it('PerformanceTest_Float64Array_copyWithin_target', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array copyWithin_target: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'copyWithin', 'copyWithin(int): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_fill_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(5.0 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array fill_three: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'fill', 'fill(number, int, int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_pos_val', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10 as int, 5.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_pos_val: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_FixedDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0 as double, 2.0 as double, 3.0 as double, 4.0 as double, 5.0 as double] as FixedArray<double>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_FixedDouble: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(FixedArray<double>, int = 0): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_FixedNumber_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set([1.0, 2.0, 3.0, 4.0, 5.0], 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_FixedNumber_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_Float64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let srcArr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_Float64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(Float64Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1.0, 2.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })
  })
}
