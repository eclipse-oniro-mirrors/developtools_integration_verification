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

export default function TypedUArraysPerfTest02(): void {
  describe('TypedUArraysPerfTest02', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Uint32Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint32Array = new Uint32Array();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint32Array = new Uint32Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint32Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint32Array = new Uint32Array(100);
        let res: Uint32Array = new Uint32Array(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(other: Uint32Array)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array([1, 2, 3, 4, 5]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(array: number[])', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint32Array_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let res: Uint32Array = new Uint32Array(buf);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buffer: ArrayBuffer)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let res: Uint32Array = new Uint32Array(buf, 100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array(buf, 100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buffer: ArrayBuffer, byteOffset: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let res: Uint32Array = new Uint32Array(buf, 100, 75);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Uint32Array(buf, 100, 75);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buffer: ArrayBuffer, byteOffset: number, length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_buffer_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array(100);
        let res = arr.buffer;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.buffer;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array buffer: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_byteLength_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array(100);
        let res: number = arr.byteLength;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array byteLength: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'byteLength', 'byteLength: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_byteOffset_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(400);
        let arr: Uint32Array = new Uint32Array(buf, 100, 75);
        let res: number = arr.byteOffset;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.byteOffset;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array byteOffset: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'byteOffset', 'byteOffset: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_BYTES_PER_ELEMENT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = Uint32Array.BYTES_PER_ELEMENT;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint32Array.BYTES_PER_ELEMENT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_length_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array(100);
        let res: number = arr.length;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array length: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'length', 'length: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_copyWithin_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array([1, 2, 3, 4, 5]); }
        let Stime = systemDateTime.getTime(true);
        let lastArr: Uint32Array = new Uint32Array();
        for (let i = 0; i < BASE_COUNT; i++) {
          lastArr = pools[i].copyWithin(0, 2, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lastArr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array copyWithin: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'copyWithin', 'copyWithin(target: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_entries_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: IterableIterator<[number, number]> = arr.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array entries: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'entries', 'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_fill_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array(100); }
        let Stime = systemDateTime.getTime(true);
        let lastArr: Uint32Array = new Uint32Array();
        for (let i = 0; i < BASE_COUNT; i++) {
          lastArr = pools[i].fill(10, 0, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lastArr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array fill: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'fill', 'fill(value: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_set_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array(100); }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i][5] = 10;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'set', 'set(index: number, value: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_set_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr = new Uint32Array([1, 2, 3, 4, 5]);
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array(100); }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].set(srcArr, 10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array set_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'set', 'set(array: Uint32Array, offset?: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_includes_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.includes(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.includes(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array includes: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(searchElement: number, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_indexOf_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number = arr.indexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.indexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array indexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_join_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: string = arr.join(',');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join(',');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array join: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'join', 'join(separator?: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_lastIndexOf_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number = arr.lastIndexOf(3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.lastIndexOf(3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_reverse_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array([1, 2, 3, 4, 5]); }
        let Stime = systemDateTime.getTime(true);
        let lastRes: Uint32Array = new Uint32Array();
        for (let i = 0; i < BASE_COUNT; i++) {
          lastRes = pools[i].reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lastRes;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array reverse: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reverse', 'reverse(): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_slice_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: Uint32Array = arr.slice(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array slice: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'slice', 'slice(begin?: number, end?: number): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_subarray_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: Uint32Array = arr.subarray(1, 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.subarray(1, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array subarray: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'subarray', 'subarray(begin?: number, end?: number): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_toString_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: string = arr.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toString', 'toString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_keys_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: IterableIterator<number> = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array keys: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'keys', 'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_values_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: IterableIterator<number> = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array values: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'values', 'values(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_some_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.some((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.some((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array some: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'some', 'some(predicate: (value: number, index: number, array: Uint32Array) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_every_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: boolean = arr.every((v: number) => v > 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.every((v: number) => v > 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array every: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'every', 'every(predicate: (value: number, index: number, array: Uint32Array) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_find_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number | undefined = arr.find((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.find((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array find: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'find', 'find(predicate: (value: number, index: number, obj: Uint32Array) => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_find_3000Index_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number = arr.findIndex((v: number) => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.findIndex((v: number) => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array findIndex: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findIndex', 'findIndex(predicate: (value: number, index: number, obj: Uint32Array) => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_filter_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: Uint32Array = arr.filter((v: number) => v > 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.filter((v: number) => v > 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array filter: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'filter', 'filter(predicate: (value: number, index: number, array: Uint32Array) => boolean): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_map_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: Uint32Array = arr.map((v: number) => v * 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.map((v: number) => v * 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array map: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'map', 'map(callbackfn: (value: number, index: number, array: Uint32Array) => number): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_reduce_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number = arr.reduce((prev: number, curr: number) => prev + curr, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduce((prev: number, curr: number) => prev + curr, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array reduce: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduce', 'reduce(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_reduce_3400Right_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: number = arr.reduceRight((prev: number, curr: number) => prev + curr, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduceRight((prev: number, curr: number) => prev + curr, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array reduceRight: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduceRight', 'reduceRight(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_forEach_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let count = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach((v: number) => { count = count + v; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array forEach: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'forEach', 'forEach(callbackfn: (value: number, index: number, array: Uint32Array) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_sort_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: Uint32Array[] = new Array<Uint32Array>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) { pools[i] = new Uint32Array([5, 2, 3, 1, 4]); }
        let Stime = systemDateTime.getTime(true);
        let lastRes: Uint32Array = new Uint32Array();
        for (let i = 0; i < BASE_COUNT; i++) {
          lastRes = pools[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lastRes;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array sort: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'sort', 'sort(compareFn?: (a: number, b: number) => number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_static_of_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint32Array.of(1, 2, 3, 4, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array static_of: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'of', 'static of(...items: number[]): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_static_from_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: number[] = [];
        for (let i = 0; i < 100; i++) {
          srcArr.push(i);
        }
        let res: Uint32Array = Uint32Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint32Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array static_from_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'static from(array: number[]): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_static_from_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint32Array = new Uint32Array(100);
        for (let i = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let res: Uint32Array = Uint32Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint32Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array static_from_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'static from(array: Uint32Array): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_static_from_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Uint32Array = Uint32Array.from([1, 2, 3, 4, 5]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Uint32Array.from([1, 2, 3, 4, 5]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array static_from_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'static from(iterable: Iterable<number>): Uint32Array', arkTsAveragedTime);
      done();
      })
  })
}
