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
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
declare class ArkTools {
  static forceFullGC(): void;
}

export default function LegacyAtomicsPerfTest():void {
  describe('LegacyAtomicsPerfTest', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Atomics_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.isLockFree(4);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'isLockFree',
        'isLockFree(byteSize: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int32Array> = new Array<Int32Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Int32Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int32Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int32Array> = new Array<Int32Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Int32Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int32Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.notify(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'notify',
        'notify(typedArray: Int32Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<BigInt64Array> = new Array<BigInt64Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new BigInt64Array(1);
      }
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: BigInt64Array, index: number): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, BigInt(i));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<BigInt64Array> = new Array<BigInt64Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new BigInt64Array(1);
      }
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, BigInt(0), BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: BigInt64Array, index: number, expectedValue: bigint, replacementValue: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, BigInt(i));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      arr[0] = BigInt(0xFF);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, BigInt(0xFF));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, BigInt(0x01));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, BigInt(0x01));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: BigInt64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.notify(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'notify',
        'notify(typedArray: BigInt64Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<BigUint64Array> = new Array<BigUint64Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new BigUint64Array(1);
      }
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: BigUint64Array, index: number): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, BigInt(i));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<BigUint64Array> = new Array<BigUint64Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new BigUint64Array(1);
      }
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, BigInt(0), BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: BigUint64Array, index: number, expectedValue: bigint, replacementValue: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, BigInt(i));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      arr[0] = BigInt(0xFF);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, BigInt(0xFF));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, BigInt(0x01));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigUint64Array(1);
      let res: bigint = BigInt(0);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, BigInt(0x01));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: BigUint64Array, index: number, value: bigint): bigint', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint8Array> = new Array<Uint8Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Uint8Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint8Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint8Array> = new Array<Uint8Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Uint8Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint8Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int16Array> = new Array<Int16Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Int16Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int16Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int16Array> = new Array<Int16Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Int16Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int16Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint16Array> = new Array<Uint16Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Uint16Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint16Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint16Array> = new Array<Uint16Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Uint16Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint16Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint16Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint16Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint32Array> = new Array<Uint32Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Uint32Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_5900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Uint32Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Uint32Array> = new Array<Uint32Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Uint32Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Uint32Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Uint32Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Uint32Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int8Array> = new Array<Int8Array>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrPool[i] = new Int8Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.add(arrPool[i], 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'add',
        'add(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.sub(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'sub',
        'sub(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.load(arr, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_6900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'load',
        'load(typedArray: Int8Array, index: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.store(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'store',
        'store(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrPool: Array<Int8Array> = new Array<Int8Array>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        arrPool[j] = new Int8Array(1);
      }
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.compareExchange(arrPool[i], 0, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'compareExchange',
        'compareExchange(typedArray: Int8Array, index: number, expectedValue: number, replacementValue: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.exchange(arr, 0, i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'exchange',
        'exchange(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      arr[0] = 0xFF;
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.and(arr, 0, 0xFF);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'and',
        'and(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.or(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'or',
        'or(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int8Array(1);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.xor(arr, 0, 0x01);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'xor',
        'xor(typedArray: Int8Array, index: number, value: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(new SharedArrayBuffer(Int32Array.BYTES_PER_ELEMENT));
      arr[0] = 0;
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, 1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: Int32Array, index: number, value: number): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new Int32Array(new SharedArrayBuffer(Int32Array.BYTES_PER_ELEMENT));
      arr[0] = 0;
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, 1, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: Int32Array, index: number, value: number, timeout: number): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(new SharedArrayBuffer(BigInt64Array.BYTES_PER_ELEMENT));
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, BigInt(1));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: BigInt64Array, index: number, value: bigint): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Atomics_Static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr = new BigInt64Array(new SharedArrayBuffer(BigInt64Array.BYTES_PER_ELEMENT));
      arr[0] = BigInt(0);
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Atomics.wait(arr, 0, BigInt(1), 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      const arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Atomics_Static_7900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Atomics', 'wait',
        'wait(typedArray: BigInt64Array, index: number, value: bigint, timeout: number): string', arkTsAveragedTime);
      done();
    })

  })
}