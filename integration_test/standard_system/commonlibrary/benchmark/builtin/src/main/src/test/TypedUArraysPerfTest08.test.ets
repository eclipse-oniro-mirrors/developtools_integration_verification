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

export default function TypedUArraysPerfTest08(): void {
  describe('TypedUArraysPerfTest08', () => {
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

    // ==================== Uint8Array from Overload ====================

    it('PerformanceTest_Uint8Array_from_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      let result = Uint8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(FixedArray<int>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_from_Int8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result = Uint8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from_Int8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(Int8Array): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = Uint8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(ArrayLike<number>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_from_IterableCB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = Uint8Array.from(srcArr, (v: number) => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr, (v: number) => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from_IterableCB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(Iterable<number>, number, number): => number): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array includes Overload ====================

    it('PerformanceTest_Uint8Array_includes_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array includes_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'includes', 'includes(int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_includes_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array includes_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'includes', 'includes(int, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_includes_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array includes_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    // ==================== Uint8Array indexOf Overload ====================

    it('PerformanceTest_Uint8Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_indexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array indexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    // ==================== Uint8Array lastIndexOf Overload ====================

    it('PerformanceTest_Uint8Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_lastIndexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number, 4 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number, 4 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array lastIndexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    // ==================== Uint8Array slice Overload ====================

    it('PerformanceTest_Uint8Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: Uint8Array = arr.slice(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'slice', 'slice(int): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array 回调方法 Overload (带完整类型) ====================

    it('PerformanceTest_Uint8Array_reduce_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array reduce_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduce', 'reduce(number, number, int, Uint8Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_reduceRight_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array reduceRight_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduceRight', 'reduceRight(number, number, int, Uint8Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_map_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.map((v: number, i: int, a: Uint8Array): number => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: number, i: int, a: Uint8Array): number => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array map_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'map', 'map(number, int, Uint8Array): => number): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_every_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.every((v: number, i: int, a: Uint8Array): boolean => v >= 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: number, i: int, a: Uint8Array): boolean => v >= 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array every_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'every', 'every(number, int, Uint8Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_filter_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.filter((v: number, i: int, a: Uint8Array): boolean => v > 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: number, i: int, a: Uint8Array): boolean => v > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array filter_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'filter', 'filter(number, int, Uint8Array): => boolean): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_find_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array find_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'find', 'find(number, int, Uint8Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findIndex_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array findIndex_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findIndex', 'findIndex(number, int, Uint8Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findLast_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.findLast((v: number, i: int, a: Uint8Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((v: number, i: int, a: Uint8Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array findLast_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findLast', 'findLast(number, int, Uint8Array): => boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findLastIndex_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let result: int = arr.findLastIndex((v: number, i: int, a: Uint8Array): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((v: number, i: int, a: Uint8Array): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array findLastIndex_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findLastIndex', 'findLastIndex(number, int, Uint8Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_forEach_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: number, i: int, a: Uint8Array): void => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array forEach_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'forEach', 'forEach(number, int, Uint8Array): => void): void', arkTsAveragedTime);
    })
  })
}
