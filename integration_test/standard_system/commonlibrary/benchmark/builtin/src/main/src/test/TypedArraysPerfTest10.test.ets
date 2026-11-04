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

export default function TypedArraysPerfTest10(): void {
  describe('TypedArraysPerfTest10', () => {
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

    // ==================== Int8Array includes/indexOf/lastIndexOf/slice 补充重载 ====================

    it('PerformanceTest_Int8Array_includes_byte_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let res = arr.includes(3 as byte, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3 as byte, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array includes_byte_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'includes', 'includes(byte, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_includes_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let res = arr.includes(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array includes_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let res = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_indexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let res = arr.indexOf(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array indexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 3 as byte]);
      let res = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 3 as byte]);
      let res = arr.lastIndexOf(3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_lastIndexOf_number_undef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 3 as byte]);
      let opt: int | undefined = 2 as int | undefined;
      let res = arr.lastIndexOf(3 as number, opt);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as number, opt);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array lastIndexOf_number_undef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let res = arr.slice(1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'slice', 'slice(int): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int16Array includes/indexOf/lastIndexOf/slice 补充重载 ====================

    it('PerformanceTest_Int16Array_includes_short', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let shortVal = new Short(3);
      let res = arr.includes(shortVal);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(shortVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array includes_short: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'includes', 'includes(short): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_includes_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let res = arr.includes(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array includes_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let res = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_indexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let res = arr.indexOf(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array indexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'indexOf', 'indexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_indexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let res = arr.indexOf(3 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array indexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 3]);
      let res = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 3]);
      let res = arr.lastIndexOf(3 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_lastIndexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 3]);
      let res = arr.lastIndexOf(3 as int, 2 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int, 2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array lastIndexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'lastIndexOf', 'lastIndexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_lastIndexOf_number_undef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 3]);
      let opt: int | undefined = 2 as int | undefined;
      let res = arr.lastIndexOf(3 as number, opt);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as number, opt);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array lastIndexOf_number_undef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let res = arr.slice(1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'slice', 'slice(int): Int16Array', arkTsAveragedTime);
    })

    // ==================== BigInt64Array includes/indexOf/lastIndexOf/slice 补充重载 ====================

    it('PerformanceTest_BigInt64Array_includes_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.includes(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array includes_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'includes', 'includes(int, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_includes_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.includes(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array includes_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'includes', 'includes(int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_includes_bigint_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.includes(BigInt(3) as bigint, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(BigInt(3) as bigint, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array includes_bigint_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'includes', 'includes(bigint, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_indexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.indexOf(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array indexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'indexOf', 'indexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_indexOf_bigint_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.indexOf(BigInt(3) as bigint, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(BigInt(3) as bigint, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array indexOf_bigint_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'indexOf', 'indexOf(bigint, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(3)]);
      let res = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_lastIndexOf_bigint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(3)]);
      let res = arr.lastIndexOf(BigInt(3) as bigint);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(BigInt(3) as bigint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array lastIndexOf_bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'lastIndexOf', 'lastIndexOf(bigint): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_lastIndexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(3)]);
      let res = arr.lastIndexOf(3 as int, 2 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int, 2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array lastIndexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'lastIndexOf', 'lastIndexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_lastIndexOf_bigint_undef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(3)]);
      let opt: int | undefined = 2 as int | undefined;
      let res = arr.lastIndexOf(BigInt(3) as bigint, opt);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(BigInt(3) as bigint, opt);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array lastIndexOf_bigint_undef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'lastIndexOf', 'lastIndexOf(bigint, int | undefined): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt64Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res = arr.slice(1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'slice', 'slice(int): BigInt64Array', arkTsAveragedTime);
    })

    // ==================== Float32Array includes/indexOf/lastIndexOf/slice 补充重载 ====================

    it('PerformanceTest_Float32Array_includes_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.includes(3.0 as float);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3.0 as float);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array includes_float: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'includes', 'includes(float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_includes_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.includes(3.0 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3.0 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array includes_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_indexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array indexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'indexOf', 'indexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_indexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3.0 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3.0 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array indexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3.0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_lastIndexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3 as int, 2 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int, 2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array lastIndexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'lastIndexOf', 'lastIndexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_lastIndexOf_number_undef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let opt: int | undefined = 2 as int | undefined;
      let res = arr.lastIndexOf(3.0 as number, opt);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3.0 as number, opt);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array lastIndexOf_number_undef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float32Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.slice(1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'slice', 'slice(int): Float32Array', arkTsAveragedTime);
    })

    // ==================== Float64Array includes/indexOf/lastIndexOf/slice 补充重载 ====================

    it('PerformanceTest_Float64Array_includes_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.includes(3.0 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3.0 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array includes_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'includes', 'includes(number, int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_indexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array indexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'indexOf', 'indexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_indexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3 as int, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3 as int, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array indexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'indexOf', 'indexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_indexOf_number_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.indexOf(3.0 as number, 0 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3.0 as number, 0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array indexOf_number_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'indexOf', 'indexOf(number, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_lastIndexOf_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array lastIndexOf_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'lastIndexOf', 'lastIndexOf(int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_lastIndexOf_number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3.0 as number);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3.0 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array lastIndexOf_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'lastIndexOf', 'lastIndexOf(number): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_lastIndexOf_int_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let res = arr.lastIndexOf(3 as int, 2 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3 as int, 2 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array lastIndexOf_int_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'lastIndexOf', 'lastIndexOf(int, int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_lastIndexOf_number_undef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 3.0]);
      let opt: int | undefined = 2 as int | undefined;
      let res = arr.lastIndexOf(3.0 as number, opt);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(3.0 as number, opt);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array lastIndexOf_number_undef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'lastIndexOf', 'lastIndexOf(number, int | undefined): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float64Array_slice_int', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let res = arr.slice(1 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array slice_int: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'slice', 'slice(int): Float64Array', arkTsAveragedTime);
    })
  })
}
