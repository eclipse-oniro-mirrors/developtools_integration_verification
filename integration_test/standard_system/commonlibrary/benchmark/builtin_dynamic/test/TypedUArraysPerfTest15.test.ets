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

export default function TypedUArraysPerfTest15(): void {
  describe('TypedUArraysPerfTest15', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BigUint64Array_some_BigUint64Array_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.some((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array some_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'some', 'some(BigInt, int, BigUint64Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_reduce_BigUint64Array_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: bigint = arr.reduce((previousValue: bigint, currentValue: bigint, currentIndex: number, array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: bigint, currentValue: bigint, currentIndex: number, array: BigUint64Array): bigint => previousValue + currentValue, 0n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: bigint = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduce_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduce', 'reduce(BigInt, BigInt, int, BigUint64Array): => BigInt): BigInt', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_reduceRight_BigUint64Array_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: bigint = arr.reduceRight((previousValue: bigint, currentValue: bigint, currentIndex: number, array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: bigint, currentValue: bigint, currentIndex: number, array: BigUint64Array): bigint => previousValue + currentValue, 0n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: bigint = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduceRight_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduceRight', 'reduceRight(BigInt, BigInt, int, BigUint64Array): => BigInt): BigInt', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_map_BigUint64Array_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = arr.map((v: bigint, i: number, a: BigUint64Array): bigint => v * 2n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: bigint, i: number, a: BigUint64Array): bigint => v * 2n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array map_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'map', 'map(BigInt, int, BigUint64Array): => BigInt): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_every_BigUint64Array_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.every((v: bigint, i: number, a: BigUint64Array): boolean => v >= 0n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: bigint, i: number, a: BigUint64Array): boolean => v >= 0n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array every_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'every', 'every(BigInt, int, BigUint64Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_filter_BigUint64Array_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = arr.filter((v: bigint, i: number, a: BigUint64Array): boolean => v > 2n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: bigint, i: number, a: BigUint64Array): boolean => v > 2n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array filter_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'filter', 'filter(BigInt, int, BigUint64Array): => boolean): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_find_BigUint64Array_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: bigint | undefined = arr.find((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: bigint | undefined = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array find_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'find', 'find(BigInt, int, BigUint64Array): => boolean): BigInt | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_findIndex_BigUint64Array_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: number = arr.findIndex((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: bigint, i: number, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findIndex_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findIndex', 'findIndex(BigInt, int, BigUint64Array): => boolean): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_findLast_BigUint64Array_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let findLastValue = (): bigint | undefined => {
        for (let j: number = arr.length - 1; j >= 0; j--) {
          if (arr[j] > 3n) {
            return arr[j];
          }
        }
        return undefined;
      };
      let result: bigint | undefined = findLastValue();
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = findLastValue();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: bigint | undefined = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findLast_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLast', 'findLast(BigInt, int, BigUint64Array): => boolean): BigInt', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_findLastIndex_BigUint64Array_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let findLastIndexValue = (): number => {
        for (let j: number = arr.length - 1; j >= 0; j--) {
          if (arr[j] > 3n) {
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
      console.info('arkTsPerformanceTest BigUint64Array findLastIndex_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLastIndex', 'findLastIndex(BigInt, int, BigUint64Array): => boolean): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_forEach_BigUint64Array_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: bigint, i: number, a: BigUint64Array): void => { let x = v; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array forEach_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'forEach', 'forEach(BigInt, int, BigUint64Array): => void): void', arkTsAveragedTime);
      done();
    })
  })
}