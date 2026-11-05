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

export default function TypedArraysPerfTest(): void {
  describe('TypedArraysPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Int8Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int8Array = new Int8Array();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int8Array = new Int8Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(length: number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: number[] = [];
        for (let i = 0; i < 100; i++) {
          srcArr.push(i);
        }
        let res: Int8Array = new Int8Array(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(array: number[]): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_copyWithin_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.copyWithin(0, 50, 80);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_copyWithin_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'copyWithin',
          'copyWithin(target: number, start: number, end?: number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_fill_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.fill(42, 0, 100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_fill_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'fill',
          'fill(value: number, start?: number, end?: number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_set_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr[50] = 99;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_set_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set',
          'set(index: number, value: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        let srcArr: Int8Array = new Int8Array(50);
        for (let i = 0; i < 50; i++) {
          srcArr[i] = i;
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.set(srcArr, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_set_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'set',
          'set(array: Int8Array, offset?: number): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_includes_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res: boolean = arr.includes(50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.includes(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_includes_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'includes',
          'includes(searchElement: number): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_indexOf_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res: number = arr.indexOf(50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.indexOf(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_indexOf_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'indexOf',
          'indexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_join_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(10);
        for (let i = 0; i < 10; i++) {
          arr[i] = i;
        }
        let res: string = arr.join(",");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join(",");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_join_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'join',
          'join(separator?: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_lastIndexOf_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = (i % 10);
        }
        let res: number = arr.lastIndexOf(5);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.lastIndexOf(5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_lastIndexOf_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'lastIndexOf',
          'lastIndexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_reverse_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reverse_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reverse',
          'reverse(): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_slice_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res: Int8Array = arr.slice(10, 50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(10, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_slice_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'slice',
          'slice(begin?: number, end?: number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_subarray_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res: Int8Array = arr.subarray(10, 50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.subarray(10, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_subarray_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'subarray',
          'subarray(begin?: number, end?: number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_sort_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let j = 0; j < 100; j++) {
          arr[j] = (100 - j);
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_sort_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'sort',
          'sort(compareFn?: (a: number, b: number) => number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_entries_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res = arr.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_entries_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'entries',
          'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_keys_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_keys_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'keys',
          'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_values_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let res = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_values_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'values',
          'values(): IterableIterator<number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_some_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Int8Array): boolean => {
          return val > 50;
        };
        let res: boolean = arr.some(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.some(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_some_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'some',
          'some(predicate: (element: number, index: number, array: Int8Array) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_every_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Int8Array): boolean => {
          return val >= 0;
        };
        let res: boolean = arr.every(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.every(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_every_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'every',
          'every(predicate: (element: number, index: number, array: Int8Array) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_find_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, obj: Int8Array): boolean => {
          return val > 50;
        };
        let res: number | undefined = arr.find(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.find(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_find_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'find',
          'find(predicate: (value: number, index: number, obj: Int8Array) => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_find_2100Index_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, obj: Int8Array): boolean => {
          return val > 50;
        };
        let res: number = arr.findIndex(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.findIndex(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_find_2100Index_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findIndex',
          'findIndex(predicate: (value: number, index: number, obj: Int8Array) => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_filter_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Int8Array): boolean => {
          return val > 50;
        };
        let res: Int8Array = arr.filter(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.filter(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_filter_2300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'filter',
          'filter(fn: (val: number, index: number, array: Int8Array) => boolean): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_map_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Int8Array): number => {
          return val * 2;
        };
        let res: Int8Array = arr.map(cmp);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.map(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_map_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'map',
          'map(fn: (val: number, index: number, array: Int8Array) => number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_reduce_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let cmp = (previousValue: number, currentValue: number, currentIndex: number, array: Int8Array): number => {
          return previousValue + currentValue;
        };
        let res: number = arr.reduce(cmp, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduce(cmp, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reduce_2500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduce',
          'reduce(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Int8Array) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_reduce_2500Right_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let cmp = (previousValue: number, currentValue: number, currentIndex: number, array: Int8Array): number => {
          return previousValue + currentValue;
        };
        let res: number = arr.reduceRight(cmp, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduceRight(cmp, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_reduce_2500Right_2600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduceRight',
          'reduceRight(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: Int8Array) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_forEach_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (value: number, index: number, array: Int8Array): void => {
          let sum = value + index;
        };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_forEach_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'forEach',
          'forEach(callbackfn: (value: number, index: number, array: Int8Array) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_static_of_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.of(1, 2, 3, 4, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_of_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of',
          'of(...items: number[]): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_static_from_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: number[] = [];
        for (let i = 0; i < 100; i++) {
          srcArr.push(i);
        }
        let res: Int8Array = Int8Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_2900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from',
          'from(arr: ArrayLike<number>): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_static_from_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let res: Int8Array = Int8Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_3000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from',
          'from(arr: Int8Array): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_static_from_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let res: Int8Array = Int8Array.from(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_static_from_3100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from',
          'from(arr: Uint8Array): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_copy_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Int8Array = new Int8Array(100);
        for (let i = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let res: Int8Array = new Int8Array(srcArr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_copy_3200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(other: Int8Array): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_buffer_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(100);
        let res: Int8Array = new Int8Array(buf);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer_3300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(buf: ArrayBuffer): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_buffer_3300_offset_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let res: Int8Array = new Int8Array(buf, 50);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(buf, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer_3300_offset_3400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(buf: ArrayBuffer, byteOffset: number): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_Constructor_buffer_3300_offset_3400_length_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let res: Int8Array = new Int8Array(buf, 50, 100);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Int8Array(buf, 50, 100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_Constructor_buffer_3300_offset_3400_length_3500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor',
          'constructor(buf: ArrayBuffer, byteOffset: number, length: number): Int8Array', arkTsAveragedTime);
      done();
      })
  })
}