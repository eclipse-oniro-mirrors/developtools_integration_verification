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

export default function TypedUArraysPerfTest14(): void {
  describe('TypedUArraysPerfTest14', () => {
    const BASE_COUNT = 50000;
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

    it('PerformanceTest_BigUint64Array_from_FixedArrayInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n] as FixedArray<BigInt>;
      let result = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_FixedArrayInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(FixedArray<BigInt>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_from_SetInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Set<BigInt> = new Set<BigInt>([1n, 2n, 3n, 4n, 5n]);
      let result = BigUint64Array.from(src);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_SetInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Set<BigInt>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_from_Uint32Array_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_Uint32Array_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(BigUint64Array): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_from_ArrayInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: Array<BigInt> = [1n, 2n, 3n, 4n, 5n];
      let result = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_ArrayInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Array<BigInt>): BigUint64Array', arkTsAveragedTime);
    })

    // 与 from_Uint32Array_iter 重复，注释排除
    /* it('PerformanceTest_BigUint64Array_from_ArrayLike_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_ArrayLike_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(ArrayLike<BigInt>): BigUint64Array', arkTsAveragedTime);
    }) */

    it('PerformanceTest_BigUint64Array_from_IterableCB_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = BigUint64Array.from(srcArr, (v: BigInt) => v * 2n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr, (v: BigInt) => v * 2n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_IterableCB_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Iterable<BigInt>, (BigInt) => BigInt): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_of_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = BigUint64Array.of();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = BigUint64Array.of(1 as int, 2 as int, 3 as int, 4 as int, 5 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1 as int, 2 as int, 3 as int, 4 as int, 5 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<int>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<BigInt>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_of_FixedArrayNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = BigUint64Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.of(1 as number, 2 as number, 3 as number, 4 as number, 5 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array of_FixedArrayNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'of', 'of(FixedArray<number>): BigUint64Array', arkTsAveragedTime);
    })

    // 与 from_FixedArrayInt_iter 重复，注释排除
    /* it('PerformanceTest_BigUint64Array_from_FixedArrayBigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n];
      let result = BigUint64Array.from(srcArr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_FixedArrayBigInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(FixedArray<BigInt>): BigUint64Array', arkTsAveragedTime);
    }) */


    // 与 from_IterableCB_iter 重复，注释排除
    /* it('PerformanceTest_BigUint64Array_from_IterableBigIntCB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcArr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = BigUint64Array.from(srcArr, (v: BigInt) => v * 2n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = BigUint64Array.from(srcArr, (v: BigInt) => v * 2n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from_IterableBigIntCB: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Iterable<BigInt>, BigInt, number): => BigInt): BigUint64Array', arkTsAveragedTime);
    }) */

    it('PerformanceTest_BigUint64Array_includes_long_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.includes(3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array includes_long_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'includes', 'includes(BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_includes_long_int_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.includes(3n, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.includes(3n, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array includes_long_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'includes', 'includes(BigInt, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_indexOf_BigInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.indexOf(3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array indexOf_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'indexOf', 'indexOf(BigInt): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_indexOf_BigInt_int_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.indexOf(3n, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.indexOf(3n, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array indexOf_BigInt_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'indexOf', 'indexOf(BigInt, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_lastIndexOf_BigInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.lastIndexOf(3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(BigInt): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_lastIndexOf_BigInt_int_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.lastIndexOf(3n, 4 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3n, 4 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf_BigInt_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(BigInt, int): int', arkTsAveragedTime);
    })

    // 与 lastIndexOf_BigInt_int_iter 重复，注释排除
    /* it('PerformanceTest_BigUint64Array_lastIndexOf_number_int_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.lastIndexOf(3n, 4 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.lastIndexOf(3n, 4 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array lastIndexOf_number_int_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'lastIndexOf', 'lastIndexOf(BigInt, int | undefined): int', arkTsAveragedTime);
    }) */

    it('PerformanceTest_BigUint64Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = arr.slice(2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.slice(2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'slice', 'slice(int): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_sort_compareFn_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let originalData: BigInt[] = [5n, 2n, 3n, 1n, 4n];
      let arr: BigUint64Array = new BigUint64Array(originalData);
      let result: BigUint64Array = arr.sort((a: BigInt, b: BigInt) => (a >= b ? (a > b ? 1 : 0) : -1) as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.sort((a: BigInt, b: BigInt) => (a >= b ? (a > b ? 1 : 0) : -1) as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array sort_compareFn_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'sort', 'sort(BigInt, BigInt): => int | BigInt): this', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_with_BigInt_iter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigUint64Array = arr.with(2, 10n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.with(2, 10n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array with_BigInt_iter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'with', 'with(int, BigInt): BigUint64Array', arkTsAveragedTime);
    })

  })
}
