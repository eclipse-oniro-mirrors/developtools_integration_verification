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

export default function TypedUArraysPerfTest02(): void {
  describe('TypedUArraysPerfTest02', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 500;
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

    // ==================== Uint32Array 构造函数测试 ====================

    it('PerformanceTest_Uint32Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = new Uint32Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = new Uint32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(length: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = new Uint32Array(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint32Array = new Uint32Array(100);
      let res: Uint32Array = new Uint32Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(numbers: FixedArray<int>)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Uint32Array = new Uint32Array(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(numbers: Uint32Array)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Uint32Array = new Uint32Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Uint32Array = new Uint32Array(buf, 100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(buf, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_Constructor_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Uint32Array = new Uint32Array(buf, 100, 75);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint32Array(buf, 100, 75);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int, length: int)', arkTsAveragedTime);
    })

    // ==================== Uint32Array 属性测试 ====================

    it('PerformanceTest_Uint32Array_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let res = arr.buffer;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.buffer;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_byteLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let res: int = arr.byteLength;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array byteLength: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'byteLength', 'byteLength: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_byteOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let arr: Uint32Array = new Uint32Array(buf, 100, 75);
      let res: int = arr.byteOffset;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array byteOffset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'byteOffset', 'byteOffset: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_BYTES_PER_ELEMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = Uint32Array.BYTES_PER_ELEMENT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.BYTES_PER_ELEMENT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let res: int = arr.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'length', 'length: int', arkTsAveragedTime);
    })

    // ==================== Uint32Array 实例方法测试 ====================

    it('PerformanceTest_Uint32Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res = arr.at(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'at', 'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 2, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'copyWithin', 'copyWithin(target: int, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'entries', 'entries(): IterableIterator<[int, int]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(10, 0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'fill', 'fill(value: int, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'set', 'set(insertPos: int, val: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array(100);
      let srcArr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'set', 'set(arr: TypedArray, offset?: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: boolean = arr.includes(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(searchElement: int, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: int = arr.indexOf(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: string = arr.join(',');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'join', 'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: int = arr.lastIndexOf(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.reverse();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reverse', 'reverse(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.slice(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'slice', 'slice(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.subarray(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.subarray(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'subarray', 'subarray(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toReversed', 'toReversed(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([5, 2, 3, 1, 4]);
      let res: Uint32Array = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toSorted', 'toSorted(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_toString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: string = arr.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toString', 'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'keys', 'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'values', 'values(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.with(2, 10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.with(2, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'with', 'with(index: int, value: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: boolean = arr.some((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'some', 'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: boolean = arr.every((v) => v > 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.every((v) => v > 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'every', 'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res = arr.find((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.find((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'find', 'find(predicate: (v, i, arr) => boolean): int | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: int = arr.findIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findIndex', 'findIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.filter((v) => v > 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.filter((v) => v > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'filter', 'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.map((v) => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map((v) => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'map', 'map(fn: (v, i, arr) => int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint32Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint32Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint32Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v) => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'forEach', 'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([5, 2, 3, 1, 4]);
      let res: Uint32Array = arr.sort();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'sort', 'sort(compareFn?: (a, b) => int): this', arkTsAveragedTime);
    })

    // ==================== Uint32Array 静态方法测试 ====================

    it('PerformanceTest_Uint32Array_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.of(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'static_of', 'static of(...items: FixedArray<int>): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<number> = new Array<number>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i);
      }
      let res: Uint32Array = Uint32Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'static_from_array', 'static from(arr: Array<number>): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let res: Uint32Array = Uint32Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'static_from_typedArray', 'static from(arr: TypedArray): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint32Array = Uint32Array.from([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'static_from_iterable', 'static from(iterable: Iterable<number>): Uint32Array', arkTsAveragedTime);
    })
  })
}
