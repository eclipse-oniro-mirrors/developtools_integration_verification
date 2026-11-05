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


export default function SyncPrimitivesPerfTest(): void {
  describe('SyncPrimitivesPerfTest', () => {
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

    // Mutex tests
    it('PerformanceTest_Mutex_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Mutex = new Mutex();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Mutex();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Mutex_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Mutex', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Mutex_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex = new Mutex();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        mutex.lock();
        mutex.unlock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = mutex;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Mutex_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Mutex', 'lock_unlock',
        'lock(): void, unlock(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Mutex_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex = new Mutex();
      let counter = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        mutex.lockGuard(() => {
          counter++;
        });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = counter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Mutex_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Mutex', 'lockGuard',
        'lockGuard(callback: () => void): void', arkTsAveragedTime);
    })

    // RWLock tests
    it('PerformanceTest_RWLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: RWLock = new RWLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new RWLock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RWLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RWLock', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // 原因: RWLock的readLock()和writeLock()返回的是同一个锁对象，调用unlock()后会改变锁的内部状态，
    // 导致在循环中交替unlock()和重新获取锁时出现状态不一致的错误。
    // it('PerformanceTest_RWLock_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let rwLock = new RWLock();
    //   let readLock = rwLock.readLock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     readLock.unlock();
    //     readLock = rwLock.readLock();
    //   }
    //   readLock.unlock();
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RWLock_Instance_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'RWLock', 'readLock',
    //     'readLock(): ReadLock', arkTsAveragedTime);
    // })

    // 原因: RWLock的readLock()和writeLock()返回的是同一个锁对象，调用unlock()后会改变锁的内部状态，
    // 导致在循环中交替unlock()和重新获取锁时出现状态不一致的错误。
    // it('PerformanceTest_RWLock_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let rwLock = new RWLock();
    //   let writeLock = rwLock.writeLock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     writeLock.unlock();
    //     writeLock = rwLock.writeLock();
    //   }
    //   writeLock.unlock();
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RWLock_Instance_0200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'RWLock', 'writeLock',
    //     'writeLock(): WriteLock', arkTsAveragedTime);
    // })

    // ReadLock tests
    it('PerformanceTest_ReadLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new RWLock();
      let res: ReadLock = new ReadLock(rwLock);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ReadLock(rwLock);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadLock', 'constructor',
        'constructor(lock: RWLock)', arkTsAveragedTime);
    })

    it('PerformanceTest_ReadLock_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new RWLock();
      let readLock = rwLock.readLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        readLock.lock();
        readLock.unlock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = readLock;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadLock_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadLock', 'lock_unlock',
        'lock(): void, unlock(): void', arkTsAveragedTime);
    })

    // WriteLock tests
    it('PerformanceTest_WriteLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new RWLock();
      let res: WriteLock = new WriteLock(rwLock);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new WriteLock(rwLock);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WriteLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'WriteLock', 'constructor',
        'constructor(lock: RWLock)', arkTsAveragedTime);
    })

    it('PerformanceTest_WriteLock_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new RWLock();
      let writeLock = rwLock.writeLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        writeLock.lock();
        writeLock.unlock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = writeLock;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WriteLock_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'WriteLock', 'lock_unlock',
        'lock(): void, unlock(): void', arkTsAveragedTime);
    })

  })
}
