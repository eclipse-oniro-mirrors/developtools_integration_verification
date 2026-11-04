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

export default function SparseArrayPerfTest(): void {
  describe('SparseArrayPerfTest', () => {
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

    // Constructor tests
    it('PerformanceTest_SparseArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SparseArray<number>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SparseArray<number>(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'constructor',
        'constructor(length: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SparseArray<number>(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'constructor',
        'constructor(...values: T[])', arkTsAveragedTime);
    })

    // Static method tests
    it('PerformanceTest_SparseArray_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = [1, 2, 3, 4, 5];
      let res: SparseArray<int> = new SparseArray<int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = SparseArray.from<int>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'from',
        'static from<T>(arr: ArrayLike<T>): SparseArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let objArray = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = SparseArray.isArray(objArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'isArray',
        'static isArray(o: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = SparseArray.of<number>(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'of',
        'static of<T>(...values: T[]): SparseArray<T>', arkTsAveragedTime);
    })

    // Instance method tests - push/pop
    it('PerformanceTest_SparseArray_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3);
      }
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].push(4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'push',
        'push(val: T): int', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3);
      }
      let res: number | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].pop();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'pop',
        'pop(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3);
      }
      let res: number | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].shift();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'shift',
        'shift(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(4, 5);
      }
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].unshift(1, 2, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'unshift',
        'unshift(...values: T[]): int', arkTsAveragedTime);
    })

    // splice, reverse, sort
    it('PerformanceTest_SparseArray_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3, 4, 5);
      }
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].splice(1, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'splice',
        'splice(start: int, delete: int | undefined, ...items: T[]): SparseArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3, 4, 5);
      }
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].reverse();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'reverse',
        'reverse(): this', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<int>[] = new Array<number>(BASE_COUNT) as SparseArray<int>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<int>(5, 3, 1, 4, 2);
      }
      let res: SparseArray<int> = new SparseArray<int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].sort((a: int, b: int): int => a - b);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'sort',
        'sort(comparator?: (a: T, b: T) => int): this', arkTsAveragedTime);
    })

    // copyWithin, fill, concat, slice
    it('PerformanceTest_SparseArray_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3, 4, 5);
      }
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].copyWithin(0, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'copyWithin',
        'copyWithin(target: int, start: int, end: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: SparseArray<number>[] = new Array<number>(BASE_COUNT) as SparseArray<number>[];
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = new SparseArray<number>(1, 2, 3, 4, 5);
      }
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pools[i].fill(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'fill',
        'fill(value: T, start: int, end: int): this', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3);
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.concat([4, 5, 6]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'concat',
        'concat(...items: FixedArray<ConcatArray<T>>): SparseArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.slice(1, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'slice',
        'slice(start: int, end: int): SparseArray<T>', arkTsAveragedTime);
    })

    // join, toString
    it('PerformanceTest_SparseArray_Instance_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.join(',');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'join',
        'join(sep?: String): string', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    // forEach, map, filter
    it('PerformanceTest_SparseArray_Instance_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let forEachCb = (value: number, index: int, array: SparseArray<number>): void => {
        // noop
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sparseArr.forEach(forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = sparseArr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'forEach',
        'forEach(callbackfn: (value: T, index: int, array: SparseArray<T>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let mapCb = (value: number, index: int, array: SparseArray<number>): number => {
        return value * 2;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.map<number>(mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'map',
        'map<U>(callbackfn: (value: T, index: int, array: SparseArray<T>) => U): SparseArray<U>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let filterCb = (value: number, index: int, array: SparseArray<number>): boolean => {
        return value > 2;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.filter(filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'filter',
        'filter(predicate: (value: T, index: int, array: SparseArray<T>) => boolean): SparseArray<T>', arkTsAveragedTime);
    })

    // reduce, some, every
    it('PerformanceTest_SparseArray_Instance_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: number = 0;
      let reduceCb = (previousValue: number, currentValue: number, index: int, array: SparseArray<number>): number => {
        return previousValue + currentValue;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.reduce(reduceCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'reduce',
        'reduce(callbackfn: (previousValue: T, currentValue: T, index: int, array: SparseArray<T>) => T): T', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: boolean = false;
      let someCb = (value: number, index: int, array: SparseArray<number>): boolean => {
        return value > 3;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.some(someCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'some',
        'some(predicate: (value: T, index: int, array: SparseArray<T>) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: boolean = false;
      let everyCb = (value: number, index: int, array: SparseArray<number>): boolean => {
        return value > 0;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.every(everyCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'every',
        'every(predicate: (value: T, index: int, array: SparseArray<T>) => boolean): boolean', arkTsAveragedTime);
    })

    // flat, flatMap
    it('PerformanceTest_SparseArray_Instance_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.flat<number>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'flat',
        'flat<U = T>(): SparseArray<U>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let flatMapCb = (v: number, k: int, arr: SparseArray<number>): number => {
        return v * 2;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.flatMap<number>(flatMapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'flatMap',
        'flatMap<U>(fn: (v: T, k: int, arr: SparseArray<T>) => U): SparseArray<U>', arkTsAveragedTime);
    })

    // Iterator methods
    it('PerformanceTest_SparseArray_Instance_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: IterableIterator<number> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res = sparseArr.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res = sparseArr.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'entries',
        'entries(): IterableIterator<[int, T]>', arkTsAveragedTime);
    })

    // at, find, findIndex
    it('PerformanceTest_SparseArray_Instance_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: number | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.at(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'at',
        'at(index: int): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: number | undefined;
      let findCb = (value: number, index: int, array: SparseArray<number>): boolean => {
        return value > 3;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.find(findCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'find',
        'find(predicate: (value: T, index: int, array: SparseArray<T>) => boolean): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: int = 0;
      let findIndexCb = (value: number, index: int, array: SparseArray<number>): boolean => {
        return value > 3;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.findIndex(findIndexCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'findIndex',
        'findIndex(predicate: (value: T, index: int, array: SparseArray<T>) => boolean): int', arkTsAveragedTime);
    })

    // includes, indexOf, lastIndexOf
    it('PerformanceTest_SparseArray_Instance_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.includes(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'includes',
        'includes(val: T, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.indexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'indexOf',
        'indexOf(val: T, fromIndex: int = 0): int', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.lastIndexOf(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'lastIndexOf',
        'lastIndexOf(searchElement: T, fromIndex?: int): int', arkTsAveragedTime);
    })

    // Property and accessor methods
    it('PerformanceTest_SparseArray_Property_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Property_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Property_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sparseArr.length = 10;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = sparseArr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Property_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'length',
        'set length(newLen: int): void', arkTsAveragedTime);
    })

    // toReversed, toSorted
    it('PerformanceTest_SparseArray_Instance_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(1, 2, 3, 4, 5);
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.toReversed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'toReversed',
        'toReversed(): SparseArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_SparseArray_Instance_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sparseArr = new SparseArray<number>(5, 3, 1, 4, 2);
      let res: SparseArray<number> = new SparseArray<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sparseArr.toSorted();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SparseArray_Instance_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SparseArray', 'toSorted',
        'toSorted(): SparseArray<T>', arkTsAveragedTime);
    })

  })
}
