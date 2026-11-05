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

export default function LegacyAtomicsPerfTest():void {
  describe('LegacyAtomicsPerfTest', () => {
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

    it('PerformanceTest_Atomics_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.isLockFree(4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'isLockFree',
        'isLockFree(byteSize: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int32Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int32Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.notify(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'notify',
        'notify(typedArray: Int32Array, index: int): int', arkTsAveragedTime);
    })

    // BigInt64Array tests

    it('PerformanceTest_Atomics_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: BigInt64Array, index: int): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, BigInt(i));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, BigInt(0), BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: BigInt64Array, index: int, expectedValue: bigint, replacementValue: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, BigInt(i));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0xFF);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, BigInt(0xFF));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, BigInt(0x01));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, BigInt(0x01));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: BigInt64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.notify(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'notify',
        'notify(typedArray: BigInt64Array, index: int): int', arkTsAveragedTime);
    })

    // BigUint64Array tests

    it('PerformanceTest_Atomics_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: BigUint64Array, index: int): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, BigInt(i));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, BigInt(0), BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: BigUint64Array, index: int, expectedValue: bigint, replacementValue: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, BigInt(i));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      arr[0] = BigInt(0xFF);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, BigInt(0xFF));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, BigInt(0x01));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, BigInt(0x01));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: BigUint64Array, index: int, value: bigint): bigint', arkTsAveragedTime);
    })

    // Uint8Array tests

    it('PerformanceTest_Atomics_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint8Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i.toByte());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      Atomics.store(arr, 0, 0);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint8Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i.toByte());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    // Int16Array tests

    it('PerformanceTest_Atomics_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int16Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i.toShort());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int16Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i.toShort());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    // Uint16Array tests

    it('PerformanceTest_Atomics_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint16Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i.toShort());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint16Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i.toShort());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint16Array, index: int, value: long): long', arkTsAveragedTime);
    })

    // Uint32Array tests

    it('PerformanceTest_Atomics_Static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint32Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint32Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Uint32Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint32Array, index: int, value: long): long', arkTsAveragedTime);
    })

    // Int8Array tests

    it('PerformanceTest_Atomics_Static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int8Array, index: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i.toByte());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arr, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int8Array, index: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i.toByte());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      arr[0] = 0xFF;
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int8Array(1);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int8Array, index: int, value: long): long', arkTsAveragedTime);
    })

    // wait/waitAsync tests (not-equal path)

    it('PerformanceTest_Atomics_Static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      arr[0] = 0;
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: Int32Array, index: int, value: long): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Int32Array(1);
      arr[0] = 0;
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, 1, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: Int32Array, index: int, value: long, timeout: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: BigInt64Array, index: int, value: bigint): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, BigInt(1), 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_8000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: BigInt64Array, index: int, value: bigint, timeout: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new Int32Array(1);
      arr[0] = 0;
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = await Atomics.waitAsync(arr, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_8100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'waitAsync',
        'waitAsync(typedArray: Int32Array, index: int, value: long): Promise<string>', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new Int32Array(1);
      arr[0] = 0;
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = await Atomics.waitAsync(arr, 0, 1, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_8200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'waitAsync',
        'waitAsync(typedArray: Int32Array, index: int, value: long, timeout: int): Promise<string>', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = await Atomics.waitAsync(arr, 0, BigInt(1));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_8300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'waitAsync',
        'waitAsync(typedArray: BigInt64Array, index: int, value: bigint): Promise<string>', arkTsAveragedTime);
    })

    it('PerformanceTest_Atomics_Static_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = await Atomics.waitAsync(arr, 0, BigInt(1), 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_8400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'waitAsync',
        'waitAsync(typedArray: BigInt64Array, index: int, value: bigint, timeout: int): Promise<string>', arkTsAveragedTime);
    })
  })
}
