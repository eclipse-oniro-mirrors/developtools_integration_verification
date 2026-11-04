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
  beforeEach,
  afterAll
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest(): void {
  describe('TypedUArraysPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Uint8Array = new Uint8Array();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor',
        'constructor(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Uint8Array = new Uint8Array(100);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array(100);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_length',
        'constructor(length: int | number): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: number[] = [];
      for (let i = 0; i < 100; i++) {
        srcArr.push(i);
      }
      let res: Uint8Array = new Uint8Array(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Uint8Array(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_array',
        'constructor(array: Array<int>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_at_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: number | undefined = arr[50];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr[50];
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_at_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'at',
        'at(index: int): Number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_copyWithin_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.copyWithin(0, 50, 80);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_copyWithin_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'copyWithin',
        'copyWithin(target: int, start: int, end?: int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_fill_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 100);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_fill_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'fill',
        'fill(value: byte, start?: int, end?: int): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[50] = 99;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_set_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set',
        'set(insertPos: int, val: byte): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_set_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      let srcArr: Uint8Array = new Uint8Array(50);
      for (let i = 0; i < 50; i++) {
        srcArr[i] = i ;
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(srcArr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_set_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'set_array_offset',
        'set(array: Uint8Array, offset: int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_includes_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.includes(50);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_includes_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'includes',
        'includes(searchElement: byte): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_indexOf_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: number = arr.indexOf(50);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_indexOf_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'indexOf',
        'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_join_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = i ;
      }
      let result: string = arr.join(",");
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.join(",");
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_join_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'join',
        'join(separator?: String): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_lastIndexOf_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (i % 10) ;
      }
      let result: number = arr.lastIndexOf(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(5);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_lastIndexOf_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'lastIndexOf',
        'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_reverse_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.reverse();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reverse_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reverse',
        'reverse(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_slice_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.slice(10, 50);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(10, 50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_slice_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'slice',
        'slice(begin?: int, end?: int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_subarray_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.subarray(10, 50);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.subarray(10, 50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_subarray_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'subarray',
        'subarray(begin?: int, end?: int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_sort_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let j = 0; j < 100; j++) {
        arr[j] = (100 - j) ;
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_sort_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'sort',
        'sort(compareFn?: (a: number, b: number) => int): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_toReversed_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.slice().reverse();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice().reverse();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_toReversed_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toReversed',
        'toReversed(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_toSorted_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (100 - i) ;
      }
      let result: Uint8Array = arr.slice().sort();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice().sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_toSorted_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toSorted',
        'toSorted(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_entries_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<[number, number]> = arr.entries();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.entries();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = iter;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_entries_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'entries',
        'entries(): IterableIterator<[int, Number]>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_keys_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<number> = arr.keys();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.keys();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = iter;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_keys_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_values_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter: IterableIterator<number> = arr.values();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.values();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = iter;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_values_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'values',
        'values(): IterableIterator<Number>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_some_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.some((val: number, index: number, array: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((val: number, index: number, array: Uint8Array): boolean => val > 50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_some_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'some',
        'some(predicate: (element: number, index: int, array: Uint8Array) => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_every_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: boolean = arr.every((val: number, index: number, array: Uint8Array): boolean => {
        return val >= 0;
      });
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((val: number, index: number, array: Uint8Array): boolean => val >= 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_every_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'every',
        'every(predicate: (element: number, index: int, array: Uint8Array) => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_find_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let predicate = (val: number, index: number, obj: Uint8Array): boolean => val > 50;
      let result: number | undefined = arr.find(predicate);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find(predicate);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_find_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'find',
        'find(predicate: (value: number, index: int, obj: Uint8Array) => boolean): number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_find_2500Index_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let predicate = (val: number, index: number, obj: Uint8Array): boolean => val > 50;
      let result: number = arr.findIndex(predicate);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex(predicate);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_find_2500Index_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findIndex',
        'findIndex(predicate: (value: number, index: int, obj: Uint8Array) => boolean): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_filter_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.filter((val: number, index: number, array: Uint8Array): boolean => {
        return val > 50;
      });
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((val: number, index: number, array: Uint8Array): boolean => val > 50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_filter_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'filter',
        'filter(fn: (val: number, index: int, array: Uint8Array) => boolean): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_map_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result: Uint8Array = arr.map((val: number, index: number, array: Uint8Array): number => {
        return val * 2;
      });
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((val: number, index: number, array: Uint8Array): number => val * 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_map_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'map',
        'map(fn: (val: number, index: int, array: Uint8Array) => number): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_reduce_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reduce_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduce',
        'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_reduce_2900Right_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint8Array): number => {
        return previousValue + currentValue;
      }, 0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint8Array): number => previousValue + currentValue, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_reduce_2900Right_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8Array) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_forEach_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((value: number, index: number, array: Uint8Array): void => { let sum = value + index; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_forEach_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'forEach',
        'forEach(callbackfn: (value: number, index: int, array: Uint8Array) => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_static_of_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8Array.of(1, 2, 3, 4, 5);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_of_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_of',
        'static of(...items: FixedArray<byte>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_static_from_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: number[] = [];
      for (let i = 0; i < 100; i++) {
        srcArr.push(i);
      }
      let makeFromArray = (): Uint8Array => Uint8Array.from(srcArr);
      let result: Uint8Array = makeFromArray();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = makeFromArray();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_from_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_from_array',
        'static from(arr: Array<int>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_static_from_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let makeFromTypedArray = (): Uint8Array => Uint8Array.from(srcArr);
      let result: Uint8Array = makeFromTypedArray();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = makeFromTypedArray();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_static_from_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'static_from_typedarray',
        'static from(arr: Uint8Array): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_copy_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let result: Uint8Array = new Uint8Array(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_copy_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_copy',
        'constructor(other: Uint8Array): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result: Uint8Array = new Uint8Array(buf);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer',
        'constructor(buf: ArrayBuffer): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer_3600_offset_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result: Uint8Array = new Uint8Array(buf, 50);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer_3600_offset_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer_offset',
        'constructor(buf: ArrayBuffer, byteOffset: int): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_Constructor_buffer_3600_offset_3700_length_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result: Uint8Array = new Uint8Array(buf, 50, 100);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8Array(buf, 50, 100);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8Array_Constructor_buffer_3600_offset_3700_length_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'constructor_buffer_offset_length',
        'constructor(buf: ArrayBuffer, byteOffset: int, length: int): Uint8Array', arkTsAveragedTime);
      done();
    })

  })
}