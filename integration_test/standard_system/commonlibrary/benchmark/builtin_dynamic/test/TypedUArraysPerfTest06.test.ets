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
  expect,
  TestType,
  Size,
  Level,
  afterAll,
  beforeEach
} from "@ohos/hypium";
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest06(): void {
  describe('TypedUArraysPerfTest06', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Uint8ClampedArray_Constructor_FixedArrayInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(array: number[])', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_IterableNumber_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let iter: number[] = [1, 2, 3, 4, 5];
        let result: Uint8ClampedArray = new Uint8ClampedArray(iter);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(iter);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_IterableNumber: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(iterable: Iterable<number>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayBufferLike_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf = new ArrayBuffer(100);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf, 10, 50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf, 10, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayBufferLike: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buffer: ArrayBuffer, byteOffset: number, length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayBufferNumber_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf = new ArrayBuffer(100);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf, 10);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buffer: ArrayBuffer, byteOffset: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_ArrayLikeBuffer_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf = new ArrayBuffer(100);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_ArrayLikeBuffer: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buffer: ArrayBuffer)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_buffer_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let res = arr.buffer;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.buffer;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray buffer: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_byteLength_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let res: number = arr.byteLength;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray byteLength: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteLength', 'byteLength: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_byteOffset_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf = new ArrayBuffer(100);
        let arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 10, 50);
        let res: number = arr.byteOffset;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteOffset;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray byteOffset: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteOffset', 'byteOffset: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_BYTES_PER_ELEMENT_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = Uint8ClampedArray.BYTES_PER_ELEMENT;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint8ClampedArray.BYTES_PER_ELEMENT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_length_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let res: number = arr.length;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray length: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'length', 'length: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_copyWithin_int_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.copyWithin(2, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray copyWithin_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'copyWithin', 'copyWithin(target: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_fill_number_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.fill(42, 0, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray fill_number: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill', 'fill(value: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_set_int_number_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr[99] = 10;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray set_int_number: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(index: number, value: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_set_FixedArrayInt_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let src = [1, 2, 3, 4, 5];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(src, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray set_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(array: number[], offset?: number): void', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint8ClampedArray_set_Uint8ClampedArray_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray set_Uint8ClampedArray: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(array: Uint8ClampedArray, offset?: number): void', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint8ClampedArray_of_empty_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Uint8ClampedArray = Uint8ClampedArray.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'of', 'static of(...items: number[]): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_from_FixedArrayInt_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr = [1, 2, 3, 4, 5];
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray from_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'static from(array: number[]): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_from_ArrayLike_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray from_ArrayLike: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'static from(array: Uint8ClampedArray): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_from_IterableCB_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcArr, (v: number) => v * 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcArr, (v: number) => v * 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray from_IterableCB: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'static from(array: Uint8ClampedArray, mapFn: (v: number) => number): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_includes_int_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: boolean = arr.includes(3, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.includes(3, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray includes_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes', 'includes(searchElement: number, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint8ClampedArray_indexOf_int_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number = arr.indexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.indexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray indexOf_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf', 'indexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_int_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number = arr.lastIndexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.lastIndexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_slice_int_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: Uint8ClampedArray = arr.slice(2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.slice(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray slice_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'slice', 'slice(begin?: number, end?: number): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_sort_noArg_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
        let result: Uint8ClampedArray = arr.sort();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray sort_noArg: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'sort', 'sort(compareFn?: (a: number, b: number) => number): this', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint8ClampedArray_entries_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res = arr.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray entries: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'entries', 'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_keys_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray keys: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'keys', 'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_values_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray values: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'values', 'values(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_join_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: string = arr.join(',');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join(',');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray join: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'join', 'join(separator?: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reverse_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: Uint8ClampedArray = arr.reverse();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray reverse: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reverse', 'reverse(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_subarray_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: Uint8ClampedArray = arr.subarray(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.subarray(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray subarray: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'subarray', 'subarray(begin?: number, end?: number): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_toString_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: string = arr.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toString', 'toString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_some_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: boolean = arr.some((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.some((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray some: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some', 'some(predicate: (value: number, index: number, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_every_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: boolean = arr.every((v: number) => v > 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.every((v: number) => v > 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray every: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'every', 'every(predicate: (value: number, index: number, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_find_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number | undefined = arr.find((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.find((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray find: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'find', 'find(predicate: (value: number, index: number, obj: Uint8ClampedArray) => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_find_3400Index_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number = arr.findIndex((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.findIndex((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray findIndex: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findIndex', 'findIndex(predicate: (value: number, index: number, obj: Uint8ClampedArray) => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_filter_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: Uint8ClampedArray = arr.filter((v: number) => v > 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.filter((v: number) => v > 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray filter: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'filter', 'filter(predicate: (value: number, index: number, array: Uint8ClampedArray) => boolean): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_map_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: Uint8ClampedArray = arr.map((v: number) => v * 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.map((v: number) => v * 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray map: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'map', 'map(callbackfn: (value: number, index: number, array: Uint8ClampedArray) => number): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reduce_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number = arr.reduce((prev: number, curr: number) => prev + curr, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.reduce((prev: number, curr: number) => prev + curr, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray reduce: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduce', 'reduce(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reduce_3800Right_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let result: number = arr.reduceRight((prev: number, curr: number) => prev + curr, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.reduceRight((prev: number, curr: number) => prev + curr, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray reduceRight: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduceRight', 'reduceRight(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_forEach_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let count = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach((v: number) => { count = count + v; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray forEach: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'forEach', 'forEach(callbackfn: (value: number, index: number, array: Uint8ClampedArray) => void): void', arkTsAveragedTime);
      done();
      })

  })
}
