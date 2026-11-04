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

export default function TypedUArraysPerfTest10(): void {
  describe('TypedUArraysPerfTest10', () => {
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

    // ==================== Uint16Array from Overload ====================

    it('PerformanceTest_Uint16Array_from_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      let result = Uint16Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(FixedArray<int>): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_from_Int16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result = Uint16Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from_Int16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Int16Array): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = Uint16Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(ArrayLike<number>): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_from_IterableCB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = Uint16Array.from(srcArr, (v: number) => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.from(srcArr, (v: number) => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from_IterableCB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Iterable<number>, number, number): => number): Uint16Array', arkTsAveragedTime);
    })

    // ==================== Uint16Array sort Overload ====================

    it('PerformanceTest_Uint16Array_sort_compareFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([5, 2, 3, 1, 4]);
      let result: Uint16Array = arr.sort((a: number, b: number) => (a - b).toInt());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort((a: number, b: number) => (a - b).toInt());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array sort_compareFn: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'sort', 'sort(number, number): => int): this', arkTsAveragedTime);
    })

    // ==================== Uint16Array with Overload ====================

    it('PerformanceTest_Uint16Array_with_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.with(2, 10 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array with_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'with', 'with(int, int): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_with_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.with(2, 10 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array with_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'with', 'with(int, number): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_some_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((v: number, i: int, a: Uint16Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: number, i: int, a: Uint16Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array some_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'some', 'some(number, int, Uint16Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_reduce_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint16Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint16Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array reduce_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduce', 'reduce(number, number, int, Uint16Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_reduceRight_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint16Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint16Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array reduceRight_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduceRight', 'reduceRight(number, number, int, Uint16Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_map_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.map((v: number, i: int, a: Uint16Array): number => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: number, i: int, a: Uint16Array): number => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array map_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'map', 'map(number, int, Uint16Array): => number): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_every_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => v >= 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: number, i: int, a: Uint16Array): boolean => v >= 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array every_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'every', 'every(number, int, Uint16Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_filter_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.filter((v: number, i: int, a: Uint16Array): boolean => v > 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: number, i: int, a: Uint16Array): boolean => v > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array filter_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'filter', 'filter(number, int, Uint16Array): => boolean): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_find_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.find((v: number, i: int, a: Uint16Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: number, i: int, a: Uint16Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array find_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'find', 'find(number, int, Uint16Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_findIndex_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number, i: int, a: Uint16Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: number, i: int, a: Uint16Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array findIndex_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findIndex', 'findIndex(number, int, Uint16Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_findLast_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.findLast((v: number, i: int, a: Uint16Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((v: number, i: int, a: Uint16Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array findLast_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLast', 'findLast(number, int, Uint16Array): => boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_findLastIndex_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: int = arr.findLastIndex((v: number, i: int, a: Uint16Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((v: number, i: int, a: Uint16Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array findLastIndex_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLastIndex', 'findLastIndex(number, int, Uint16Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_forEach_Uint16Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: number, i: int, a: Uint16Array): void => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array forEach_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'forEach', 'forEach(number, int, Uint16Array): => void): void', arkTsAveragedTime);
    })
  })
}
