/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest07(): void {
  describe('TypedUArraysPerfTest07', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8Array_Constructor_int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_number_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_FixedArrayInt_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array([1, 2, 3, 4, 5]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_FixedArrayNumber_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array([1, 2, 3, 4, 5]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_IterableNumber_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let iter: number[] = [1, 2, 3, 4, 5];
      let result = new Uint8Array(iter);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(iter);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_IterableNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferLike_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 10, 100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 10, 100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBufferLike, int, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferInt_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 50);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBuffer, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayBufferNumber_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf, 50);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_ArrayLikeBuffer_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8Array(buf);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array Constructor_ArrayLikeBuffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_byteOffset_method_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let arr: Uint8Array = new Uint8Array(buf, 50, 100);
      let result: number = arr.byteOffset;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array byteOffset_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'byteOffset', 'byteOffset(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_byteLength_method_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: number = arr.byteLength;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array byteLength_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'byteLength', 'byteLength(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_length_method_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: number = arr.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array length_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'length', 'length(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_copyWithin_int_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2, 0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array copyWithin_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'copyWithin', 'copyWithin(int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_fill_int_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array fill_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill', 'fill(int, int, int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_fill_number_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array fill_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill', 'fill(number, int, int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_int_int_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[99] = 10;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(int, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_int_number_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[99] = 10;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_int_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(int, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_FixedArrayInt_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let src: number[] = [1, 2, 3, 4, 5];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(FixedArray<int>, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_FixedArrayNumber_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let src: number[] = [1, 2, 3, 4, 5];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_Uint8Array_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_Uint8Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(Uint8Array): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_ArrayLike_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_of_empty_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8Array.of();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayShort_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayShort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<short>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayInt_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<int>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_of_FixedArrayNumber_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'of', 'of(FixedArray<number>): Uint8Array', arkTsAveragedTime);
      done();
    })
  })
}