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

export default function ArrayPerfTest(): void {
  describe('ArrayPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Array_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor',
          'function constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<number>(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor',
          'function constructor(arrayLen: int)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<number>(1, 2, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor',
          'function constructor(first: T, ...d: T[])', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = false;
        let comp = [1, 2, 3];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Array.isArray(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Static_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'isArray',
          'static isArray(o: Any): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Array.of<number>(1, 2, 3, 4, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Static_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'of',
          'static of<T>(...values: T[]): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(10);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.fill(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Static_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'fill',
          'fill(value: T, start?: int, end?: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>();
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Array.from<number>(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Static_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'from',
          'static from<T>(arr: ArrayLike<T>): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'length',
          'get length(): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.push(999);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let resVal = res;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'push', 'push(...items: number[]): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(BASE_COUNT + 10);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i;
        }

        let res: number | undefined = arr.pop();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.pop();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let resVal = res;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'pop', 'pop(): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(BASE_COUNT + 10);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i;
        }
        let res: number | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.shift();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let resVal = res;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'shift', 'shift(): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrs: Array<Array<number>> = new Array<Array<number>>(BASE_COUNT + 10);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrs[i] = new Array<number>(100).fill(0);
        }
        let res = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrs[i].splice(1, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'splice',
          'splice(start: int, delete?: int | undefined, ...items: T[]): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.unshift(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'unshift',
          'unshift(...values: T[]): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'slice',
          'slice(start: int): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice(50, 80);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_0160: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'slice',
          'slice(start: int, end?: int): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: Array<number> = new Array<number>();
        let comp = arr.concat([1, 2, 3]);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.concat(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'concat',
          'concat(...items: FixedArray<ConcatArray<T>>): Array<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.copyWithin(0, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
          'copyWithin(target: int, start: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number | undefined = arr[0];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr[0];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'indexAccess',
          'index access: arr[0]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: Array<number> = new Array<number>();
        let comp = (v: number, i: number, a: Array<number>): boolean => { return v > 50; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.filter(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'filter',
          'filter(predicate: (value: T, index: int, array: Array<T>) => boolean): Array<T>', arkTsAveragedTime);
      done();
      })

it('PerformanceTest_Array_Instance_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<Array<number>> = new Array<Array<number>>();
        for (let i = 0; i < 10; i++) {
          arr.push(new Array<number>(10));
        }
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.flat();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'flat',
          'flat<U = T>(): Array<U>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: Array<number> = new Array<number>();
        let comp = (v: number, k: number, arr: Array<number>): Array<number> => { return [v]; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.flatMap<number>(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'flatMap',
          'flatMap<U = T>(fn: (v: T, k: int, arr: Array<T>) => U | ReadonlyArray<U>): Array<U>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number | undefined = undefined;
        let comp = (v: number, i: number, a: Array<number>): boolean => { return v > 50; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.find(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'find',
          'find(predicate: (value: T, index: int, array: Array<T>) => boolean): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number = 0;
        let comp = (v: number, i: number, a: Array<number>): boolean => { return v > 50; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.findIndex(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'findIndex',
          'findIndex(predicate: (value: T, index: int, array: Array<T>) => int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: boolean = false;
        let comp = (v: number, i: number, a: Array<number>): boolean => { return v >= 0; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.every(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'every',
          'every(predicate: (value: T, index: int, array: Array<T>) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: boolean = false;
        let comp = (v: number, i: number, a: Array<number>): boolean => { return v > 50; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.some(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'some',
          'some(predicate: (value: T, index: int, array: Array<T>) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number = 0;
        let comp = (prev: number, curr: number, index: number, array: Array<number>): number => { return prev + curr; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduce<number>(comp, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_2900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
          'reduce<U = T>(callbackfn: (previousValue: U, currentValue: T, index: int, array: Array<T>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number = 0;
        let comp = (prev: number, curr: number, index: number, array: Array<number>): number => { return prev + curr; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reduceRight<number>(comp, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduceRight',
          'reduceRight<U>(callbackfn: (previousValue: U, currentValue: T, index: int, array: Array<T>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let count: number = 0;
        let comp = (v: number, i: number, a: Array<number>): void => { count += v; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'forEach',
          'forEach(callbackfn: (value: T, index: int, array: Array<T>) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: IterableIterator<number> = arr.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'keys',
          'keys(): IterableIterator<int>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: IterableIterator<number> = arr.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'values',
          'values(): IterableIterator<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.sort((a: number, b: number): number => { return a > b ? 1 : a < b ? -1 : 0; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(comparator?: (a: T, b: T) => int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        arr.length = 200;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.fill(0, 100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'lengthAndFill',
          'length = 200; fill(0, 100)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(BASE_COUNT);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.length = BASE_COUNT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arr;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'length',
          'set length(value: int)', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Array_Instance_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.copyWithin(0, 10, 50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
          'copyWithin(target: int, start: int, end?: int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.lastIndexOf(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'lastIndexOf',
          'lastIndexOf(searchElement: T): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.indexOf(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_3900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'indexOf',
          'indexOf(searchElement: T): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.includes(50);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_4000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'includes',
          'includes(searchElement: T): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: string = '';
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.join(',');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_4100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'join',
          'join(separator?: String): String', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: Array<number> = new Array<number>();
        let comp = (v: number, i: number, arr: Array<number>): number => { return v * 2; };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.map<number>(comp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_4200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'map',
          'map<U>(callbackfn: (value: T, index: int, array: Array<T>) => U): Array<U>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Array_Instance_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = new Array<number>(100).fill(0);
        let res: Array<number> = new Array<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Array_Instance_4300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reverse',
          'reverse(): this', arkTsAveragedTime);
      done();
      })
  })
}
