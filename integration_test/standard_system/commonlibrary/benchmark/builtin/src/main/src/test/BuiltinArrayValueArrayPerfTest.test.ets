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

export default function BuiltinArrayValueArrayPerfTest(): void {
  describe('BuiltinArrayValueArrayPerfTest', () => {
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

    // ValueArray<int> tests
    it('PerformanceTest_ValueArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = at(valArray, 1);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'at',
            'at(index: int): int | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: ValueArray<int> = new ValueArray<int>(5, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(valArray, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: ValueArray<int> = new ValueArray<int>(5, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(valArray, 0, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: ValueArray<int> = new ValueArray<int>(5, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = fill(valArray, 9);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'fill',
            'fill(value: int, start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = find(valArray, (value: int) => value > 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'find',
            'find(predicate: (value: int, index: int, array: ValueArray<int>) => boolean): int | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findIndex(valArray, (value: int) => value > 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findIndex',
            'findIndex(predicate: (value: int, index: int, array: ValueArray<int>) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLast(valArray, (elem: int) => elem < 5);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLast',
            'findLast(predicate: (elem: int, index: int, array: ValueArray<int>) => boolean): int | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = every(valArray, (value: int) => value > 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'every',
            'every(predicate: (value: int, index: int, array: ValueArray<int>) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = some(valArray, (value: int) => value > 4);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'some',
            'some(predicate: (value: int, index: int, array: ValueArray<int>) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLastIndex(valArray, (element: int) => element < 5);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'findLastIndex',
            'findLastIndex(predicate: (element: int, index: int, array: ValueArray<int>) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(valArray, (previousValue: int, currentValue: int) => previousValue + currentValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
            'reduce(callbackfn: (previousValue: int, currentValue: int, index: int, array: ValueArray<int>) => int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(valArray, (previousValue: int, currentValue: int) => previousValue + currentValue, 10);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
            'reduce<U>(callbackfn: (previousValue: U, currentValue: int, index: int, array: ValueArray<int>) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            forEach(valArray, (value: int, index: int) => { result = value; });
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'forEach',
            'forEach(callbackfn: (value: int, index: int, array: ValueArray<int>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(valArray, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
            'slice(start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: ValueArray<int> = new ValueArray<int>(2, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(valArray, 1, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'slice',
            'slice(start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 2; valArray[4] = 1;
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = lastIndexOf(valArray, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'lastIndexOf',
            'lastIndexOf(element: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = join(valArray, "-");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'join',
            'join(sep?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toString(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toString',
            'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: ValueArray<int> = new ValueArray<int>(2, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSpliced(valArray, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSpliced',
            'toSpliced(start: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = includes(valArray, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'includes',
            'includes(val: int, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(5, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3; valArray[3] = 4; valArray[4] = 5;
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = indexOf(valArray, 4);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'indexOf',
            'indexOf(val: int, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSorted(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toSorted',
            'toSorted(): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reverse(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reverse',
            'reverse(): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toReversed(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'toReversed',
            'toReversed(): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = with(valArray, 1, 9);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'with',
            'with(index: int, value: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result = values(valArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = values(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'values',
            'values(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result = entries(valArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = entries(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'entries',
            'entries(): IterableIterator<[int, int]>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = map(valArray, (value: int) => value * 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'map',
            'map(callbackfn: (value: int, index: int, array: ValueArray<int>) => int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result: ValueArray<int> = new ValueArray<int>(2, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = filter(valArray, (v: int) => v > 1);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'filter',
            'filter(fn: (v: int, k: int, array: ValueArray<int>) => boolean): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 3; valArray[1] = 1; valArray[2] = 2;
        let result: ValueArray<int> = new ValueArray<int>(3, 0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = sort(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_3000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'sort',
            'sort(comparator?: (a: int, b: int) => int, start?: int, end?: int): ValueArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_ValueArrayTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let valArray: ValueArray<int> = new ValueArray<int>(3, 0);
        valArray[0] = 1; valArray[1] = 2; valArray[2] = 3;
        let result = keys(valArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = keys(valArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_3100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'keys',
            'keys(): IterableIterator<int>', arkTsAveragedTime);
    })
  })
}
