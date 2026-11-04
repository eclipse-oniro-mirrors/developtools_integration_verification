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
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest01(): void {
  describe('TypedUArraysPerfTest01', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint16Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = new Uint16Array();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = new Uint16Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(length: int)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = new Uint16Array(100 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(100 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint16Array = new Uint16Array(100);
        let res: Uint16Array = new Uint16Array(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array([1, 2, 3, 4, 5]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(numbers: FixedArray<short>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res: Uint16Array = new Uint16Array(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(numbers: Uint16Array)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let res: Uint16Array = new Uint16Array(buf);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let res: Uint16Array = new Uint16Array(buf, 50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(buf, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let res: Uint16Array = new Uint16Array(buf, 50, 75);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint16Array(buf, 50, 75);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int, length: int)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_buffer_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let res = arr.buffer;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.buffer;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array buffer: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_byteLength_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let res = arr.byteLength;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array byteLength: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'byteLength', 'byteLength: int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_byteOffset_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let arr: Uint16Array = new Uint16Array(buf, 50, 75);
        let res = arr.byteOffset;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteOffset;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 =res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array byteOffset: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'byteOffset', 'byteOffset: int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_BYTES_PER_ELEMENT_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = Uint16Array.BYTES_PER_ELEMENT;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint16Array.BYTES_PER_ELEMENT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_length_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let res = arr.length;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array length: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'length', 'length: int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_at_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr[2];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr[2];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array at: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'at', 'at(index: int): Number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_copyWithin_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.copyWithin(0, 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.copyWithin(0, 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array copyWithin: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'copyWithin', 'copyWithin(target: int, start: int): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_entries_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array entries: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'entries', 'entries(): IterableIterator<[int, short]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_fill_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let res = arr;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.fill(10, 0, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array fill: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'fill', 'fill(value: short, start?: int, end?: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_set_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(srcArr, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(arr: TypedArray, offset?: int): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_set_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array(100);
        let srcArr: Array<number> = [1, 2, 3, 4, 5];
        let res = arr;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(srcArr, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array set_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'set', 'set(arr: Array<number>, offset?: int): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_includes_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.includes(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.includes(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array includes: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'includes', 'includes(searchElement: short, fromIndex?: int): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_indexOf_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: number = arr.indexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.indexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array indexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'indexOf', 'indexOf(searchElement: short, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_join_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: string = arr.join("-");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join("-");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array join: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'join', 'join(separator?: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_lastIndexOf_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: number = arr.lastIndexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.lastIndexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'lastIndexOf', 'lastIndexOf(searchElement: short, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_reverse_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.reverse();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array reverse: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reverse', 'reverse(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_slice_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.slice(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array slice: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'slice', 'slice(begin?: int, end?: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_subarray_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.subarray(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.subarray(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array subarray: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'subarray', 'subarray(begin?: int, end?: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_toReversed_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let copy = arr.slice(); copy.reverse(); let res: Uint16Array = copy;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice().reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array toReversed: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'toReversed', 'toReversed(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_toSorted_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let TEST_SIZE = 100;
        let sourceData: number[] = [];
        for (let i = 0; i < TEST_SIZE; i++) {
          sourceData.push(Math.floor(Math.random() * 10000));
        }
        let arr: Uint16Array = new Uint16Array(sourceData);

        let res: Uint16Array = arr.slice().sort();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice().sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array toSorted: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'toSorted',
          'toSorted(): this', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Uint16Array_toString_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: string = arr.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'toString', 'toString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_keys_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array keys: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'keys', 'keys(): IterableIterator<int>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_values_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array values: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'values', 'values(): IterableIterator<short>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_with_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let copy = arr.slice(); copy[2] = 10; let res: Uint16Array = copy;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          let copy2 = arr.slice(); copy2[2] = 10; res = copy2;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array with: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'with', 'with(index: int, value: short): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_some_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.some((v) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.some((v) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array some: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'some', 'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_every_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.every((v) => v > 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.every((v) => v > 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array every: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'every', 'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_find_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res = arr.find((v) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.find((v) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array find: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'find', 'find(predicate: (v, i, arr) => boolean): short | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_find_3600Index_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: number = arr.findIndex((v) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.findIndex((v) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array findIndex: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findIndex', 'findIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_filter_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.filter((v) => v > 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.filter((v) => v > 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array filter: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'filter', 'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_map_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.map((v) => v * 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.map((v) => v * 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array map: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'map', 'map(fn: (v, i, arr) => short): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_reduce_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => previousValue + currentValue, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array reduce: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint16Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_reduce_4000Right_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => previousValue + currentValue, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array reduceRight: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint16Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_forEach_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let sum = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach((v) => { sum += v; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = sum;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array forEach: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'forEach', 'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
        const expectedSum = (1+2+3+4+5) * BASE_COUNT;
      done();
      })

    it('PerformanceTest_Uint16Array_sort_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void) => {
        let TEST_SIZE = 100;
        let sourceData: number[] = [];
        for (let i = 0; i < TEST_SIZE; i++) {
          sourceData.push(Math.floor(Math.random() * 10000));
        }
        let baseArr: Uint16Array = new Uint16Array(sourceData);
        let res: Uint16Array = baseArr.slice().sort();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = baseArr.slice().sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array sort: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'sort',
          'sort(compareFn?: (a, b) => int): this', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Uint16Array_static_of_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint16Array.of(1, 2, 3, 4, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array static_of: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'static_of', 'static of(...items: FixedArray<short>): Uint16Array', arkTsAveragedTime);
      done();
      })
    it('PerformanceTest_Uint16Array_static_from_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Array<number> = new Array<number>();
        for (let i = 0; i < 100; i++) {
          srcArr.push(i);
        }
        let res: Uint16Array = Uint16Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint16Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array static_from_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'static_from_array', 'static from(arr: Array<number>): Uint16Array', arkTsAveragedTime);
      done();
      })
    it('PerformanceTest_Uint16Array_static_from_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint16Array = new Uint16Array(100);
        for (let i = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let res: Uint16Array = Uint16Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint16Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array static_from_0200: ' + arkTsAveragedTime + 'ns');
         performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'static_from_typedArray', 'static from(arr: TypedArray): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_static_from_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint16Array = Uint16Array.from([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint16Array.from([1, 2, 3, 4, 5]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array static_from_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'static_from_iterable', 'static from(iterable: Iterable<number>): Uint16Array', arkTsAveragedTime);
      done();
      })
  })
}