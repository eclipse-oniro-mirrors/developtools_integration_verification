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

export default function TypedArraysPerfTest(): void {
  describe('TypedArraysPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
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

    it('PerformanceTest_Int8Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = new Int8Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
        'constructor(): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_length',
        'constructor(length: int | number): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i as int);
      }
      let res: Int8Array = new Int8Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_array',
        'constructor(array: Array<int>): Int8Array', arkTsAveragedTime);
    })

    /* 此用例与TypedArraysPerfTest01文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int16Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int16Array = new Int16Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int16Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor',
        'constructor(): Int16Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest01文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int16Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int16Array = new Int16Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int16Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor_length',
        'constructor(length: int | number): Int16Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest02文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int32Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int32Array = new Int32Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int32Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor',
        'constructor(): Int32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest02文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int32Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int32Array = new Int32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int32Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor_length',
        'constructor(length: int | number): Int32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest03文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float32Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float32Array = new Float32Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float32Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor',
        'constructor(): Float32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest03文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float32Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float32Array = new Float32Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float32Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor_length',
        'constructor(length: int | number): Float32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest04文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float64Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = new Float64Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float64Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor',
        'constructor(): Float64Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest04文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float64Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float64Array = new Float64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float64Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor_length',
        'constructor(length: int | number): Float64Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest05文件中的同名用例重复，已注释保留
    it('PerformanceTest_BigInt64Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = new BigInt64Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigInt64Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor',
        'constructor(): BigInt64Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest05文件中的同名用例重复，已注释保留
    it('PerformanceTest_BigInt64Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt64Array = new BigInt64Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigInt64Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor_length',
        'constructor(length: int | number): BigInt64Array', arkTsAveragedTime);
    })
    */

    // ==================== Int8Array 实例方法测试 ====================

    it('PerformanceTest_Int8Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: number | undefined = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 50, 80);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'copyWithin',
        'copyWithin(target: int, start: int, end?: int): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42 as byte, 0, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'fill',
        'fill(value: byte, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(50, 99 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set',
        'set(insertPos: int, val: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      let srcArr: Int8Array = new Int8Array(50);
      for (let i = 0; i < 50; i++) {
        srcArr[i] = i;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set_array_offset',
        'set(array: Int8Array, offset: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: boolean = arr.includes(50 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(50 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'includes',
        'includes(searchElement: byte): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: int = arr.indexOf(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'indexOf',
        'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = i;
      }
      let res: string = arr.join(",");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(",");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'join',
        'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (i % 10);
      }
      let res: int = arr.lastIndexOf(5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'lastIndexOf',
        'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reverse',
        'reverse(): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Int8Array = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'slice',
        'slice(begin?: int, end?: int): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Int8Array = arr.subarray(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.subarray(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'subarray',
        'subarray(begin?: int, end?: int): Int8Array', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_Int8Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'sort',
        'sort(compareFn?: (a: number, b: number) => int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Int8Array = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'toReversed',
        'toReversed(): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (100 - i);
      }
      let res: Int8Array = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'toSorted',
        'toSorted(): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Int8Array = arr.with(50, 99 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.with(50, 99 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'with',
        'with(index: int, value: byte): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'entries',
        'entries(): IterableIterator<[int, Number]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'values',
        'values(): IterableIterator<Number>', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, array: Int8Array): boolean => {
        return val > 50;
      };
      let res: boolean = arr.some(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'some',
        'some(predicate: (element: number, index: int, array: Int8Array) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, array: Int8Array): boolean => {
        return val >= 0;
      };
      let res: boolean = arr.every(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.every(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'every',
        'every(predicate: (element: number, index: int, array: Int8Array) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, obj: Int8Array): boolean => {
        return val > 50;
      };
      let res: number | undefined = arr.find(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.find(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'find',
        'find(predicate: (value: number, index: int, obj: Int8Array) => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, obj: Int8Array): boolean => {
        return val > 50;
      };
      let res: int = arr.findIndex(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findIndex',
        'findIndex(predicate: (value: number, index: int, obj: Int8Array) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, array: Int8Array): boolean => {
        return val > 50;
      };
      let res: Int8Array = arr.filter(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.filter(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'filter',
        'filter(fn: (val: number, index: int, array: Int8Array) => boolean): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (val: number, index: int, array: Int8Array): number => {
        return val * 2;
      };
      let res: Int8Array = arr.map(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'map',
        'map(fn: (val: number, index: int, array: Int8Array) => number): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1;
      }
      let cmp = (previousValue: number, currentValue: number, currentIndex: int, array: Int8Array): number => {
        return previousValue + currentValue;
      };
      let res: number = arr.reduce(cmp, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce(cmp, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduce',
        'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Int8Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1;
      }
      let cmp = (previousValue: number, currentValue: number, currentIndex: int, array: Int8Array): number => {
        return previousValue + currentValue;
      };
      let res: number = arr.reduceRight(cmp, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight(cmp, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Int8Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let cmp = (value: number, index: int, array: Int8Array): void => {
        let sum = value + index;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'forEach',
        'forEach(callbackfn: (value: number, index: int, array: Int8Array) => void): void', arkTsAveragedTime);
    })

    // ==================== Int8Array 静态方法测试 ====================

    it('PerformanceTest_Int8Array_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int8Array = Int8Array.of(1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.of(1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'static_of',
        'static of(...items: FixedArray<byte>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i as int);
      }
      let res: Int8Array = Int8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'static_from_array',
        'static from(arr: Array<int>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let res: Int8Array = Int8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'static_from_typedarray',
        'static from(arr: Int8Array): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let res: Int8Array = Int8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'static_from_uint8array',
        'static from(arr: Uint8Array): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int8Array 构造函数补充测试 ====================

    it('PerformanceTest_Int8Array_Constructor_copy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i;
      }
      let res: Int8Array = new Int8Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_copy: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_copy',
        'constructor(other: Int8Array): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: Int8Array = new Int8Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_buffer',
        'constructor(buf: ArrayBuffer): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_buffer_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_buffer_offset',
        'constructor(buf: ArrayBuffer, byteOffset: int): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_Constructor_buffer_offset_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50, 100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer_offset_length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor_buffer_offset_length',
        'constructor(buf: ArrayBuffer, byteOffset: int, length: int): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int16Array 方法测试 ====================

    /* 此用例与TypedArraysPerfTest01文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int16Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: number | undefined = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int16Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest01文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int16Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: Int16Array = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int16Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'slice',
        'slice(begin?: int, end?: int): Int16Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest01文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int16Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int16Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
    */

    // ==================== Int32Array 方法测试 ====================

    /* 此用例与TypedArraysPerfTest02文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int32Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let res: number | undefined = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int32Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest02文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int32Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int32Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'slice',
        'slice(begin?: int, end?: int): Int32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest02文件中的同名用例重复，已注释保留
    it('PerformanceTest_Int32Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int32Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
    */

    // ==================== Float32Array 方法测试 ====================

    /* 此用例与TypedArraysPerfTest03文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float32Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float32Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest03文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float32Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float32Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'slice',
        'slice(begin?: int, end?: int): Float32Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest03文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float32Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float32Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
    */

    // ==================== Float64Array 方法测试 ====================

    /* 此用例与TypedArraysPerfTest04文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float64Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float64Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest04文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float64Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float64Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'slice',
        'slice(begin?: int, end?: int): Float64Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest04文件中的同名用例重复，已注释保留
    it('PerformanceTest_Float64Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float64Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
    */

    // ==================== BigInt64Array 方法测试 ====================

    /* 此用例与TypedArraysPerfTest05文件中的同名用例重复，已注释保留
    it('PerformanceTest_BigInt64Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let result = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigInt64Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'at',
        'at(index: int): bigint | undefined', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest05文件中的同名用例重复，已注释保留
    it('PerformanceTest_BigInt64Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let result = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigInt64Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'slice',
        'slice(begin?: int, end?: int): BigInt64Array', arkTsAveragedTime);
    })
    */

    /* 此用例与TypedArraysPerfTest05文件中的同名用例重复，已注释保留
    it('PerformanceTest_BigInt64Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = BigInt(100 - j);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigInt64Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
    */
  })
}
