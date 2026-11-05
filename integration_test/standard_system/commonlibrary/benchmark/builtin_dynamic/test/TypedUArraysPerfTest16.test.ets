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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest16(): void {
  describe('TypedUArraysPerfTest16', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8ClampedArray_fill_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          arr.fill(42, 0, 100);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = arr;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_fill_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill',
          'fill(value: int, start?: int, end?: int): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_index_set_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          arr[99] = 50;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = arr;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_index_set_0150: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set',
          'set(insertPos: int, val: int): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray(50);
        for (let i: number = 0; i < 50; i++) {
          srcArr[i] = i;
        }
        let pools: Uint8ClampedArray[] = new Array<Uint8ClampedArray>(BASE_COUNT);
        for (let i: number = 0; i < BASE_COUNT; i++) { pools[i] = new Uint8ClampedArray(100); }
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          pools[i].set(srcArr, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = pools[0];
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_set_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set_array_offset',
          'set(array: Uint8ClampedArray, offset: int): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_includes_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let result: boolean = arr.includes(50);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.includes(50);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_includes_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes',
          'includes(searchElement: int): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_indexOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let result: number = arr.indexOf(50);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.indexOf(50);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_indexOf_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf',
          'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_join_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(10);
        for (let i: number = 0; i < 10; i++) {
          arr[i] = i;
        }
        let result: string = arr.join(",");
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.join(",");
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: string = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_join_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'join',
          'join(separator?: String): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = (i % 10);
        }
        let result: number = arr.lastIndexOf(5);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.lastIndexOf(5);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_lastIndexOf_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf',
          'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reverse_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let originalData: number[] = new Array<number>(100);
        for (let i: number = 0; i < 100; i++) {
          originalData[i] = i;
        }
        let pools: Uint8ClampedArray[] = new Array<Uint8ClampedArray>(BASE_COUNT);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          pools[i] = new Uint8ClampedArray(originalData);
        }
        let res: Uint8ClampedArray = pools[0];
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = pools[i].reverse();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reverse_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reverse',
          'reverse(): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_toReversed_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let result: Uint8ClampedArray = arr.slice().reverse();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.slice().reverse();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_toReversed_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toReversed',
          'toReversed(): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_toSorted_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = (100 - i);
        }
        let result: Uint8ClampedArray = arr.slice().sort();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.slice().sort();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_toSorted_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toSorted',
          'toSorted(): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_entries_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let iter: IterableIterator<[number, number]> = arr.entries();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          iter = arr.entries();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: IterableIterator<[number, number]> = iter;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_entries_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'entries',
          'entries(): IterableIterator<[int, Number]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_keys_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let iter: IterableIterator<number> = arr.keys();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          iter = arr.keys();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: IterableIterator<number> = iter;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_keys_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'keys',
          'keys(): IterableIterator<int>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_values_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let iter: IterableIterator<number> = arr.values();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          iter = arr.values();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: IterableIterator<number> = iter;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_values_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'values',
          'values(): IterableIterator<Number>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_some_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Uint8ClampedArray): boolean => {
          return val > 50;
        };
        let result: boolean = arr.some(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.some(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_some_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some',
          'some(predicate: (element: number, index: int, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_every_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Uint8ClampedArray): boolean => {
          return val >= 0;
        };
        let result: boolean = arr.every(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.every(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_every_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'every',
          'every(predicate: (element: number, index: int, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_find_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, obj: Uint8ClampedArray): boolean => {
          return val > 50;
        };
        let result: number | undefined = arr.find(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.find(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number | undefined = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_find_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'find',
          'find(predicate: (value: number, index: int, obj: Uint8ClampedArray) => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_find_1600Index_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, obj: Uint8ClampedArray): boolean => {
          return val > 50;
        };
        let result: number = arr.findIndex(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.findIndex(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_find_1600Index_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findIndex',
          'findIndex(predicate: (value: number, index: int, obj: Uint8ClampedArray) => boolean): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_filter_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Uint8ClampedArray): boolean => {
          return val > 50;
        };
        let result: Uint8ClampedArray = arr.filter(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.filter(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_filter_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'filter',
          'filter(fn: (val: number, index: int, array: Uint8ClampedArray) => boolean): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_map_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (val: number, index: number, array: Uint8ClampedArray): number => {
          return val * 2;
        };
        let result: Uint8ClampedArray = arr.map(cmp);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.map(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_map_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'map',
          'map(fn: (val: number, index: int, array: Uint8ClampedArray) => number): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reduce_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let cmp = (previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => {
          return previousValue + currentValue;
        };
        let result: number = arr.reduce(cmp, 0);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.reduce(cmp, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reduce_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduce',
          'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_reduce_2000Right_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let cmp = (previousValue: number, currentValue: number, currentIndex: number, array: Uint8ClampedArray): number => {
          return previousValue + currentValue;
        };
        let result: number = arr.reduceRight(cmp, 0);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.reduceRight(cmp, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reduce_2000Right_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduceRight',
          'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_forEach_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = i;
        }
        let cmp = (value: number, index: number, array: Uint8ClampedArray): void => {
          let sum: number = value + index;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          arr.forEach(cmp);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = arr;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_forEach_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'forEach',
          'forEach(callbackfn: (value: number, index: int, array: Uint8ClampedArray) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_static_of_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Uint8ClampedArray = Uint8ClampedArray.of(1, 2, 3, 4, 5);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.of(1, 2, 3, 4, 5);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_of_2300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_of',
          'static of(...items: FixedArray<int>): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_static_from_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: number[] = new Array<number>();
        for (let i: number = 0; i < 100; i++) {
          srcArr.push(i);
        }
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_array',
          'static from(arr: Array<int>): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_static_from_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_2500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_typedarray',
          'static from(arr: Uint8ClampedArray): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_static_from_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcSet: Set<number> = new Set<number>();
        for (let i: number = 0; i < 100; i++) {
          srcSet.add(i);
        }
        let result: Uint8ClampedArray = Uint8ClampedArray.from(srcSet);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint8ClampedArray.from(srcSet);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_2600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_set',
          'static from(set: Set<int>): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_copy_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
        for (let i: number = 0; i < 100; i++) {
          srcArr[i] = i;
        }
        let result: Uint8ClampedArray = new Uint8ClampedArray(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_copy_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_copy',
          'constructor(other: Uint8ClampedArray): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(100);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer',
          'constructor(buf: ArrayBuffer): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800_offset_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf, 50);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf, 50);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800_offset_2900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer_offset',
          'constructor(buf: ArrayBuffer, byteOffset: int): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800_offset_2900_length_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: ArrayBuffer = new ArrayBuffer(200);
        let result: Uint8ClampedArray = new Uint8ClampedArray(buf, 50, 100);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = new Uint8ClampedArray(buf, 50, 100);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint8ClampedArray = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer_2800_offset_2900_length_3000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer_offset_length',
          'constructor(buf: ArrayBuffer, byteOffset: int, length: int): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigUint64Array_at_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: BigUint64Array = new BigUint64Array(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = BigInt(i);
        }
        let result: bigint | undefined = arr[50];
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr[50];
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: bigint | undefined = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_at_3100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'at',
          'at(index: int): bigint | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigUint64Array_slice_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: BigUint64Array = new BigUint64Array(100);
        for (let i: number = 0; i < 100; i++) {
          arr[i] = BigInt(i);
        }
        let result: BigUint64Array = arr.slice(10, 50);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.slice(10, 50);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: BigUint64Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_slice_3200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'slice',
          'slice(begin?: int, end?: int): BigUint64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigUint64Array_sort_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let originalData: bigint[] = [];
        for (let j: number = 0; j < 100; j++) {
          originalData[j] = BigInt(100 - j);
        }
        let arr: BigUint64Array = new BigUint64Array(originalData);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          arr.sort();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: BigUint64Array = arr;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_sort_3300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'sort',
          'sort(): this', arkTsAveragedTime);
      done();
      })
  })
}