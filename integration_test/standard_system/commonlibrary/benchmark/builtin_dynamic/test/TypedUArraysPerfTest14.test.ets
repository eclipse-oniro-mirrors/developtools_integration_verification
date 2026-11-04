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

export default function TypedUArraysPerfTest14(): void {
  describe('TypedUArraysPerfTest14', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BigUint64Array_from_FixedArrayInt_iter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let srcArr: bigint[] = [1n, 2n, 3n, 4n, 5n];
      let result: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_FixedArrayInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(FixedArray<BigInt>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_from_SetInt_iter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let src: Set<bigint> = new Set<bigint>([1n, 2n, 3n, 4n, 5n]);
      let srcArr: bigint[] = Array.from(src);
      let result: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_SetInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Set<BigInt>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_from_Uint32Array_iter_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_Uint32Array_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(BigUint64Array): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_from_ArrayInt_iter_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let srcArr: bigint[] = [1n, 2n, 3n, 4n, 5n];
      let result: BigUint64Array = BigUint64Array.from(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_ArrayInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Array<BigInt>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_from_IterableCB_iter_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let mapFn = (v: bigint): bigint => v * 2n;
      let result: BigUint64Array = BigUint64Array.from(srcArr, mapFn);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr, mapFn);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_IterableCB_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Iterable<BigInt>, (BigInt) => BigInt): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_of_empty_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let result: BigUint64Array = BigUint64Array.of();
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayInt_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let result: BigUint64Array = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<int>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayLong_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let result: BigUint64Array = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<BigInt>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayNumber_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let result: BigUint64Array = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<number>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_includes_long_iter_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.includes(3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array includes_long_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'includes', 'includes(BigInt): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_includes_long_int_iter_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.includes(3n, 0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3n, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array includes_long_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'includes', 'includes(BigInt, int): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_indexOf_BigInt_iter_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: number = arr.indexOf(3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array indexOf_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'indexOf', 'indexOf(BigInt): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_indexOf_BigInt_int_iter_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: number = arr.indexOf(3n, 0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3n, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array indexOf_BigInt_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'indexOf', 'indexOf(BigInt, int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_lastIndexOf_BigInt_iter_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: number = arr.lastIndexOf(3n);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3n);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(BigInt): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_lastIndexOf_BigInt_int_iter_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: number = arr.lastIndexOf(3n, 4);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3n, 4);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf_BigInt_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(BigInt, int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_slice_int_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = arr.slice(2);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.slice(2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'slice', 'slice(int): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_sort_compareFn_iter_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let originalData: bigint[] = [5n, 2n, 3n, 1n, 4n];
      let arr: BigUint64Array = new BigUint64Array(originalData);
      let result: BigUint64Array = arr.sort((a: bigint, b: bigint): number => a >= b ? (a > b ? 1 : 0) : -1);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = arr.sort((a: bigint, b: bigint): number => a >= b ? (a > b ? 1 : 0) : -1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array sort_compareFn_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'sort', 'sort(BigInt, BigInt): => int | BigInt): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_with_BigInt_iter_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let copy = arr.slice(); copy[2] = 10n; let result: BigUint64Array = copy;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        let copy2 = arr.slice(); copy2[2] = 10n; result = copy2;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: BigUint64Array = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array with_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'with', 'with(int, BigInt): BigUint64Array', arkTsAveragedTime);
;
      done();
    })

  })
}