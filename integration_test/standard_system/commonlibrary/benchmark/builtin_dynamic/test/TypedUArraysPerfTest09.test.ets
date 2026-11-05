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

export default function TypedUArraysPerfTest09(): void {
  describe('TypedUArraysPerfTest09', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint16Array_Constructor_FixedArrayInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array([1, 2, 3, 4, 5]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_FixedArrayNumber_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array([1, 2, 3, 4, 5]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_ArrayInt_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result = new Uint16Array(arr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array(arr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_IterableNumber_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let iter: number[] = [1, 2, 3, 4, 5];
      let result = new Uint16Array(iter);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array(iter);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_IterableNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_ArrayBufferLike_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint16Array(buf, 10, 95);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array(buf, 10, 95);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_ArrayBufferLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(ArrayBufferLike, int, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_ArrayBufferNumber_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint16Array(buf, 50);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array(buf, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_Constructor_ArrayLikeBuffer_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint16Array(buf);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint16Array(buf);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array Constructor_ArrayLikeBuffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_byteOffset_method_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let arr: Uint16Array = new Uint16Array(buf, 50, 75);
      let result: number = arr.byteOffset;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array byteOffset_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'byteOffset', 'byteOffset(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_byteLength_method_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let result: number = arr.byteLength;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array byteLength_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'byteLength', 'byteLength(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_length_method_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let result: number = arr.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array length_method: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'length', 'length(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_copyWithin_int_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(2, 0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array copyWithin_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'copyWithin', 'copyWithin(int): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_fill_int_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array fill_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'fill', 'fill(int, int, int): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_fill_number_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array fill_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'fill', 'fill(number, int, int): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_int_int_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[99] = 10;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(int, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_int_number_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[99] = 10;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_int_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(int, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_FixedArrayInt_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let src: number[] = [1, 2, 3, 4, 5];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(FixedArray<int>, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_FixedArrayNumber_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let src: number[] = [1, 2, 3, 4, 5];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(src, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(FixedArray<number>, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_Uint16Array_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_Uint16Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(Uint16Array): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_set_ArrayLike_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint16Array = new Uint16Array(100);
      let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array set_ArrayLike: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(ArrayLike<number>, int = 0): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_of_empty_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint16Array.of();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.of();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'of', 'of(): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_of_FixedArrayInt_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint16Array.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array of_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'of', 'of(FixedArray<int>): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_of_FixedArrayNumber_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint16Array.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint16Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'of', 'of(FixedArray<number>): Uint16Array', arkTsAveragedTime);
      done();
    })
  })
}