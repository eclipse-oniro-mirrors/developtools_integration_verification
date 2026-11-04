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

export default function TypedUArraysPerfTest03(): void {
  describe('TypedUArraysPerfTest03', () => {
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

    // ==================== BigUint64Array 构造函数测试 ====================

    it('PerformanceTest_BigUint64Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = new BigUint64Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = new BigUint64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(length: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = new BigUint64Array(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array(100);
      let res: BigUint64Array = new BigUint64Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(numbers: FixedArray<bigint>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let res: BigUint64Array = new BigUint64Array(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(numbers: BigUint64Array)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigUint64Array = new BigUint64Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigUint64Array = new BigUint64Array(buf, 96);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(buf, 96);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_Constructor_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigUint64Array = new BigUint64Array(buf, 96, 88);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(buf, 96, 88);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int, length: int)', arkTsAveragedTime);
    })

    // ==================== BigUint64Array 属性测试 ====================

    it('PerformanceTest_BigUint64Array_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: ArrayBuffer = arr.buffer;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.buffer;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_byteLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: int = arr.byteLength;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array byteLength: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'byteLength', 'byteLength: int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_byteOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let arr: BigUint64Array = new BigUint64Array(buf, 96, 88);
      let res: int = arr.byteOffset;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array byteOffset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'byteOffset', 'byteOffset: int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_BYTES_PER_ELEMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = BigUint64Array.BYTES_PER_ELEMENT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.BYTES_PER_ELEMENT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: int = arr.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'length', 'length: int', arkTsAveragedTime);
    })

    // ==================== BigUint64Array 实例方法测试 ====================

    it('PerformanceTest_BigUint64Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: bigint | undefined = arr.at(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'at', 'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 2, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'copyWithin', 'copyWithin(target: int, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: IterableIterator<[int, bigint]> = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'entries', 'entries(): IterableIterator<[int, bigint]>', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(BigInt(10), 0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'fill', 'fill(value: bigint, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, BigInt(5));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array set: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'set', 'set(insertPos: int, val: bigint): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_set_typed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let srcArr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array set_typed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'set', 'set(arr: TypedArray, offset?: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: boolean = arr.includes(BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'includes', 'includes(searchElement: bigint, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: int = arr.indexOf(BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'indexOf', 'indexOf(searchElement: bigint, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: string = arr.join(',');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'join', 'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: int = arr.lastIndexOf(BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(searchElement: bigint, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.reverse();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reverse', 'reverse(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.slice(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'slice', 'slice(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.subarray(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.subarray(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'subarray', 'subarray(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'toReversed', 'toReversed(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(5), BigInt(2), BigInt(3), BigInt(1), BigInt(4)]);
      let res: BigUint64Array = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'toSorted', 'toSorted(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_toString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: string = arr.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'toString', 'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: IterableIterator<int> = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'keys', 'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: IterableIterator<bigint> = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'values', 'values(): IterableIterator<bigint>', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.with(2, BigInt(10));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.with(2, BigInt(10));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'with', 'with(index: int, value: bigint): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: boolean = arr.some((v) => v > BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some((v) => v > BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'some', 'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: boolean = arr.every((v) => v > BigInt(0));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.every((v) => v > BigInt(0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'every', 'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: bigint | undefined = arr.find((v) => v > BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.find((v) => v > BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'find', 'find(predicate: (v, i, arr) => boolean): bigint | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: int = arr.findIndex((v) => v > BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex((v) => v > BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findIndex', 'findIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.filter((v) => v > BigInt(2));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.filter((v) => v > BigInt(2));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'filter', 'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.map((v) => v * BigInt(2));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map((v) => v * BigInt(2));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'map', 'map(fn: (v, i, arr) => bigint): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: bigint = arr.reduce((previousValue: bigint, currentValue: bigint, currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, BigInt(0));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: bigint, currentValue: bigint, currentIndex: int, array: BigUint64Array): bigint => previousValue + currentValue, BigInt(0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: bigint, currentIndex: int, array: BigUint64Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: bigint = arr.reduceRight((previousValue: bigint, currentValue: bigint, currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, BigInt(0));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: bigint, currentValue: bigint, currentIndex: int, array: BigUint64Array): bigint => previousValue + currentValue, BigInt(0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: bigint, currentIndex: int, array: BigUint64Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v) => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'forEach', 'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(5), BigInt(2), BigInt(3), BigInt(1), BigInt(4)]);
      let res: BigUint64Array = arr.sort();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'sort', 'sort(compareFn?: (a, b) => int): this', arkTsAveragedTime);
    })

    // ==================== BigUint64Array 静态方法测试 ====================

    it('PerformanceTest_BigUint64Array_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = BigUint64Array.of(BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.of(BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'static_of', 'static of(...items: FixedArray<bigint>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<bigint> = new Array<bigint>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(BigInt(i));
      }
      let res: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'static_from_array', 'static from(arr: Array<bigint>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = BigInt(i);
      }
      let res: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'static_from_typedArray', 'static from(arr: TypedArray): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigUint64Array = BigUint64Array.from([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'static_from_iterable', 'static from(iterable: Iterable<bigint>): BigUint64Array', arkTsAveragedTime);
    })
  })
}
