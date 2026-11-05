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

export default function TypedArraysPerfTest06(): void {
  describe('TypedArraysPerfTest06', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 50000;
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

    // ==================== Int8Array from(Set<int>) & from(Array<int>) 测试 ====================

    it('PerformanceTest_Int8Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Int8Array = Int8Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from', 'from(Set<int>): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Int8Array = Int8Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from', 'from(Array<int>): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int16Array from(Set<int>) & from(Array<int>) 测试 ====================

    it('PerformanceTest_Int16Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Int16Array = Int16Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(Set<int>): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Int16Array = Int16Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int16Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(Array<int>): Int16Array', arkTsAveragedTime);
    })

    // ==================== Int32Array from(Set<int>) & from(Array<int>) 测试 ====================

    it('PerformanceTest_Int32Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Int32Array = Int32Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from', 'from(Set<int>): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Int32Array = Int32Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int32Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from', 'from(Array<int>): Int32Array', arkTsAveragedTime);
    })

    // ==================== Float32Array from(Set<number>) & from(Array<number>) 测试 ====================

    it('PerformanceTest_Float32Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<number> = new Set<number>([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float32Array = Float32Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from', 'from(Set<number>): Float32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let res: Float32Array = Float32Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float32Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from', 'from(Array<number>): Float32Array', arkTsAveragedTime);
    })

    // ==================== Float64Array from(Set<number>) & from(Array<number>) 测试 ====================

    it('PerformanceTest_Float64Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<number> = new Set<number>([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res: Float64Array = Float64Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from', 'from(Set<number>): Float64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let res: Float64Array = Float64Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float64Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from', 'from(Array<number>): Float64Array', arkTsAveragedTime);
    })

    /* 与TypedArraysPerfTest09重复，已注释
    // ==================== BigInt64Array from(Set<BigInt>) & from(Array<BigInt>) 测试 ====================

    it('PerformanceTest_BigInt64Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<BigInt> = new Set<BigInt>([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigInt64Array = BigInt64Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from(Set<BigInt>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Set<BigInt>): BigInt64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<BigInt> = [BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)];
      let res: BigInt64Array = BigInt64Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt64Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array from(Array<BigInt>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Array<BigInt>): BigInt64Array', arkTsAveragedTime);
    })
    */
  })
}
