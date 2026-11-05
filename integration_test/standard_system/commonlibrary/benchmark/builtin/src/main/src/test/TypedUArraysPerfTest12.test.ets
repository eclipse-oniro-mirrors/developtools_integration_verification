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

export default function TypedUArraysPerfTest12(): void {
  describe('TypedUArraysPerfTest12', () => {
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

    // ==================== Uint32Array includes Overload ====================

    it('PerformanceTest_Uint32Array_includes_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array includes_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_includes_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array includes_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    // ==================== Uint32Array indexOf Overload ====================

    it('PerformanceTest_Uint32Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_indexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array indexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    // ==================== Uint32Array lastIndexOf Overload ====================

    it('PerformanceTest_Uint32Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_lastIndexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number, 4 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number, 4 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array lastIndexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    // ==================== Uint32Array of Overload ====================

    it('PerformanceTest_Uint32Array_of_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint32Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint32Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'of', 'of(FixedArray<number>): Uint32Array', arkTsAveragedTime);
    })

    // ==================== Uint32Array slice Overload ====================

    it('PerformanceTest_Uint32Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: Uint32Array = arr.slice(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'slice', 'slice(int): Uint32Array', arkTsAveragedTime);
    })

    // ==================== Uint32Array sort Overload ====================

    it('PerformanceTest_Uint32Array_sort_compareFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let originalData: number[] = [5, 2, 3, 1, 4];
      let arr: Uint32Array = new Uint32Array(originalData);
      let result: Uint32Array = arr.sort((a: number, b: number) => (a - b).toInt());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort((a: number, b: number) => (a - b).toInt());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array sort_compareFn: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'sort', 'sort(number, number): => int): this', arkTsAveragedTime);
    })

    // ==================== Uint32Array with Overload ====================

    it('PerformanceTest_Uint32Array_with_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: Uint32Array = arr.with(2, 10 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array with_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'with', 'with(int, number): Uint32Array', arkTsAveragedTime);
    })

    // ==================== Uint32Array 回调方法 Overload (带 Uint32Array 类型) ====================

    it('PerformanceTest_Uint32Array_some_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((v: number, i: int, a: Uint32Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: number, i: int, a: Uint32Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array some_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'some', 'some(number, int, Uint32Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_reduce_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array reduce_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduce', 'reduce(number, number, int, Uint32Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_reduceRight_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array reduceRight_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduceRight', 'reduceRight(number, number, int, Uint32Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_map_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.map((v: number, i: int, a: Uint32Array): number => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: number, i: int, a: Uint32Array): number => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array map_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'map', 'map(number, int, Uint32Array): => number): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_every_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.every((v: number, i: int, a: Uint32Array): boolean => v >= 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: number, i: int, a: Uint32Array): boolean => v >= 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array every_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'every', 'every(number, int, Uint32Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_filter_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.filter((v: number, i: int, a: Uint32Array): boolean => v > 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: number, i: int, a: Uint32Array): boolean => v > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array filter_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'filter', 'filter(number, int, Uint32Array): => boolean): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_find_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.find((v: number, i: int, a: Uint32Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: number, i: int, a: Uint32Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array find_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'find', 'find(number, int, Uint32Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findIndex_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findIndex_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findIndex', 'findIndex(number, int, Uint32Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findLast_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.findLast((v: number, i: int, a: Uint32Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((v: number, i: int, a: Uint32Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findLast_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findLast', 'findLast(number, int, Uint32Array): => boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findLastIndex_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let result: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findLastIndex_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findLastIndex', 'findLastIndex(number, int, Uint32Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_forEach_Uint32Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: number, i: int, a: Uint32Array): void => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array forEach_Uint32Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'forEach', 'forEach(number, int, Uint32Array): => void): void', arkTsAveragedTime);
    })
  })
}
