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

export default function TypedArraysPerfTest04(): void {
  describe('TypedArraysPerfTest04', () => {
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

    // ==================== Float64Array 构造函数测试 ====================

    it('PerformanceTest_Float64Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Float64Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(length: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Float64Array(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(length: number)', arkTsAveragedTime);
    })

    // 注: 传入Float64Array参数，重载决议命中constructor(numbers: Float64Array)，与_0600重复，已注释
    // it('PerformanceTest_Float64Array_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let srcArr: Float64Array = new Float64Array(100);
    //   let res = new Float64Array(srcArr);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = new Float64Array(srcArr);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let res1 = res;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest Float64Array Constructor_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(other: TypedArray)', arkTsAveragedTime);
    // })

    it('PerformanceTest_Float64Array_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(numbers: FixedArray<double>)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1.0;
      }
      let res = new Float64Array(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(numbers: Float64Array)', arkTsAveragedTime);
    })

    // DUPLICATE: Float64Array_Constructor_0700 与 Constructor_0500 完全相同(都使用数组字面量,区别仅 Iterable vs FixedArray 签名)
    // it('PerformanceTest_Float64Array_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let res1 = res;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest Float64Array Constructor_0700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(elements: Iterable<double>)', arkTsAveragedTime);
    // })

    it('PerformanceTest_Float64Array_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res = new Float64Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(buf: ArrayBuffer)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res = new Float64Array(buf, 96);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 96);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res = new Float64Array(buf, 96, 88);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 96, 88);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(buf: ArrayBuffer, byteOffset: int, length: int)', arkTsAveragedTime);
    })

    // ==================== Float64Array 属性测试 ====================

    it('PerformanceTest_Float64Array_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let res: ArrayBuffer = arr.buffer;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.buffer;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'buffer', 'buffer: ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_byteLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let res: int = arr.byteLength;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array byteLength: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'byteLength', 'byteLength: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_byteOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let arr: Float64Array = new Float64Array(buf, 96, 88);
      let res: int = arr.byteOffset;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array byteOffset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'byteOffset', 'byteOffset: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_BYTES_PER_ELEMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = Float64Array.BYTES_PER_ELEMENT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.BYTES_PER_ELEMENT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array BYTES_PER_ELEMENT: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'BYTES_PER_ELEMENT', 'static BYTES_PER_ELEMENT: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let res: int = arr.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'length', 'length: int', arkTsAveragedTime);
    })

    // ==================== Float64Array 实例方法测试 ====================

    it('PerformanceTest_Float64Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: number | undefined = arr.at(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'at', 'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 2, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'copyWithin', 'copyWithin(target: int, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: IterableIterator<[int, number]> = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'entries', 'entries(): IterableIterator<[int, double]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(10.0, 0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'fill', 'fill(value: double, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(10, 5.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(insertPos: int, val: double): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      let srcArr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'set', 'set(arr: TypedArray, offset?: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: boolean = arr.includes(3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'includes', 'includes(searchElement: double, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: int = arr.indexOf(3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'indexOf', 'indexOf(searchElement: double, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: string = arr.join(',');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'join', 'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: int = arr.lastIndexOf(3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'lastIndexOf', 'lastIndexOf(searchElement: double, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.reverse();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'reverse', 'reverse(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.slice(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'slice', 'slice(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.subarray(1, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.subarray(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'subarray', 'subarray(begin?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'toReversed', 'toReversed(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([5.0, 2.0, 3.0, 1.0, 4.0]);
      let res: Float64Array = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'toSorted', 'toSorted(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_toString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: string = arr.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'toString', 'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: IterableIterator<int> = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'keys', 'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: IterableIterator<number> = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'values', 'values(): IterableIterator<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.with(2, 10.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.with(2, 10.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'with', 'with(index: int, value: double): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: boolean = arr.some((v) => v > 3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some((v) => v > 3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'some', 'some(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: boolean = arr.every((v) => v > 0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.every((v) => v > 0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'every', 'every(predicate: (v, i, arr) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: number | undefined = arr.find((v) => v > 3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.find((v) => v > 3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'find', 'find(predicate: (v, i, arr) => boolean): double | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: int = arr.findIndex((v) => v > 3.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex((v) => v > 3.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'findIndex', 'findIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.filter((v) => v > 2.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.filter((v) => v > 2.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'filter', 'filter(fn: (v, i, arr) => boolean): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = arr.map((v) => v * 2.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map((v) => v * 2.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'map', 'map(fn: (v, i, arr) => double): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Float64Array): number => {
        return previousValue + currentValue;
      }, 0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Float64Array): number => previousValue + currentValue, 0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'reduce', 'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Float64Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Float64Array): number => {
        return previousValue + currentValue;
      }, 0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Float64Array): number => previousValue + currentValue, 0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'reduceRight', 'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Float64Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v) => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'forEach', 'forEach(callbackfn: (v, i, arr) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([5.0, 2.0, 3.0, 1.0, 4.0]);
      let res: Float64Array = arr.sort();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'sort', 'sort(compareFn?: (a, b) => int): this', arkTsAveragedTime);
    })

    // ==================== Float64Array 静态方法测试 ====================

    it('PerformanceTest_Float64Array_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'static_of', 'static of(...items: FixedArray<double>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<number> = new Array<number>();
      let numberVar = new Number(1)
      for (let i = 0; i < 100; i++) {
        srcArr.push(numberVar);
      }
      let res: Float64Array = Float64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'static_from_array', 'static from(arr: Array<number>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Float64Array = new Float64Array(100);
      let numberVar = new Number(1)
      for (let i = 0; i < 100; i++) {
        srcArr[i] = numberVar;
      }
      let res: Float64Array = Float64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'static_from_typedArray', 'static from(arr: TypedArray): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = Float64Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'static_from_iterable', 'static from(iterable: Iterable<number>): Float64Array', arkTsAveragedTime);
    })
  })
}
