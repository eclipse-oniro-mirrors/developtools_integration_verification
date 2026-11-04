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

class TestArrayLike<T> implements ArrayLike<T> {
  private items: T[] = [];

  constructor(items: T[]) {
    this.items = items;
  }

  $_get(index: int): T {
    return this.items[index];
  }

  get length(): int {
    return this.items.length;
  }
}

export default function TypedArraysPerfTest07(): void {
  describe('TypedArraysPerfTest07', () => {
    const BASE_COUNT = 50000;
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

    // ==================== Int8Array 构造函数补充重载 ====================

    it('PerformanceTest_Int8Array_Constructor_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = new Int8Array(100 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(100 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = new Int8Array(100 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(100 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Int8Array([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Int8Array([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Int8Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Int8Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<Number> = [1, 2, 3, 4, 5];
      let res: Int8Array = new Int8Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: Int8Array = new Int8Array(buf, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: Int8Array = new Int8Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferIntInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50 as int, 100 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50 as int, 100 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferIntInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, int, int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50 as Number, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50 as Number, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    // ==================== Int16Array 构造函数补充重载 ====================

    it('PerformanceTest_Int16Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Int16Array([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Int16Array([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Int16Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Int16Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      srcArr.push(1 as int);
      srcArr.push(2 as int);
      srcArr.push(3 as int);
      let res: Int16Array = new Int16Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<Number> = [1, 2, 3, 4, 5];
      let res: Int16Array = new Int16Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int16Array = new Int16Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int16Array = new Int16Array(buf, 50 as Number | undefined, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(buf, 50 as Number | undefined, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayLikeOrAB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let res: Int16Array = new Int16Array(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayLikeOrAB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== Int32Array 构造函数补充重载 ====================

    it('PerformanceTest_Int32Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Int32Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Int32Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      srcArr.push(1 as int);
      srcArr.push(2 as int);
      srcArr.push(3 as int);
      let res: Int32Array = new Int32Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<Number> = [1, 2, 3, 4, 5];
      let res: Int32Array = new Int32Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Int32Array = new Int32Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Int32Array = new Int32Array(buf, 100 as Number | undefined, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(buf, 100 as Number | undefined, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayLikeOrAB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let res: Int32Array = new Int32Array(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayLikeOrAB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== BigInt64Array 构造函数补充重载 ====================

    it('PerformanceTest_BigInt64Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)] as FixedArray<bigint>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)] as FixedArray<bigint>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(FixedArray<bigint>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<BigInt> = [BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)];
      let res: BigInt64Array = new BigInt64Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(Iterable<BigInt>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigInt64Array = new BigInt64Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigInt64Array = new BigInt64Array(buf, 96 as Number | undefined, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(buf, 96 as Number | undefined, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_Constructor_ArrayLikeOrAB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let res: BigInt64Array = new BigInt64Array(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_ArrayLikeOrAB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== Float32Array 构造函数补充重载 ====================

    it('PerformanceTest_Float32Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Float32Array([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Float32Array([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Float32Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Float32Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<Number> = [1, 2, 3, 4, 5];
      let res: Float32Array = new Float32Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Float32Array = new Float32Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Float32Array = new Float32Array(buf, 100 as Number | undefined, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(buf, 100 as Number | undefined, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_Constructor_ArrayLikeOrAB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let res: Float32Array = new Float32Array(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_ArrayLikeOrAB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })

    // ==================== Float64Array 构造函数补充重载 ====================

    it('PerformanceTest_Float64Array_Constructor_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Float64Array([1, 2, 3, 4, 5] as FixedArray<int>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Float64Array([1, 2, 3, 4, 5] as FixedArray<int>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(FixedArray<int>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new Float64Array([1, 2, 3, 4, 5] as FixedArray<number>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Float64Array([1, 2, 3, 4, 5] as FixedArray<number>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(FixedArray<number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_Iterable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcIter: Iterable<Number> = [1, 2, 3, 4, 5];
      let res: Float64Array = new Float64Array(srcIter);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(srcIter);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_ArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: Float64Array = new Float64Array(buf, 0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_ArrayBufferNumberUndef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: Float64Array = new Float64Array(buf, 96 as Number | undefined, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 96 as Number | undefined, undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_Constructor_ArrayLikeOrAB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcLike: ArrayLike<Number> = new TestArrayLike<Number>([1, 2]);
      let res: Float64Array = new Float64Array(srcLike);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(srcLike);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_ArrayLikeOrAB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(ArrayLike<Number> | ArrayBuffer): void', arkTsAveragedTime);
    })
  })
}
