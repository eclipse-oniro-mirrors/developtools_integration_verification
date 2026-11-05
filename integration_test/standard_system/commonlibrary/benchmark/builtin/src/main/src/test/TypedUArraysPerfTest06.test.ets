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

export default function TypedUArraysPerfTest06(): void {
  describe('TypedUArraysPerfTest06', () => {
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

    // ==================== Uint8ClampedArray 构造函数补充 Overload ====================

    it('PerformanceTest_Uint8ClampedArray_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8ClampedArray([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })
    // App died
    // it('PerformanceTest_Uint8ClampedArray_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let result = new Uint8ClampedArray([1 as number, 2 as number, 3 as number, 4 as number, 5 as number] as FixedArray<number>);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = new Uint8ClampedArray([1 as number, 2 as number, 3 as number, 4 as number, 5 as number] as FixedArray<number>);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    // })

    // it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: Array<int> = [1, 2, 3, 4, 5];
    //   let result = new Uint8ClampedArray(arr);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = new Uint8ClampedArray(arr);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
    // })

    it('PerformanceTest_Uint8ClampedArray_Constructor_IterableNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let iter: Iterable<number> = [1, 2, 3, 4, 5];
      let result = new Uint8ClampedArray(iter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(iter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_IterableNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayBufferLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayBufferLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(ArrayBufferLike, int, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayLikeBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayLikeBuffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray copyWithin Overload ====================

    it('PerformanceTest_Uint8ClampedArray_copyWithin_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray copyWithin_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'copyWithin', 'copyWithin(int): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray fill Overload ====================

    it('PerformanceTest_Uint8ClampedArray_fill_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42 as number, 0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray fill_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill', 'fill(number, int, int): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray set Overload ====================

    it('PerformanceTest_Uint8ClampedArray_set_int_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 99 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_int_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let src: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(FixedArray<int>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let src: FixedArray<number> = [1, 2, 3, 4, 5] as FixedArray<number>;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_Uint8ClampedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_Uint8ClampedArray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(Uint8ClampedArray): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray of Overload ====================

    it('PerformanceTest_Uint8ClampedArray_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'of', 'of(): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_of_FixedArrayShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray of_FixedArrayShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'of', 'of(FixedArray<short>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_of_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'of', 'of(FixedArray<number>): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray from Overload ====================

    it('PerformanceTest_Uint8ClampedArray_from_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray from_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(FixedArray<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_from_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray from_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(ArrayLike<number>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_from_IterableCB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = Uint8ClampedArray.from(srcArr, (v: number) => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr, (v: number) => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray from_IterableCB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(Iterable<number>, number, number): => number): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray includes Overload ====================

    it('PerformanceTest_Uint8ClampedArray_includes_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray includes_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes', 'includes(int, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_includes_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray includes_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray indexOf Overload ====================

    it('PerformanceTest_Uint8ClampedArray_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_indexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: int = arr.indexOf(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray indexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray lastIndexOf Overload ====================

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: int = arr.lastIndexOf(3 as number, 4 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3 as number, 4 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray slice Overload ====================

    it('PerformanceTest_Uint8ClampedArray_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: Uint8ClampedArray = arr.slice(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'slice', 'slice(int): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray sort Overload ====================

    it('PerformanceTest_Uint8ClampedArray_sort_noArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
      let result: Uint8ClampedArray = arr.sort();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray sort_noArg: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'sort', 'sort(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_sort_compareFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
      let result: Uint8ClampedArray = arr.sort((a: number, b: number) => (a - b).toInt());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort((a: number, b: number) => (a - b).toInt());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray sort_compareFn: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'sort', 'sort(number, number): => int): this', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray with Overload ====================

    it('PerformanceTest_Uint8ClampedArray_with_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: Uint8ClampedArray = arr.with(2, 10 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray with_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'with', 'with(int, number): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray some Overload ====================

    it('PerformanceTest_Uint8ClampedArray_some_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((v: number, i: int, a: Uint8ClampedArray): boolean => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: number, i: int, a: Uint8ClampedArray): boolean => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray some_full: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some', 'some(number, int, Uint8ClampedArray): => boolean): boolean', arkTsAveragedTime);
    })
  })
}
