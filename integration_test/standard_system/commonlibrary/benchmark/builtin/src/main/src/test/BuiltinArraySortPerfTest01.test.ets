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

export default function BuiltinArraySortPerfTest01(): void {
  describe('BuiltinArraySortPerfTest01', () => {
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

    // ==================== arr_sort_stable ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<byte>[] = new Array<ValueArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<byte>(3, 0);
        pools[j][0] = 3; pools[j][1] = 1; pools[j][2] = 2;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<byte>, startIndex: int, endIndex: int, comp: (lhs: byte, rhs: byte) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<short>[] = new Array<ValueArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<short>(3, 0);
        pools[j][0] = 30; pools[j][1] = 10; pools[j][2] = 20;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<short>, startIndex: int, endIndex: int, comp: (lhs: short, rhs: short) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<int>[] = new Array<ValueArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<int>(3, 0);
        pools[j][0] = 300; pools[j][1] = 100; pools[j][2] = 200;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<int>, startIndex: int, endIndex: int, comp: (lhs: int, rhs: int) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<long>[] = new Array<ValueArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<long>(3, 0);
        pools[j][0] = 3000; pools[j][1] = 1000; pools[j][2] = 2000;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<long>, startIndex: int, endIndex: int, comp: (lhs: long, rhs: long) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<float>[] = new Array<ValueArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<float>(3, 0);
        pools[j][0] = 3.3 as float; pools[j][1] = 1.1 as float; pools[j][2] = 2.2 as float;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<float>, startIndex: int, endIndex: int, comp: (lhs: float, rhs: float) => int): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<double>[] = new Array<ValueArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<double>(3, 0);
        pools[j][0] = 3.33; pools[j][1] = 1.11; pools[j][2] = 2.22;
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'arr_sort_stable',
        'arr_sort_stable(arr: ValueArray<double>, startIndex: int, endIndex: int, comp: (lhs: double, rhs: double) => int): void',
        arkTsAveragedTime);
    })

    // ==================== mergeSort ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<byte> = new ValueArray<byte>(3, 0);
      valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
      let result: ValueArray<byte> = new ValueArray<byte>(3, 0);
      let cmp = (lhs: byte, rhs: byte): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<byte>, cmp: (lhs: byte, rhs: byte) => int, begin: int, end: int): ValueArray<byte>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<short> = new ValueArray<short>(3, 0);
      valArray[0] = 30; valArray[1] = 10; valArray[2] = 20;
      let result: ValueArray<short> = new ValueArray<short>(3, 0);
      let cmp = (lhs: short, rhs: short): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<short>, cmp: (lhs: short, rhs: short) => int, begin: int, end: int): ValueArray<short>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
      valArray[0] = 300; valArray[1] = 100; valArray[2] = 200;
      let result: ValueArray<int> = new ValueArray<int>(3, 0);
      let cmp = (lhs: int, rhs: int): int => {
        return lhs - rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<int>, cmp: (lhs: int, rhs: int) => int, begin: int, end: int): ValueArray<int>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<long> = new ValueArray<long>(3, 0);
      valArray[0] = 3000; valArray[1] = 1000; valArray[2] = 2000;
      let result: ValueArray<long> = new ValueArray<long>(3, 0);
      let cmp = (lhs: long, rhs: long): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<long>, cmp: (lhs: long, rhs: long) => int, begin: int, end: int): ValueArray<long>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<float> = new ValueArray<float>(3, 0);
      valArray[0] = 3.3 as float; valArray[1] = 1.1 as float; valArray[2] = 2.2 as float;
      let result: ValueArray<float> = new ValueArray<float>(3, 0);
      let cmp = (lhs: float, rhs: float): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<float>, cmp: (lhs: float, rhs: float) => int, begin: int, end: int): ValueArray<float>',
      arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<double> = new ValueArray<double>(3, 0);
      valArray[0] = 3.33; valArray[1] = 1.11; valArray[2] = 2.22;
      let result: ValueArray<double> = new ValueArray<double>(3, 0);
      let cmp = (lhs: double, rhs: double): int => {
        return lhs > rhs ? 1 : -1;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = mergeSort(valArray, cmp, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'mergeSort',
      'mergeSort(array: ValueArray<double>, cmp: (lhs: double, rhs: double) => int, begin: int, end: int): ValueArray<double>',
      arkTsAveragedTime);
    })

    // ==================== sort ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<boolean>[] = new Array<ValueArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<boolean>(3, false);
        pools[j][0] = true; pools[j][1] = false; pools[j][2] = true;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<boolean>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<byte>[] = new Array<ValueArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<byte>(3, 0);
        pools[j][0] = 3; pools[j][1] = 1; pools[j][2] = 2;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<byte>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<short>[] = new Array<ValueArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<short>(3, 0);
        pools[j][0] = 30; pools[j][1] = 10; pools[j][2] = 20;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<short>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<int>[] = new Array<ValueArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<int>(3, 0);
        pools[j][0] = 300; pools[j][1] = 100; pools[j][2] = 200;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<int>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<long>[] = new Array<ValueArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<long>(3, 0);
        pools[j][0] = 3000; pools[j][1] = 1000; pools[j][2] = 2000;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<long>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<float>[] = new Array<ValueArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<float>(3, 0);
        pools[j][0] = 3.3 as float; pools[j][1] = 1.1 as float; pools[j][2] = 2.2 as float;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<float>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<double>[] = new Array<ValueArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<double>(3, 0);
        pools[j][0] = 3.33; pools[j][1] = 1.11; pools[j][2] = 2.22;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<double>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<char>[] = new Array<ValueArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<char>(3, c'\u0000');
        pools[j][0] = c'c'; pools[j][1] = c'a'; pools[j][2] = c'b';
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort(pools[i], 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
        'sort(arr: ValueArray<char>, startIndex: int, endIndex: int): void', arkTsAveragedTime);
    })

    // ==================== swap ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<boolean> = new ValueArray<boolean>(3, false);
      valArray[0] = true; valArray[1] = false; valArray[2] = true;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<boolean>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<byte> = new ValueArray<byte>(3, 0);
      valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<byte>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<short> = new ValueArray<short>(3, 0);
      valArray[0] = 30; valArray[1] = 10; valArray[2] = 20;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<short>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
      valArray[0] = 300; valArray[1] = 100; valArray[2] = 200;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<int>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<long> = new ValueArray<long>(3, 0);
      valArray[0] = 3000; valArray[1] = 1000; valArray[2] = 2000;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<long>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<float> = new ValueArray<float>(3, 0);
      valArray[0] = 3.3 as float; valArray[1] = 1.1 as float; valArray[2] = 2.2 as float;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<float>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<double> = new ValueArray<double>(3, 0);
      valArray[0] = 3.33; valArray[1] = 1.11; valArray[2] = 2.22;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<double>, i: int, j: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let valArray: ValueArray<char> = new ValueArray<char>(3, c'\u0000');
      valArray[0] = c'c'; valArray[1] = c'a'; valArray[2] = c'b';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        swap(valArray, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = valArray;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'swap',
        'swap(arr: ValueArray<char>, i: int, j: int): void', arkTsAveragedTime);
    })

    // ==================== sort_subarray(arr, startIndex, endIndex, mustPrecede) ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<boolean>[] = new Array<ValueArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<boolean>(3, false);
        pools[j][0] = true; pools[j][1] = false; pools[j][2] = true;
      }
      let mustPrecede = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<boolean>, startIndex: int, endIndex: int, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<byte>[] = new Array<ValueArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<byte>(3, 0);
        pools[j][0] = 3; pools[j][1] = 1; pools[j][2] = 2;
      }
      let mustPrecede = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<byte>, startIndex: int, endIndex: int, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<short>[] = new Array<ValueArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<short>(3, 0);
        pools[j][0] = 30; pools[j][1] = 10; pools[j][2] = 20;
      }
      let mustPrecede = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<short>, startIndex: int, endIndex: int, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<int>[] = new Array<ValueArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<int>(3, 0);
        pools[j][0] = 300; pools[j][1] = 100; pools[j][2] = 200;
      }
      let mustPrecede = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<int>, startIndex: int, endIndex: int, mustPrecede: (lhs: int, rhs: int) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<long>[] = new Array<ValueArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<long>(3, 0);
        pools[j][0] = 3000; pools[j][1] = 1000; pools[j][2] = 2000;
      }
      let mustPrecede = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<long>, startIndex: int, endIndex: int, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<float>[] = new Array<ValueArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<float>(3, 0);
        pools[j][0] = 3.3 as float; pools[j][1] = 1.1 as float; pools[j][2] = 2.2 as float;
      }
      let mustPrecede = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<float>, startIndex: int, endIndex: int, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<double>[] = new Array<ValueArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<double>(3, 0);
        pools[j][0] = 3.33; pools[j][1] = 1.11; pools[j][2] = 2.22;
      }
      let mustPrecede = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<double>, startIndex: int, endIndex: int, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<char>[] = new Array<ValueArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<char>(3, c'\u0000');
        pools[j][0] = c'c'; pools[j][1] = c'a'; pools[j][2] = c'b';
      }
      let mustPrecede = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, 3, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<char>, startIndex: int, endIndex: int, mustPrecede: (lhs: char, rhs: char) => boolean): void',
        arkTsAveragedTime);
    })

    // ==================== sort_subarray(arr, mustPrecede) ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<boolean>[] = new Array<ValueArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<boolean>(3, false);
        pools[j][0] = true; pools[j][1] = false; pools[j][2] = true;
      }
      let mustPrecede = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<boolean>, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<byte>[] = new Array<ValueArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<byte>(3, 0);
        pools[j][0] = 3; pools[j][1] = 1; pools[j][2] = 2;
      }
      let mustPrecede = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<byte>, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<short>[] = new Array<ValueArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<short>(3, 0);
        pools[j][0] = 30; pools[j][1] = 10; pools[j][2] = 20;
      }
      let mustPrecede = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<short>, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<int>[] = new Array<ValueArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<int>(3, 0);
        pools[j][0] = 300; pools[j][1] = 100; pools[j][2] = 200;
      }
      let mustPrecede = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<int>, mustPrecede: (lhs: int, rhs: int) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<long>[] = new Array<ValueArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<long>(3, 0);
        pools[j][0] = 3000; pools[j][1] = 1000; pools[j][2] = 2000;
      }
      let mustPrecede = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<long>, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<float>[] = new Array<ValueArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<float>(3, 0);
        pools[j][0] = 3.3 as float; pools[j][1] = 1.1 as float; pools[j][2] = 2.2 as float;
      }
      let mustPrecede = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<float>, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<double>[] = new Array<ValueArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<double>(3, 0);
        pools[j][0] = 3.33; pools[j][1] = 1.11; pools[j][2] = 2.22;
      }
      let mustPrecede = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<double>, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<char>[] = new Array<ValueArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<char>(3, c'\u0000');
        pools[j][0] = c'c'; pools[j][1] = c'a'; pools[j][2] = c'b';
      }
      let mustPrecede = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<char>, mustPrecede: (lhs: char, rhs: char) => boolean): void',
        arkTsAveragedTime);
    })

    // ==================== sort_subarray(arr, startIndex, mustPrecede) ValueArray ====================
    it('PerformanceTest_BuiltinArraySortPerfTest01_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<boolean>[] = new Array<ValueArray<boolean>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<boolean>(3, false);
        pools[j][0] = true; pools[j][1] = false; pools[j][2] = true;
      }
      let mustPrecede = (lhs: boolean, rhs: boolean) => {
        return lhs === rhs ? false : !lhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<boolean>, startIndex: int, mustPrecede: (lhs: boolean, rhs: boolean) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<byte>[] = new Array<ValueArray<byte>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<byte>(3, 0);
        pools[j][0] = 3; pools[j][1] = 1; pools[j][2] = 2;
      }
      let mustPrecede = (lhs: byte, rhs: byte) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<byte>, startIndex: int, mustPrecede: (lhs: byte, rhs: byte) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<short>[] = new Array<ValueArray<short>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<short>(3, 0);
        pools[j][0] = 30; pools[j][1] = 10; pools[j][2] = 20;
      }
      let mustPrecede = (lhs: short, rhs: short) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<short>, startIndex: int, mustPrecede: (lhs: short, rhs: short) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<int>[] = new Array<ValueArray<int>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<int>(3, 0);
        pools[j][0] = 300; pools[j][1] = 100; pools[j][2] = 200;
      }
      let mustPrecede = (lhs: int, rhs: int) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<int>, startIndex: int, mustPrecede: (lhs: int, rhs: int) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<long>[] = new Array<ValueArray<long>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<long>(3, 0);
        pools[j][0] = 3000; pools[j][1] = 1000; pools[j][2] = 2000;
      }
      let mustPrecede = (lhs: long, rhs: long) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<long>, startIndex: int, mustPrecede: (lhs: long, rhs: long) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<float>[] = new Array<ValueArray<float>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<float>(3, 0);
        pools[j][0] = 3.3 as float; pools[j][1] = 1.1 as float; pools[j][2] = 2.2 as float;
      }
      let mustPrecede = (lhs: float, rhs: float) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<float>, startIndex: int, mustPrecede: (lhs: float, rhs: float) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<double>[] = new Array<ValueArray<double>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<double>(3, 0);
        pools[j][0] = 3.33; pools[j][1] = 1.11; pools[j][2] = 2.22;
      }
      let mustPrecede = (lhs: double, rhs: double) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<double>, startIndex: int, mustPrecede: (lhs: double, rhs: double) => boolean): void',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArraySortPerfTest01_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: ValueArray<char>[] = new Array<ValueArray<char>>();
      for (let j = 0; j < BASE_COUNT; j++) {
        pools[j] = new ValueArray<char>(3, c'\u0000');
        pools[j][0] = c'c'; pools[j][1] = c'a'; pools[j][2] = c'b';
      }
      let mustPrecede = (lhs: char, rhs: char) => {
        return lhs < rhs;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sort_subarray(pools[i], 0, mustPrecede);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = pools[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest01_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort_subarray',
        'sort_subarray(arr: ValueArray<char>, startIndex: int, mustPrecede: (lhs: char, rhs: char) => boolean): void',
        arkTsAveragedTime);
    })
  })
}
