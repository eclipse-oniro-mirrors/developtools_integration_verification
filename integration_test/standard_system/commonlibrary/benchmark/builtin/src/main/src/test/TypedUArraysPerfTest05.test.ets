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

export default function TypedUArraysPerfTest05(): void {
  describe('TypedUArraysPerfTest05', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 500;
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

    // ==================== Uint8Array from(Set) & from(Array) 测试 ====================

    it('PerformanceTest_Uint8Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Uint8Array = Uint8Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint8Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(Set<int>): Uint8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Uint8Array = Uint8Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint8Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(Array<int>): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint16Array from(Set) & from(Array) 测试 ====================

    it('PerformanceTest_Uint16Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Uint16Array = Uint16Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint16Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Set<int>): Uint16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Uint16Array = Uint16Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint16Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Array<int>): Uint16Array', arkTsAveragedTime);
    })

    // ==================== Uint32Array from(Set) & from(Array) 测试 ====================

    it('PerformanceTest_Uint32Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Uint32Array = Uint32Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'from(Set<int>): Uint32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Uint32Array = Uint32Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'from(Array<int>): Uint32Array', arkTsAveragedTime);
    })

    // ==================== Uint8ClampedArray from(Set) & from(Array) 测试 ====================

    it('PerformanceTest_Uint8ClampedArray_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      let res: Uint8ClampedArray = Uint8ClampedArray.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint8ClampedArray.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray from(Set<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(Set<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let res: Uint8ClampedArray = Uint8ClampedArray.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Uint8ClampedArray.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray from(Array<int>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(Array<int>): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== BigUint64Array from(Set<BigInt>) & from(Array<BigInt>) 测试 ====================

    it('PerformanceTest_BigUint64Array_from_Set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<BigInt> = new Set<BigInt>([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = BigUint64Array.from(set);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from(set);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from(Set<BigInt>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Set<BigInt>): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_from_Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<BigInt> = [BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)];
      let res: BigUint64Array = BigUint64Array.from(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array from(Array<BigInt>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(Array<BigInt>): BigUint64Array', arkTsAveragedTime);
    })
  })
}
