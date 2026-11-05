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

export default function TypedUArraysPerfTest07(): void {
  describe('TypedUArraysPerfTest07', () => {
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

    // ==================== Uint8Array 构造函数补充 Overload ====================

    it('PerformanceTest_Uint8Array_Constructor_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8Array(100 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(100 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8Array(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8Array([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_IterableNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let iter: Iterable<number> = [1, 2, 3, 4, 5];
      let result = new Uint8Array(iter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(iter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_IterableNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 10, 100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 10, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBufferLike, int, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 50 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBuffer, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 50 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayLikeBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayLikeBuffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== Uint8Array 属性方法 Overload ====================

    it('PerformanceTest_Uint8Array_byteOffset_method', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let arr: Uint8Array = new Uint8Array(buf, 50, 100);
      let result: int = arr.byteOffset;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array byteOffset_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'byteOffset', 'byteOffset(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_byteLength_method', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: int = arr.byteLength;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array byteLength_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'byteLength', 'byteLength(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_length_method', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: int = arr.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array length_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'length', 'length(): int', arkTsAveragedTime);
    })

    // ==================== Uint8Array copyWithin Overload ====================

    it('PerformanceTest_Uint8Array_copyWithin_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array copyWithin_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'copyWithin', 'copyWithin(int): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array fill Overload ====================

    it('PerformanceTest_Uint8Array_fill_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42 as int, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array fill_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill', 'fill(int, int, int): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_fill_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42 as number, 0 as int, 50 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array fill_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill', 'fill(number, int, int): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array set Overload ====================

    it('PerformanceTest_Uint8Array_set_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 99 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(int, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_int_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 99 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_int_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(int, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let src: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(FixedArray<int>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let src: FixedArray<number> = [1, 2, 3, 4, 5] as FixedArray<number>;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_Uint8Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(Uint8Array): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_ArrayLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
    })

    // ==================== Uint8Array of Overload ====================

    it('PerformanceTest_Uint8Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<short>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8Array.of(1 as int, 2 as int, 3 as int, 4 as int, 5 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1 as int, 2 as int, 3 as int, 4 as int, 5 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<int>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<number>): Uint8Array', arkTsAveragedTime);
    })
  })
}
