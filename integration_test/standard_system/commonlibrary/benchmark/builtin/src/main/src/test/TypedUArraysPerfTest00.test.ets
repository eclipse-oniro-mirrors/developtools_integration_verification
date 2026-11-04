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

export default function TypedUArraysPerfTest00(): void {
  describe('TypedUArraysPerfTest00', () => {
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

    // ==================== Uint8ClampedArray 构造函数测试 ====================

    it('PerformanceTest_Uint8ClampedArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8ClampedArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(length: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8ClampedArray(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = new Uint8ClampedArray(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(numbers: FixedArray<byte>)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = new Uint8ClampedArray(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(numbers: Uint8ClampedArray)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf, 10, 90);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 10, 90);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray Constructor_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int, length: int)', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray 属性测试 ====================

    it('PerformanceTest_Uint8ClampedArray_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.buffer;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.buffer;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_byteLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.byteLength;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray byteLength: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteLength', 'byteLength: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_byteOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 10, 90);
      let result = arr.byteOffset;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray byteOffset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'byteOffset', 'byteOffset: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_BYTES_PER_ELEMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.BYTES_PER_ELEMENT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.BYTES_PER_ELEMENT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let result = arr.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'length', 'length: int', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray 实例方法测试 ====================

    it('PerformanceTest_Uint8ClampedArray_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.at(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.at(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'at', 'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 2, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'copyWithin', 'copyWithin(target: int, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'entries', 'entries(): IterableIterator<[int, byte]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(10, 0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill', 'fill(value: byte, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(insertPos: int, val: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = srcArr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set', 'set(arr: TypedArray, offset?: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.includes(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes', 'includes(searchElement: byte, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.indexOf(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf', 'indexOf(searchElement: byte, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.join(',');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'join', 'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.lastIndexOf(3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf', 'lastIndexOf(searchElement: byte, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reverse();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reverse', 'reverse(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
         result = arr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'slice', 'slice(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.subarray(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'subarray', 'subarray(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toReversed', 'toReversed(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
      let result = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toSorted', 'toSorted(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_toString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toString', 'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'keys', 'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'values', 'values(): IterableIterator<byte>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.with(2, 10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'with', 'with(index: int, value: byte): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.some((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some', 'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.every((v) => v > 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v) => v > 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'every', 'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.find((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'find', 'find(predicate: (v, i, arr) => boolean): byte | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.findIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findIndex', 'findIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.filter((v) => v > 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v) => v > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'filter', 'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.map((v) => v * 2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v) => v * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'map', 'map(fn: (v, i, arr) => byte): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v) => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'forEach', 'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([5, 2, 3, 1, 4]);
      let result = arr.sort();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'sort', 'sort(compareFn?: (a, b) => int): this', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray 静态方法测试 ====================

    it('PerformanceTest_Uint8ClampedArray_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_of', 'static of(...items: FixedArray<byte>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<number> = new Array<number>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i);
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_array', 'static from(arr: Array<number>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_typedArray', 'static from(arr: TypedArray): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Uint8ClampedArray.from([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from([1, 2, 3, 4, 5]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_iterable', 'static from(iterable: Iterable<number>): Uint8ClampedArray', arkTsAveragedTime);
    })
  })
}
