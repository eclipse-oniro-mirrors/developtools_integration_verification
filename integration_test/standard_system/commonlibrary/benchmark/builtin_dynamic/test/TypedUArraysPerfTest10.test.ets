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

export default function TypedUArraysPerfTest10(): void {
  describe('TypedUArraysPerfTest10', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint16Array_from_FixedArrayInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: number[] = [1, 2, 3, 4, 5];
        let result: Uint16Array = Uint16Array.from(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint16Array.from(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array from_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(FixedArray<int>): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_from_Int16Array_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let result: Uint16Array = Uint16Array.from(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint16Array.from(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array from_Int16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Int16Array): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_from_ArrayLike_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: Uint16Array = Uint16Array.from(srcArr);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint16Array.from(srcArr);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array from_ArrayLike: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(ArrayLike<number>): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_from_IterableCB_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: Uint16Array = Uint16Array.from(srcArr, (v: number) => v * 2);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Uint16Array.from(srcArr, (v: number) => v * 2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array from_IterableCB: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Iterable<number>, number, number): => number): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_sort_compareFn_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([5, 2, 3, 1, 4]);
        let result: Uint16Array = arr.sort((a: number, b: number) => a - b);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.sort((a: number, b: number) => a - b);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array sort_compareFn: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'sort', 'sort(number, number): => int): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_some_Uint16Array_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.some((v: number, i: number, a: Uint16Array): boolean => v > 3);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.some((v: number, i: number, a: Uint16Array): boolean => v > 3);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array some_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'some', 'some(number, int, Uint16Array): => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_reduce_Uint16Array_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => previousValue + currentValue, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array reduce_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduce', 'reduce(number, number, int, Uint16Array): => number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_reduceRight_Uint16Array_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint16Array): number => previousValue + currentValue, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array reduceRight_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'reduceRight', 'reduceRight(number, number, int, Uint16Array): => number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_map_Uint16Array_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: Uint16Array = arr.map((v: number, i: number, a: Uint16Array): number => v * 2);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.map((v: number, i: number, a: Uint16Array): number => v * 2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array map_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'map', 'map(number, int, Uint16Array): => number): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_every_Uint16Array_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.every((v: number, i: number, a: Uint16Array): boolean => v >= 0);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.every((v: number, i: number, a: Uint16Array): boolean => v >= 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array every_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'every', 'every(number, int, Uint16Array): => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_filter_Uint16Array_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: Uint16Array = arr.filter((v: number, i: number, a: Uint16Array): boolean => v > 2);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.filter((v: number, i: number, a: Uint16Array): boolean => v > 2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array filter_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'filter', 'filter(number, int, Uint16Array): => boolean): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_find_Uint16Array_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: number | undefined = arr.find((v: number, i: number, a: Uint16Array): boolean => v > 3);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.find((v: number, i: number, a: Uint16Array): boolean => v > 3);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number | undefined = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array find_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'find', 'find(number, int, Uint16Array): => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_findIndex_Uint16Array_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let result: number = arr.findIndex((v: number, i: number, a: Uint16Array): boolean => v > 3);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = arr.findIndex((v: number, i: number, a: Uint16Array): boolean => v > 3);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array findIndex_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findIndex', 'findIndex(number, int, Uint16Array): => boolean): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_findLast_Uint16Array_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let findLastValue = (): number | undefined => {
          for (let j: number = arr.length - 1; j >= 0; j--) {
            if (arr[j] > 3) {
              return arr[j];
            }
          }
          return undefined;
        };
        let result: number | undefined = findLastValue();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = findLastValue();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number | undefined = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array findLast_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLast', 'findLast(number, int, Uint16Array): => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_findLastIndex_Uint16Array_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let findLastIndexValue = (): number => {
          for (let j: number = arr.length - 1; j >= 0; j--) {
            if (arr[j] > 3) {
              return j;
            }
          }
          return -1;
        };
        let result: number = findLastIndexValue();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = findLastIndexValue();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array findLastIndex_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLastIndex', 'findLastIndex(number, int, Uint16Array): => boolean): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_forEach_Uint16Array_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          arr.forEach((v: number, i: number, a: Uint16Array): void => { let x: number = v; });
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Uint16Array = arr;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array forEach_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'forEach', 'forEach(number, int, Uint16Array): => void): void', arkTsAveragedTime);
      done();
      })
  })
}