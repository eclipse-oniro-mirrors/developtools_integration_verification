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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

export default function BuiltinArraySortPerfTest(): void {
  describe('BuiltinArraySortPerfTest', () => {
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
    it('PerformanceTest_BuiltinArraySortPerfTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Byte>[] = new Array<FixedArray<Byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3, 1, 2];
      }
      let cmp = (lhs: byte, rhs: byte): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Byte>, startIndex: int, endIndex: int, comp: (lhs: byte, rhs: byte) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Short>[] = new Array<FixedArray<Short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [30, 10, 20];
      }
      let cmp = (lhs: short, rhs: short): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Short>, startIndex: int, endIndex: int, comp: (lhs: short, rhs: short) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Int>[] = new Array<FixedArray<Int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [300, 100, 200];
      }
      let cmp = (lhs: int, rhs: int): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Int>, startIndex: int, endIndex: int, comp: (lhs: int, rhs: int) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Long>[] = new Array<FixedArray<Long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3000, 1000, 2000];
      }
      let cmp = (lhs: long, rhs: long): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Long>, startIndex: int, endIndex: int, comp: (lhs: long, rhs: long) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Float>[] = new Array<FixedArray<Float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.3f, 1.1f, 2.2f];
      }
      let cmp = (lhs: float, rhs: float): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Float>, startIndex: int, endIndex: int, comp: (lhs: float, rhs: float) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<Double>[] = new Array<FixedArray<Double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.33, 1.11, 2.22];
      }
      let cmp = (lhs: double, rhs: double): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr_sort_stable(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'arr_sort_stable',
        'arr_sort_stable(arr: FixedArray<Double>, startIndex: int, endIndex: int, comp: (lhs: double, rhs: double) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [true, false, true];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<boolean>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<boolean>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [true, false, true];
      }
      let cmp = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [true, false, true];
      }
      let cmp = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<boolean>, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [true, false, true];
      }
      let cmp = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [3, 1, 2];
      let result = new FixedArray<byte>(3, new Byte());
      let cmp = (lhs: byte, rhs: byte): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<byte>, cmp: (lhs: byte, rhs: byte) => int, begin: int, end: int): FixedArray<byte>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<byte>[] = new Array<FixedArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3, 1, 2];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<byte>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [3, 1, 2];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<byte>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<byte>[] = new Array<FixedArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3, 1, 2];
      }
      let cmp = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<byte>[] = new Array<FixedArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3, 1, 2];
      }
      let cmp = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<byte>, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<byte>[] = new Array<FixedArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3, 1, 2];
      }
      let cmp = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [30, 10, 20];
      let result = new FixedArray<short>(3, new Short());
      let cmp = (lhs: short, rhs: short): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<short>, cmp: (lhs: short, rhs: short) => int, begin: int, end: int): FixedArray<short>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<short>[] = new Array<FixedArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [30, 10, 20];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<short>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [30, 10, 20];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<short>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<short>[] = new Array<FixedArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [30, 10, 20];
      }
      let cmp = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArraySortPerfTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<short>[] = new Array<FixedArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [30, 10, 20];
      }
      let cmp = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<short>, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<short>[] = new Array<FixedArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [30, 10, 20];
      }
      let cmp = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<short>, startIndex: int, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [300, 100, 200];
      let result = new FixedArray<int>(3, new Int());
      let cmp = (lhs: int, rhs: int): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<int>, cmp: (lhs: int, rhs: int) => int, begin: int, end: int): FixedArray<int>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<int>[] = new Array<FixedArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [300, 100, 200];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<int>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [300, 100, 200];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<int>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<int>[] = new Array<FixedArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [300, 100, 200];
      }
      let cmp = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<int>, startIndex: int, endIndex: int, mustPrecede: (lhs: int, rhs: int) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<int>[] = new Array<FixedArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [300, 100, 200];
      }
      let cmp = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<int>, mustPrecede: (lhs: int, rhs: int) => boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<int>[] = new Array<FixedArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [300, 100, 200];
      }
      let cmp = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<int>, startIndex: int, mustPrecede: (lhs: int, rhs: int) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [3000, 1000, 2000];
      let result = new FixedArray<long>(3, new Long());
      let cmp = (lhs: long, rhs: long): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<long>, cmp: (lhs: long, rhs: long) => int, begin: int, end: int): FixedArray<long>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<long>[] = new Array<FixedArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3000, 1000, 2000];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<long>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [3000, 1000, 2000];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<long>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<long>[] = new Array<FixedArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3000, 1000, 2000];
      }
      let cmp = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<long>[] = new Array<FixedArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3000, 1000, 2000];
      }
      let cmp = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<long>, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<long>[] = new Array<FixedArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3000, 1000, 2000];
      }
      let cmp = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [
        Double.toFloat(3.3),  // 或者 Float.valueOf(3.3)
        Double.toFloat(1.1),
        Double.toFloat(2.2)
      ];
      let result = new FixedArray<float>(3, new Float());
      let cmp = (lhs: float, rhs: float): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<float>, cmp: (lhs: float, rhs: float) => int, begin: int, end: int): FixedArray<float>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<float>[] = new Array<FixedArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.3f, 1.1f, 2.2f];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<float>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [3.3f, 1.1f, 2.2f];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<float>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<float>[] = new Array<FixedArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.3f, 1.1f, 2.2f];
      }
      let cmp = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<float>, startIndex: int, endIndex: int, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<float>[] = new Array<FixedArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.3f, 1.1f, 2.2f];
      }
      let cmp = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<float>, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<float>[] = new Array<FixedArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.3f, 1.1f, 2.2f];
      }
      let cmp = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<float>, startIndex: int, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
      let result = new FixedArray<double>(3, new Double());
      let cmp = (lhs: double, rhs: double): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(fixArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'mergeSort',
      'mergeSort(array: FixedArray<double>, cmp: (lhs: double, rhs: double) => int, begin: int, end: int): FixedArray<double>',
      arkTsAveragedTime);

    })


    it('PerformanceTest_BuiltinArraySortPerfTest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<double>[] = new Array<FixedArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.33, 1.11, 2.22];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<double>, startIndex: int, endIndex: int): void', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<double>, i: int, j: int): void', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<double>[] = new Array<FixedArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.33, 1.11, 2.22];
      }
      let cmp = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<double>, startIndex: int, endIndex: int, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<double>[] = new Array<FixedArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.33, 1.11, 2.22];
      }
      let cmp = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<double>, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<double>[] = new Array<FixedArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [3.33, 1.11, 2.22];
      }
      let cmp = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<double>, startIndex: int, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<char>[] = new Array<FixedArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [c'c', c'a', c'b'];
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(arr: FixedArray<char>, startIndex: int, endIndex: int): void', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'c', c'a', c'b'];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<char>, i: int, j: int): void', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<char>[] = new Array<FixedArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [c'c', c'a', c'b'];
      }
      let cmp = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: (lhs: char, rhs: char) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<char>[] = new Array<FixedArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [c'c', c'a', c'b'];
      }
      let cmp = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<char>, mustPrecede: (lhs: char, rhs: char) => boolean): void',
        arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<char>[] = new Array<FixedArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = [c'c', c'a', c'b'];
      }
      let cmp = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<char>, startIndex: int, ' +
          'mustPrecede: (lhs: char, rhs: char) => boolean)', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<string> = ['ccc', 'aaa', 'bbb'];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(fixArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = fixArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'swap',
        'swap(arr: FixedArray<string>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<string>[] = new Array<FixedArray<string>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = ['ccc', 'aaa', 'bbb'];
      }
      let cmp = (lhs: string, rhs: string) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<string>, startIndex: int, endIndex: int, ' +
          'mustPrecede: (lhs: string, rhs: string) => boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<string>[] = new Array<FixedArray<string>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = ['ccc', 'aaa', 'bbb'];
      }
      let cmp = (lhs: string, rhs: string) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<string>,' +
          ' mustPrecede: (lhs: string, rhs: string) => boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<string>[] = new Array<FixedArray<string>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = ['ccc', 'aaa', 'bbb'];
      }
      let cmp = (lhs: string, rhs: string) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, cmp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort_subarray',
        'sort_subarray(arr: FixedArray<string>, startIndex: int, ' +
          'mustPrecede: (lhs: string, rhs: string) => boolean): void', arkTsAveragedTime);
    })
  })
}
