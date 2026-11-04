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

export default function TypedUArraysPerfTest(): void {
  describe('TypedUArraysPerfTest', () => {
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

    it('PerformanceTest_Uint8Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint8Array = new Uint8Array();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor',
        'constructor(): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_length',
        'constructor(length: int | number): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i as int);
      }
      let res: Uint8Array = new Uint8Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_array',
        'constructor(array: Array<int>): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array 实例方法测试 ====================

    it('PerformanceTest_Uint8Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Number | undefined = arr.at(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.at(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_copyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 50, 80);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_copyWithin: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'copyWithin',
        'copyWithin(target: int, start: int, end?: int): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42 as byte, 0, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill',
        'fill(value: byte, start?: int, end?: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(50, 99 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set',
        'set(insertPos: int, val: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array(50);
      for (let i = 0; i < 50; i++) {
        srcArr[i] = i ;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set_array_offset',
        'set(array: Uint8Array, offset: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.includes(50 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(50 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'includes',
        'includes(searchElement: byte): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: int = arr.indexOf(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'indexOf',
        'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = i ;
      }
      let result: string = arr.join(",");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.join(",");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'join',
        'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (i % 10) ;
      }
      let result: int = arr.lastIndexOf(5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'lastIndexOf',
        'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reverse',
        'reverse(): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.slice(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'slice',
        'slice(begin?: int, end?: int): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_subarray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.subarray(10, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.subarray(10, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_subarray: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'subarray',
        'subarray(begin?: int, end?: int): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j) ;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'sort',
        'sort(compareFn?: (a: number, b: number) => int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toReversed',
        'toReversed(): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (100 - i) ;
      }
      let result: Uint8Array = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toSorted',
        'toSorted(): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.with(50, 99 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(50, 99 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'with',
        'with(index: int, value: byte): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'entries',
        'entries(): IterableIterator<[int, Number]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<int> = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<Number> = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'values',
        'values(): IterableIterator<Number>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.some((val: number, index: int, array: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((val: number, index: int, array: Uint8Array): boolean => val > 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'some',
        'some(predicate: (element: number, index: int, array: Uint8Array) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.every((val: number, index: int, array: Uint8Array): boolean => {
        return val >= 0;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((val: number, index: int, array: Uint8Array): boolean => val >= 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'every',
        'every(predicate: (element: number, index: int, array: Uint8Array) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: number | undefined = arr.find((val: number, index: int, obj: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((val: number, index: int, obj: Uint8Array): boolean => {
          return val > 50;
        });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'find',
        'find(predicate: (value: number, index: int, obj: Uint8Array) => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: int = arr.findIndex((val: number, index: int, obj: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((val: number, index: int, obj: Uint8Array): boolean => {
          return val > 50;
        });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findIndex',
        'findIndex(predicate: (value: number, index: int, obj: Uint8Array) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.filter((val: number, index: int, array: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((val: number, index: int, array: Uint8Array): boolean => val > 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'filter',
        'filter(fn: (val: number, index: int, array: Uint8Array) => boolean): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.map((val: number, index: int, array: Uint8Array): number => {
        return val * 2;
      });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((val: number, index: int, array: Uint8Array): number => val * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'map',
        'map(fn: (val: number, index: int, array: Uint8Array) => number): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduce',
        'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: int, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8Array) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((value: number, index: int, array: Uint8Array): void => { let sum = value + index; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'forEach',
        'forEach(callbackfn: (value: number, index: int, array: Uint8Array) => void): void', arkTsAveragedTime);
    })

    // ==================== Uint8Array 静态方法测试 ====================

    it('PerformanceTest_Uint8Array_static_of', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Uint8Array = Uint8Array.of(1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_of',
        'static of(...items: FixedArray<byte>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i as int);
      }
      let result: Uint8Array = Uint8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_from_array',
        'static from(arr: Array<int>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let result: Uint8Array = Uint8Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_from_typedarray',
        'static from(arr: Uint8Array): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint8Array 构造函数补充测试 ====================

    it('PerformanceTest_Uint8Array_Constructor_copy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let result: Uint8Array = new Uint8Array(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_copy: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_copy',
        'constructor(other: Uint8Array): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result: Uint8Array = new Uint8Array(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer',
        'constructor(buf: ArrayBuffer): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result: Uint8Array = new Uint8Array(buf, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer_offset',
        'constructor(buf: ArrayBuffer, byteOffset: int): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer_offset_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result: Uint8Array = new Uint8Array(buf, 50, 100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer_offset_length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer_offset_length',
        'constructor(buf: ArrayBuffer, byteOffset: int, length: int): Uint8Array', arkTsAveragedTime);
    })

  })
}
