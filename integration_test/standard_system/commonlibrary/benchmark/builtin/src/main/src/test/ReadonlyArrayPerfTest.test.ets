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

export default function ReadonlyArrayPerfTest(): void {
  describe('ReadonlyArrayPerfTest', () => {
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

    // ================================================================
    // 1. ReadonlyArray — concat
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Concat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3] as int[];
      let other: ReadonlyArray<int> = [4, 5] as int[];
      let res: int[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.concat(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Concat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'concat',
        'concat(...items: FixedArray<ConcatArray<T>>): Array<T>', arkTsAveragedTime);
    })

    // ================================================================
    // 2. ReadonlyArray — entries
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Entries_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: IterableIterator<[int, int]> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Entries_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'entries',
        'entries(): IterableIterator<[int, T]>', arkTsAveragedTime);
    })

    // ================================================================
    // 3. ReadonlyArray — every
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Every_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.every((value: int, index: int, array: ReadonlyArray<int>) => { return value > 0; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Every_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'every',
        'every(predicate: (value: T, index: int, array: ReadonlyArray<T>) => boolean): boolean', arkTsAveragedTime);
    })

    // ================================================================
    // 4. ReadonlyArray — filter
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Filter_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.filter((value: int, index: int, array: ReadonlyArray<int>) => { return value > 2; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Filter_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'filter',
        'filter(predicate: (value: T, index: int, array: ReadonlyArray<T>) => boolean): Array<T>', arkTsAveragedTime);
    })

    // ================================================================
    // 5. ReadonlyArray — find
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Find_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.find((value: int, index: int, obj: ReadonlyArray<int>) => { return value === 3; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Find_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'find',
        'find(predicate: (value: T, index: int, obj: ReadonlyArray<T>) => boolean): T | undefined', arkTsAveragedTime);
    })

    // ================================================================
    // 6. ReadonlyArray — findLast
    // ================================================================
    it('PerformanceTest_ReadonlyArray_FindLast_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((value: int, index: int, obj: ReadonlyArray<int>) => { return value > 2; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_FindLast_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'findLast',
        'findLast(predicate: (value: T, index: int, obj: ReadonlyArray<T>) => boolean): T | undefined', arkTsAveragedTime);
    })

    // ================================================================
    // 7. ReadonlyArray — findIndex
    // ================================================================
    it('PerformanceTest_ReadonlyArray_FindIndex_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex((value: int, index: int, obj: ReadonlyArray<int>) => { return value === 3; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_FindIndex_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'findIndex',
        'findIndex(predicate: (value: T, index: int, obj: ReadonlyArray<T>) => boolean): int', arkTsAveragedTime);
    })

    // ================================================================
    // 8. ReadonlyArray — findLastIndex
    // ================================================================
    it('PerformanceTest_ReadonlyArray_FindLastIndex_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>) => { return value > 2; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_FindLastIndex_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'findLastIndex',
        'findLastIndex(predicate: (value: T, index: int, obj: ReadonlyArray<T>) => boolean): int', arkTsAveragedTime);
    })

    // ================================================================
    // 9. ReadonlyArray — forEach
    // ================================================================
    it('PerformanceTest_ReadonlyArray_ForEach_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((value: int, index: int, array: ReadonlyArray<int>) => { res = value; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ForEach_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'forEach',
        'forEach(action: (value: T, index: int, array: ReadonlyArray<T>) => void): void', arkTsAveragedTime);
    })

    // ================================================================
    // 10. ReadonlyArray — join
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Join_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Join_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'join',
        'join(separator?: string): string', arkTsAveragedTime);
    })

    // ================================================================
    // 11. ReadonlyArray — includes
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Includes_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Includes_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'includes',
        'includes(searchElement: T, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    // ================================================================
    // 12. ReadonlyArray — indexOf
    // ================================================================
    it('PerformanceTest_ReadonlyArray_IndexOf_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_IndexOf_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'indexOf',
        'indexOf(searchElement: T, fromIndex?: int): int', arkTsAveragedTime);
    })

    // ================================================================
    // 13. ReadonlyArray — keys
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Keys_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: IterableIterator<int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Keys_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    // ================================================================
    // 14. ReadonlyArray — lastIndexOf (without fromIndex)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_LastIndexOf_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 2, 1] as int[];
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_LastIndexOf_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'lastIndexOf',
        'lastIndexOf(searchElement: T): int', arkTsAveragedTime);
    })

    // ================================================================
    // 15. ReadonlyArray — lastIndexOf (with fromIndex)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_LastIndexOfFromIndex_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 2, 1] as int[];
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(2, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_LastIndexOfFromIndex_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'lastIndexOf',
        'lastIndexOf(searchElement: T, fromIndex?: int): int', arkTsAveragedTime);
    })

    // ================================================================
    // 16. ReadonlyArray — map
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Map_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map((value: int, index: int, array: ReadonlyArray<int>) => { return value * 2; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Map_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'map',
        'map<U>(mapper: (value: T, index: int, array: ReadonlyArray<T>) => U): Array<U>', arkTsAveragedTime);
    })

    // ================================================================
    // 17. ReadonlyArray — reduce (without initialValue)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Reduce_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: int, currentValue: int, currentIndex: int, array: ReadonlyArray<int>) => { return previousValue + currentValue; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Reduce_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduce',
        'reduce(reducer: (previousValue: T, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => T): T', arkTsAveragedTime);
    })

    // ================================================================
    // 18. ReadonlyArray — reduce (with initialValue)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_ReduceWithInitial_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: int, currentValue: int, currentIndex: int, array: ReadonlyArray<int>) => { return previousValue + currentValue; }, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceWithInitial_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduce',
        'reduce<U>(reducer: (previousValue: U, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => U, initialValue: U): U', arkTsAveragedTime);
    })

    // ================================================================
    // 19. ReadonlyArray — reduceRight (without initialValue)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_ReduceRight_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: int, currentValue: int, currentIndex: int, array: ReadonlyArray<int>) => { return previousValue + currentValue; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceRight_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduceRight',
        'reduceRight(reducer: (previousValue: T, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => T): T', arkTsAveragedTime);
    })

    // ================================================================
    // 20. ReadonlyArray — reduceRight (with initialValue)
    // ================================================================
    it('PerformanceTest_ReadonlyArray_ReduceRightWithInitial_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: int, currentValue: int, currentIndex: int, array: ReadonlyArray<int>) => { return previousValue + currentValue; }, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceRightWithInitial_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduceRight',
        'reduceRight<U>(reducer: (previousValue: U, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => U, initialValue: U): U', arkTsAveragedTime);
    })

    // ================================================================
    // 21. ReadonlyArray — slice
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Slice_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: int[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Slice_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'slice',
        'slice(start?: int, end?: int): Array<T>', arkTsAveragedTime);
    })

    // ================================================================
    // 22. ReadonlyArray — some
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Some_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some((value: int, index: int, array: ReadonlyArray<int>) => { return value > 3; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Some_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'some',
        'some(predicate: (value: T, index: int, array: ReadonlyArray<T>) => boolean): boolean', arkTsAveragedTime);
    })

    // ================================================================
    // 23. ReadonlyArray — values
    // ================================================================
    it('PerformanceTest_ReadonlyArray_Values_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ReadonlyArray<int> = [1, 2, 3, 4, 5] as int[];
      let res: IterableIterator<int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Values_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}
