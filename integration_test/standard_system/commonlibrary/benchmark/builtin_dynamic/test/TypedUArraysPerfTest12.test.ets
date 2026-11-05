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

export default function TypedUArraysPerfTest12(): void {
  describe('TypedUArraysPerfTest12', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint32Array_includes_int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.includes(3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.includes(3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array includes_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(number): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_includes_number_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.includes(3 as number, 0 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.includes(3 as number, 0 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array includes_number: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'includes', 'includes(number, number): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_indexOf_int_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.indexOf(3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.indexOf(3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array indexOf_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_indexOf_number_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.indexOf(3 as number, 0 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.indexOf(3 as number, 0 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array indexOf_number: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'indexOf', 'indexOf(number, number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_lastIndexOf_int_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.lastIndexOf(3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.lastIndexOf(3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(number): number', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Uint32Array_lastIndexOf_number_int_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.lastIndexOf(3 as number, 4 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.lastIndexOf(3 as number, 4 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array lastIndexOf_number_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'lastIndexOf', 'lastIndexOf(number, number | undefined): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_of_FixedArrayNumber_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Uint32Array = Uint32Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = Uint32Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'of', 'of(FixedArray<number>): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_slice_int_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: Uint32Array = arr.slice(2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.slice(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array slice_int: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'slice', 'slice(number): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_sort_compareFn_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let originalData: number[] = [5, 2, 3, 1, 4];
        let arr: Uint32Array = new Uint32Array(originalData);
        let result: Uint32Array = arr.sort((a: number, b: number): number => a - b);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.sort((a: number, b: number): number => a - b);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array sort_compareFn: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'sort', 'sort(number, number): => number): this', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_some_Uint32Array_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.some((v: number, i: number, a: Uint32Array): boolean => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.some((v: number, i: number, a: Uint32Array): boolean => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array some_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'some', 'some(number, number, Uint32Array): => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_reduce_Uint32Array_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array): number => previousValue + currentValue, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array reduce_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduce', 'reduce(number, number, number, Uint32Array): => number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_reduceRight_Uint32Array_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array): number => {
          return previousValue + currentValue;
        }, 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: Uint32Array): number => previousValue + currentValue, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array reduceRight_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'reduceRight', 'reduceRight(number, number, number, Uint32Array): => number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_map_Uint32Array_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: Uint32Array = arr.map((v: number, i: number, a: Uint32Array): number => v * 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.map((v: number, i: number, a: Uint32Array): number => v * 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array map_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'map', 'map(number, number, Uint32Array): => number): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_every_Uint32Array_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: boolean = arr.every((v: number, i: number, a: Uint32Array): boolean => v >= 0);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.every((v: number, i: number, a: Uint32Array): boolean => v >= 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array every_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'every', 'every(number, number, Uint32Array): => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_filter_Uint32Array_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: Uint32Array = arr.filter((v: number, i: number, a: Uint32Array): boolean => v > 2);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.filter((v: number, i: number, a: Uint32Array): boolean => v > 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array filter_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'filter', 'filter(number, number, Uint32Array): => boolean): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_find_Uint32Array_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number | undefined = arr.find((v: number, i: number, a: Uint32Array): boolean => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.find((v: number, i: number, a: Uint32Array): boolean => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array find_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'find', 'find(number, number, Uint32Array): => boolean): number | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_findIndex_Uint32Array_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = arr.findIndex((v: number, i: number, a: Uint32Array): boolean => v > 3);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.findIndex((v: number, i: number, a: Uint32Array): boolean => v > 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array findIndex_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findIndex', 'findIndex(number, number, Uint32Array): => boolean): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_forEach_Uint32Array_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let result: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.forEach((v: number, i: number, a: Uint32Array): void => { result = v; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array forEach_Uint32Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'forEach', 'forEach(number, number, Uint32Array): => void): void', arkTsAveragedTime);
      done();
      })
  })
}
