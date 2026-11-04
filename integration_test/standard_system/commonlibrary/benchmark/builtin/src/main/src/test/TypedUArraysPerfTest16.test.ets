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

export default function TypedUArraysPerfTest16(): void {
  describe('TypedUArraysPerfTest16', () => {
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

    // ==================== Uint8ClampedArray 实例方法测试(续) ====================

    it('PerformanceTest_Uint8ClampedArray_fill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.fill(42, 0, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_fill: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'fill',
        'fill(value: int, start?: int, end?: int): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(50, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set',
        'set(insertPos: int, val: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(50);
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'set_array_offset',
        'set(array: Uint8ClampedArray, offset: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_includes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result = arr.includes(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_includes: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'includes',
        'includes(searchElement: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_indexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result = arr.indexOf(50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_indexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'indexOf',
        'indexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_join', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = i ;
      }
      let result = arr.join(",");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.join(",");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_join: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'join',
        'join(separator?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_lastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (i % 10) ;
      }
      let result = arr.lastIndexOf(5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_lastIndexOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'lastIndexOf',
        'lastIndexOf(searchElement: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let originalData: number[] = new Array<number>(100);
      for (let i = 0; i < 100; i++) {
        originalData[i] = i;
      }
      let arr: Uint8ClampedArray = new Uint8ClampedArray(originalData);
      let res: Uint8ClampedArray = arr;

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reverse: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reverse',
        'reverse(): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_toReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result = arr.toReversed();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_toReversed: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toReversed',
        'toReversed(): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_toSorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = (100 - i) ;
      }
      let result = arr.toSorted();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_toSorted: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toSorted',
        'toSorted(): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_with', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let result = arr.with(50, 99);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(50, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_with: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'with',
        'with(index: int, value: int): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_entries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter = arr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_entries: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'entries',
        'entries(): IterableIterator<[int, Number]>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_keys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter = arr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_keys: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let iter = arr.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_values: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'values',
        'values(): IterableIterator<Number>', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, array: Uint8ClampedArray): boolean => {
        return val > 50;
      };
      let result = arr.some(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'some',
        'some(predicate: (element: number, index: int, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, array: Uint8ClampedArray): boolean => {
        return val >= 0;
      };
      let result = arr.every(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'every',
        'every(predicate: (element: number, index: int, array: Uint8ClampedArray) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, obj: Uint8ClampedArray): boolean => {
        return val > 50;
      };
      let result = arr.find(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'find',
        'find(predicate: (value: number, index: int, obj: Uint8ClampedArray) => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, obj: Uint8ClampedArray): boolean => {
        return val > 50;
      };
      let result = arr.findIndex(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findIndex',
        'findIndex(predicate: (value: number, index: int, obj: Uint8ClampedArray) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, array: Uint8ClampedArray): boolean => {
        return val > 50;
      };
      let result = arr.filter(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'filter',
        'filter(fn: (val: number, index: int, array: Uint8ClampedArray) => boolean): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (val: number, index: int, array: Uint8ClampedArray): number => {
        return val * 2;
      };
      let result = arr.map(cmp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'map',
        'map(fn: (val: number, index: int, array: Uint8ClampedArray) => number): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let cmp = (previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      };
      let result = arr.reduce(cmp, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce(cmp, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduce',
        'reduce(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1 ;
      }
      let cmp = (previousValue: number, currentValue: number, currentIndex: int, array: Uint8ClampedArray): number => {
        return previousValue + currentValue;
      };
      let result = arr.reduceRight(cmp, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight(cmp, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: U, currentValue: number, currentIndex: int, array: Uint8ClampedArray) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i ;
      }
      let cmp = (value: number, index: int, array: Uint8ClampedArray): void => {
        let sum = value + index;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach(cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'forEach',
        'forEach(callbackfn: (value: number, index: int, array: Uint8ClampedArray) => void): void', arkTsAveragedTime);
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_of: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_of',
        'static of(...items: FixedArray<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<int> = new Array<int>();
      for (let i = 0; i < 100; i++) {
        srcArr.push(i as int);
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_array',
        'static from(arr: Array<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let result = Uint8ClampedArray.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_typedarray',
        'static from(arr: Uint8ClampedArray): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_static_from_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcSet: Set<int> = new Set<int>();
      for (let i = 0; i < 100; i++) {
        srcSet.add(i as int);
      }
      let result = Uint8ClampedArray.from(srcSet);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Uint8ClampedArray.from(srcSet);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_static_from_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'static_from_set',
        'static from(set: Set<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray 构造函数补充测试 ====================

    it('PerformanceTest_Uint8ClampedArray_Constructor_copy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Uint8ClampedArray = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = i ;
      }
      let result = new Uint8ClampedArray(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_copy: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_copy',
        'constructor(other: Uint8ClampedArray): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let result = new Uint8ClampedArray(buf);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer',
        'constructor(buf: ArrayBuffer): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8ClampedArray(buf, 50);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer_offset: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer_offset',
        'constructor(buf: ArrayBuffer, byteOffset: int): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_Constructor_buffer_offset_length', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let result = new Uint8ClampedArray(buf, 50, 100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new Uint8ClampedArray(buf, 50, 100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Uint8ClampedArray_Constructor_buffer_offset_length: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'constructor_buffer_offset_length',
        'constructor(buf: ArrayBuffer, byteOffset: int, length: int): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== BigUint64Array 方法测试 ====================

    it('PerformanceTest_BigUint64Array_at', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_at: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'at',
        'at(index: int): bigint | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_slice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array(100);
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_slice: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'slice',
        'slice(begin?: int, end?: int): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_sort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let originalData: BigInt[] = [];
      for (let j = 0; j < 100; j++) {
        originalData[j] = BigInt(100 - j);
      }
      let arr: BigUint64Array = new BigUint64Array(originalData);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.sort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_sort: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'sort',
        'sort(): this', arkTsAveragedTime);
    })
  })
}
