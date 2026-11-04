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

export default function TypedUArraysPerfTest15(): void {
  describe('TypedUArraysPerfTest15', () => {
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

    // ==================== BigUint64Array 回调方法 ====================

    it('PerformanceTest_BigUint64Array_some_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.some((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array some_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'some', 'some(BigInt, int, BigUint64Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_reduce_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigInt = arr.reduce((previousValue: BigInt, currentValue: BigInt, currentIndex: int, array: BigUint64Array): BigInt => {
        return previousValue + currentValue;
      }, 0n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((previousValue: BigInt, currentValue: BigInt, currentIndex: int, array: BigUint64Array): BigInt => previousValue + currentValue, 0n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduce_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduce', 'reduce(BigInt, BigInt, int, BigUint64Array): => BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_reduceRight_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: BigInt = arr.reduceRight((previousValue: BigInt, currentValue: BigInt, currentIndex: int, array: BigUint64Array): BigInt => {
        return previousValue + currentValue;
      }, 0n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((previousValue: BigInt, currentValue: BigInt, currentIndex: int, array: BigUint64Array): BigInt => previousValue + currentValue, 0n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array reduceRight_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'reduceRight', 'reduceRight(BigInt, BigInt, int, BigUint64Array): => BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_map_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.map((v: BigInt, i: int, a: BigUint64Array): BigInt => v * 2n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((v: BigInt, i: int, a: BigUint64Array): BigInt => v * 2n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array map_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'map', 'map(BigInt, int, BigUint64Array): => BigInt): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_every_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = arr.every((v: BigInt, i: int, a: BigUint64Array): boolean => v >= 0n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((v: BigInt, i: int, a: BigUint64Array): boolean => v >= 0n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array every_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'every', 'every(BigInt, int, BigUint64Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_filter_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter((v: BigInt, i: int, a: BigUint64Array): boolean => v > 2n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((v: BigInt, i: int, a: BigUint64Array): boolean => v > 2n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array filter_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'filter', 'filter(BigInt, int, BigUint64Array): => boolean): BigUint64Array', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_find_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.find((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array find_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'find', 'find(BigInt, int, BigUint64Array): => boolean): BigInt | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findIndex_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.findIndex((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findIndex_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findIndex', 'findIndex(BigInt, int, BigUint64Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findLast_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.findLast((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findLast_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLast', 'findLast(BigInt, int, BigUint64Array): => boolean): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findLastIndex_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = arr.findLastIndex((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((v: BigInt, i: int, a: BigUint64Array): boolean => v > 3n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findLastIndex_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLastIndex', 'findLastIndex(BigInt, int, BigUint64Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_forEach_BigUint64Array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((v: BigInt, i: int, a: BigUint64Array): void => { let x = v; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array forEach_BigUint64Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'forEach', 'forEach(BigInt, int, BigUint64Array): => void): void', arkTsAveragedTime);
    })
  })
}
