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
  afterAll,
  beforeEach,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest00(): void {
  describe('TypedUArraysPerfTest00', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8ClampedArray();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor()', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8ClampedArray(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
      done();
    })


    it('PerformanceTest_Uint8ClampedArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = new Uint8ClampedArray(srcArr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(numbers: FixedArray<byte>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = new Uint8ClampedArray(arr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(arr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(numbers: Uint8ClampedArray)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: number)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10, 90);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10, 90);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: number, length: number)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_buffer_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.buffer;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.buffer;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_byteLength_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.byteLength;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray byteLength: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteLength', 'byteLength: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_byteOffset_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 10, 90);
      let result = arr.byteOffset;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray byteOffset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteOffset', 'byteOffset: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_BYTES_PER_ELEMENT_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8ClampedArray.BYTES_PER_ELEMENT;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.BYTES_PER_ELEMENT;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_length_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'length', 'length: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_copyWithin_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 2, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'copyWithin', 'copyWithin(target: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_entries_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.entries();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.entries();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'entries', 'entries(): IterableIterator<[number, byte]>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_fill_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(10, 0, 50);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill', 'fill(value: byte, start?: number, end?: number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_set_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[5] = 10;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(insertPos: number, val: byte): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_set_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let pools: Uint8ClampedArray[] = new Array<Uint8ClampedArray>(BASE_COUNT);
      for (let i: number = 0; i < BASE_COUNT; i++) { pools[i] = new Uint8ClampedArray(100); }
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i].set(srcArr, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(arr: TypedArray, offset?: number): void', arkTsAveragedTime)
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_includes_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.includes(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes', 'includes(searchElement: byte, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_indexOf_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.indexOf(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf', 'indexOf(searchElement: byte, fromIndex?: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_join_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.join(',');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.join(',');
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'join', 'join(separator?: String): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.lastIndexOf(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(searchElement: byte, fromIndex?: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_reverse_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reverse();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reverse', 'reverse(): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_slice_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
         result = arr.slice(1, 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'slice', 'slice(begin?: number, end?: number): this', arkTsAveragedTime)
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_subarray_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(1, 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.subarray(1, 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'subarray', 'subarray(begin?: number, end?: number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_toString_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.toString();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toString', 'toString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_keys_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.keys();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.keys();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'keys', 'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_values_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'values', 'values(): IterableIterator<byte>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_some_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.some((v: number) => v > 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: number) => v > 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some', 'some(predicate: (v: number, i: number, arr: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_every_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.every((v: number) => v > 0);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: number) => v > 0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'every', 'every(predicate: (v: number, i: number, arr: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_find_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.find((v: number) => v > 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: number) => v > 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'find', 'find(predicate: (v: number, i: number, arr: Uint8ClampedArray) => boolean): number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_find_3100Index_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.findIndex((v: number) => v > 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: number) => v > 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findIndex', 'findIndex(predicate: (v: number, i: number, arr: Uint8ClampedArray) => boolean): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_filter_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.filter((v: number) => v > 2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: number) => v > 2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'filter', 'filter(fn: (v: number, i: number, arr: Uint8ClampedArray) => boolean): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_map_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.map((v: number) => v * 2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: number) => v * 2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'map', 'map(fn: (v: number, i: number, arr: Uint8ClampedArray) => number): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_reduce_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => previousValue + currentValue, 0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: number, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_reduce_3500Right_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => previousValue + currentValue, 0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: number, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_forEach_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: number) => { let x: number = v; });
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'forEach', 'forEach(callbackfn: (v: number, i: number, arr: Uint8ClampedArray) => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_sort_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
      let result = arr.sort();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'sort', 'sort(compareFn?: (a, b) => number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_static_of_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_of', 'static of(...items: FixedArray<byte>): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Array<number> = new Array<number>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i);
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_array', 'static from(arr: Array<number>): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_typedArray', 'static from(arr: TypedArray): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: number[] = [1, 2, 3, 4, 5];
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_iterable', 'static from(iterable: Iterable<number>): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })
  })
}
