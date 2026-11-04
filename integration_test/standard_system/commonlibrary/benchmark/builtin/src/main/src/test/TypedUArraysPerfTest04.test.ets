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

export default function TypedUArraysPerfTest04(): void {
  describe('TypedUArraysPerfTest04', () => {
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

    // ==================== Uint8ClampedArray 补充测试 ====================

    it('PerformanceTest_Uint8ClampedArray_toLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let res: string = arr.toLocaleString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let res: number | undefined = arr.findLast((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findLast', 'findLast(predicate: (v, i, arr) => boolean): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let res: int = arr.findLastIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'findLastIndex', 'findLastIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8ClampedArray_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let res: Uint8ClampedArray = arr.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8ClampedArray valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'valueOf', 'valueOf(): Uint8ClampedArray', arkTsAveragedTime);
    })

    // ==================== Uint8Array 补充测试 ====================

    it('PerformanceTest_Uint8Array_toLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res: string = arr.toLocaleString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res: number | undefined = arr.findLast((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findLast', 'findLast(predicate: (v, i, arr) => boolean): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res: int = arr.findLastIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'findLastIndex', 'findLastIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint8Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let res: Uint8Array = arr.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint8Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'valueOf', 'valueOf(): Uint8Array', arkTsAveragedTime);
    })

    // ==================== Uint16Array 补充测试 ====================

    it('PerformanceTest_Uint16Array_toLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let res: string = arr.toLocaleString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let res: number | undefined = arr.findLast((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLast', 'findLast(predicate: (v, i, arr) => boolean): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let res: int = arr.findLastIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'findLastIndex', 'findLastIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint16Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let res: Uint16Array = arr.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint16Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'valueOf', 'valueOf(): Uint16Array', arkTsAveragedTime);
    })

    // ==================== Uint32Array 补充测试 ====================

    it('PerformanceTest_Uint32Array_toLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: string = arr.toLocaleString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: number | undefined = arr.findLast((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findLast', 'findLast(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: int = arr.findLastIndex((v) => v > 3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((v) => v > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'findLastIndex', 'findLastIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Uint32Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      let res: Uint32Array = arr.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Uint32Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'valueOf', 'valueOf(): Uint32Array', arkTsAveragedTime);
    })

    // ==================== BigUint64Array 补充测试 ====================

    it('PerformanceTest_BigUint64Array_toLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: string = arr.toLocaleString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: bigint | undefined = arr.findLast((v) => v > BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLast((v) => v > BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLast', 'findLast(predicate: (v, i, arr) => boolean): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: int = arr.findLastIndex((v) => v > BigInt(3));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findLastIndex((v) => v > BigInt(3));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'findLastIndex', 'findLastIndex(predicate: (v, i, arr) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigUint64Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: BigUint64Array = arr.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigUint64Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'valueOf', 'valueOf(): BigUint64Array', arkTsAveragedTime);
    })
  })
}
