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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "@ohos/hypium";
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest03(): void {
  describe('TypedArraysPerfTest03', () => {
    const BASE_COUNT: number = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Float32Array_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = new Float32Array();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = new Float32Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = 1.0;
        }
        let result: Float32Array = new Float32Array(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Float32Array(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(numbers: Float32Array)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(elements: Iterable<number>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let res: Float32Array = new Float32Array(buf);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let byteOffset: number = 100;
        let res: Float32Array = new Float32Array(buf, byteOffset);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array(buf, byteOffset);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(buf: ArrayBuffer, byteOffset: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_Constructor_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let byteOffset: number = 100;
        let length: number = 75;
        let res: Float32Array = new Float32Array(buf, byteOffset, length);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Float32Array(buf, byteOffset, length);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
          'constructor(buf: ArrayBuffer, byteOffset: number, length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_buffer_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let res = arr.buffer;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.buffer;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array buffer: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'buffer',
          'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_byteLength_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let res: number = arr.byteLength;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array byteLength: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'byteLength',
          'byteLength: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_byteOffset_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let arr: Float32Array = new Float32Array(buf, 100, 75);
        let res: number = arr.byteOffset;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteOffset;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array byteOffset: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'byteOffset',
          'byteOffset: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_BYTES_PER_ELEMENT_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = Float32Array.BYTES_PER_ELEMENT;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.BYTES_PER_ELEMENT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'BYTES_PER_ELEMENT',
          'static BYTES_PER_ELEMENT: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_length_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let res: number = arr.length;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array length: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'length',
          'length: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_at_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number | undefined = arr[2];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr[2];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array at: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'at',
          'at(index: number): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_copyWithin_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.copyWithin(0, 2, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array copyWithin: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'copyWithin',
          'copyWithin(target: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_entries_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: IterableIterator<[number, number]> = arr.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array entries: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'entries',
          'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_fill_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.fill(10.0, 0, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array fill: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'fill',
          'fill(value: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_set_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set([5.0], 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set',
          'set(insertPos: number, val: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_set_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array(100);
        let srcArr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(srcArr, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array set_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'set',
          'set(arr: TypedArray, offset?: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_includes_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: boolean = arr.includes(3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.includes(3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array includes: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'includes',
          'includes(searchElement: number, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_indexOf_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number = arr.indexOf(3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.indexOf(3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array indexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'indexOf',
          'indexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_join_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: string = arr.join(',');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join(',');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array join: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'join',
          'join(separator?: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_lastIndexOf_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number = arr.lastIndexOf(3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.lastIndexOf(3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'lastIndexOf',
          'lastIndexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_reverse_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.reverse();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array reverse: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'reverse',
          'reverse(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_slice_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.slice(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array slice: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'slice',
          'slice(begin?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_subarray_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.subarray(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.subarray(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array subarray: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'subarray',
          'subarray(begin?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_toReversed_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.slice().reverse();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice().reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array toReversed: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'toReversed',
          'toReversed(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_toSorted_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([5.0, 2.0, 3.0, 1.0, 4.0]);
        let res: Float32Array = arr.slice().sort();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice().sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array toSorted: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'toSorted',
          'toSorted(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_toString_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: string = arr.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'toString',
          'toString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_keys_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: IterableIterator<number> = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array keys: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'keys',
          'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_values_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: IterableIterator<number> = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array values: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'values',
          'values(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_some_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: boolean = arr.some((v) => v > 3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.some((v) => v > 3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array some: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'some',
          'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_every_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: boolean = arr.every((v) => v > 0.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.every((v) => v > 0.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array every: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'every',
          'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_find_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number | undefined = arr.find((v) => v > 3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.find((v) => v > 3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array find: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'find',
          'find(predicate: (v, i, arr) => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_find_3400Index_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number = arr.findIndex((v) => v > 3.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.findIndex((v) => v > 3.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array findIndex: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'findIndex',
          'findIndex(predicate: (v, i, arr) => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_filter_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.filter((v) => v > 2.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.filter((v) => v > 2.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array filter: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'filter',
          'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_map_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = arr.map((v) => v * 2.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.map((v) => v * 2.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array map: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'map',
          'map(fn: (v, i, arr) => number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_reduce_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Float32Array): number => {
          return previousValue + currentValue;
        }, 0.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Float32Array): number => previousValue + currentValue, 0.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array reduce: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'reduce',
          'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: number, array: Float32Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_reduce_3800Right_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Float32Array): number => {
          return previousValue + currentValue;
        }, 0.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Float32Array): number => previousValue + currentValue, 0.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array reduceRight: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'reduceRight',
          'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: number, array: Float32Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_forEach_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach((v) => { let x = v; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array forEach: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'forEach',
          'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_sort_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: Float32Array[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          arrays.push(new Float32Array([5.0, 2.0, 3.0, 1.0, 4.0]));
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrays[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arrays[BASE_COUNT - 1];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array sort: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'sort',
          'sort(compareFn?: (a, b) => number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_static_of_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array static_of: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'static_of',
          'static of(...items: Array<number>): Float32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_static_from_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Array<number> = new Array<number>(100);
        srcArr.fill(1.0);
        let res: Float32Array = Float32Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array static_from_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'static_from_array',
          'static from(arr: Array<number>): Float32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_static_from_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Float32Array = new Float32Array(100);
        srcArr.fill(1.0);
        let res: Float32Array = Float32Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array static_from_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'static_from_typedArray',
          'static from(arr: TypedArray): Float32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_static_from_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcItems: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let res: Float32Array = Float32Array.from(srcItems);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.from(srcItems);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array static_from_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'static_from_iterable',
          'static from(iterable: Iterable<number>): Float32Array', arkTsAveragedTime);
      done();
      })
  })
}