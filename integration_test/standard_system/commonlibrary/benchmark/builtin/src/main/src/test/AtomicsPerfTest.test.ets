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

export default function AtomicsPerfTest(): void {
  describe('AtomicsPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
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

    it('PerformanceTest_AtomicReference_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicReference<Object> = new AtomicReference<Object>(new Object());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicReference<Object>(new Object());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'constructor',
        'constructor(ref: T)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicReference_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicRef = new AtomicReference<Object>(new Object());
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicRef.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'load',
        'native load(): T', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicReference_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new Object();
      let atomicRef = new AtomicReference<Object>(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicRef.store(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicRef;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'store',
        'native store(ref: T): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicReference_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicRef = new AtomicReference<Object>(new Object());
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicRef.exchange(new Object());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'exchange',
        'native exchange(ref: T): T', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicReference_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new Object();
      let atomicRef = new AtomicReference<Object>(obj);
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicRef.compareAndSwap(obj, new Object());
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'compareAndSwap',
        'native compareAndSwap(expected: T, ref: T): T', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicInt = new AtomicInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicInt(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'constructor',
        'constructor(val: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'load',
        'native load(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicInt.store(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicInt;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'store',
        'native store(val: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.fetchAdd(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'fetchAdd',
        'native fetchAdd(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.exchange(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'exchange',
        'native exchange(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.compareAndSwap(0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicInt.store(0);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'compareAndSwap',
        'native compareAndSwap(expected: int, val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.fetchSub(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'fetchSub',
        'native fetchSub(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.fetchAnd(0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'fetchAnd',
        'native fetchAnd(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.fetchOr(0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'fetchOr',
        'native fetchOr(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicInt = new AtomicInt(0);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicInt.fetchXor(0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'fetchXor',
        'native fetchXor(val: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicLong = new AtomicLong(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicLong(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'constructor',
        'constructor(val: long)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'load',
        'native load(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.fetchAdd(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'fetchAdd',
        'native fetchAdd(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicBoolean = new AtomicBoolean(false);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicBoolean(false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'constructor',
        'constructor(val: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicBool = new AtomicBoolean(false);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicBool.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'load',
        'native load(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicBool = new AtomicBoolean(false);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicBool.exchange(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicBool.store(false);
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'exchange',
        'native exchange(val: boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicFloat(Double.toFloat(0.0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'constructor',
        'constructor(val: float)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let res: float = Double.toFloat(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicFloat.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'load',
        'native load(): float', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let res: float = Double.toFloat(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicFloat.fetchAdd(Double.toFloat(1.0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'fetchAdd',
        'fetchAdd(val: float): float', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicDouble = new AtomicDouble(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicDouble(0.0 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'constructor',
        'constructor(val: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0);
      let res: double = 0.0 as double;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicDouble.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'load',
        'native load(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicReference_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicReference.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicReference_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicReference', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicInt_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicInt.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicInt_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicInt', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicLong.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicShort = new AtomicShort(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicShort(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'constructor',
        'constructor(val: short)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'load',
        'native load(): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let shortVar = new Short(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicShort.store(shortVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicShort;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'store',
        'native store(val: short): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let shortVar = new Short(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.exchange(shortVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'exchange',
        'native exchange(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.compareAndSwap(0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicShort.store(0);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'compareAndSwap',
        'native compareAndSwap(expected: short, val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.fetchAdd(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'fetchAdd',
        'native fetchAdd(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.fetchSub(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'fetchSub',
        'native fetchSub(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.fetchAnd(0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'fetchAnd',
        'native fetchAnd(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.fetchOr(0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'fetchOr',
        'native fetchOr(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicShort = new AtomicShort(0);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicShort.fetchXor(0x01);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'fetchXor',
        'native fetchXor(val: short): short', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicShort_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicShort.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicShort_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicShort', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicByte = new AtomicByte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicByte(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'constructor',
        'constructor(val: byte)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'load',
        'native load(): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let byteVar = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicByte.store(byteVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicByte;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'store',
        'native store(val: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let byteVar = new Byte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.exchange(byteVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'exchange',
        'native exchange(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.compareAndSwap(0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicByte.store(0);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'compareAndSwap',
        'native compareAndSwap(expected: byte, val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.fetchAdd(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'fetchAdd',
        'native fetchAdd(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.fetchSub(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'fetchSub',
        'native fetchSub(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let byteVar = new Byte(0);
      let res: byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.fetchAnd(byteVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'fetchAnd',
        'native fetchAnd(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let byteVar = new Byte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.fetchOr(byteVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'fetchOr',
        'native fetchOr(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicByte = new AtomicByte(0);
      let byteVar = new Byte(0);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicByte.fetchXor(byteVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'fetchXor',
        'native fetchXor(val: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicByte_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicByte.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicByte_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicByte', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicFloat.store(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicFloat;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'store',
        'native store(val: float): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let res: float = Double.toFloat(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicFloat.exchange(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'exchange',
        'native exchange(val: float): float', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let res: float = Double.toFloat(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicFloat.compareAndSwap(1.0f, 2.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicFloat.store(1.0f);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'compareAndSwap',
        'native compareAndSwap(expected: float, val: float): float', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let res: float = Double.toFloat(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicFloat.fetchSub(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'fetchSub',
        'fetchSub(val: float): float', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicFloat_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicFloat.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicFloat_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicFloat', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicDouble.store(0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicDouble;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'store',
        'native store(val: double): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicDouble.exchange(1.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'exchange',
        'native exchange(val: double): double', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicDouble.compareAndSwap(0.0, 1.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicDouble.store(0.0 as double);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'compareAndSwap',
        'native compareAndSwap(expected: double, val: double): double', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0 );
      let res: double = 0.0 as double;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicDouble.fetchSub(1.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'fetchSub',
        'fetchSub(val: double): double', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicDouble.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AtomicChar = new AtomicChar(c'0');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AtomicChar(c'0');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'constructor',
        'constructor(val: char)', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicChar = new AtomicChar(c'0');
      let res: char = c'0';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicChar.load();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'load',
        'native load(): char', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicChar = new AtomicChar(c'0');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicChar.store(c'0');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicChar;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'store',
        'native store(val: char): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicChar = new AtomicChar(c'0');
      let res: char = c'0';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicChar.exchange(c'0');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'exchange',
        'native exchange(val: char): char', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicChar = new AtomicChar(c'0');
      let res: char = c'0';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicChar.compareAndSwap(c'0', c'1');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'compareAndSwap',
        'native compareAndSwap(expected: char, val: char): char', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicChar_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicChar.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicChar_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicChar', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicBool = new AtomicBoolean(false);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicBool.store(false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicBool;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'store',
        'native store(val: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicBool = new AtomicBoolean(false);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicBool.compareAndSwap(false, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicBool.store(false);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'compareAndSwap',
        'native compareAndSwap(expected: boolean, val: boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicBoolean_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AtomicBoolean.isLockFree();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicBoolean_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicBoolean', 'isLockFree',
        'static isLockFree(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let longVar = new Long(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        atomicLong.store(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = atomicLong;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'store',
        'native store(val: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = new Long(0);
      let longVar = new Long(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.exchange(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'exchange',
        'native exchange(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.compareAndSwap(0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      atomicLong.store(0);
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'compareAndSwap',
        'native compareAndSwap(expected: long, val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.fetchSub(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'fetchSub',
        'native fetchSub(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.fetchAnd(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'fetchAnd',
        'native fetchAnd(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let longVar = new Long(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.fetchOr(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'fetchOr',
        'native fetchOr(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicLong_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicLong = new AtomicLong(0);
      let longVar = new Long(0);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicLong.fetchXor(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicLong_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicLong', 'fetchXor',
        'native fetchXor(val: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_AtomicDouble_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let atomicDouble = new AtomicDouble(0.0);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = atomicDouble.fetchAdd(1.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AtomicDouble_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AtomicDouble', 'fetchAdd',
        'fetchAdd(val: double): double', arkTsAveragedTime);
    })
  })
}
