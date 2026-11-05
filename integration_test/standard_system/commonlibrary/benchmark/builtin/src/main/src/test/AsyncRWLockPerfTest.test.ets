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

export default function AsyncRWLockPerfTest(): void {
  describe('AsyncRWLockPerfTest', () => {
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

    // AsyncReadWriteLock Constructor Tests
    it('PerformanceTest_AsyncReadWriteLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: concurrency.stackless.AsyncReadWriteLock = new concurrency.stackless.AsyncReadWriteLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.stackless.AsyncReadWriteLock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // AsyncReadWriteLock.readLock Tests
    it('PerformanceTest_AsyncReadWriteLock_ReadLock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let res: concurrency.stackless.AsyncReadLock = rwLock.readLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rwLock.readLock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_ReadLock_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'readLock',
        'readLock(): AsyncReadLock', arkTsAveragedTime);
    })

    // AsyncReadWriteLock.writeLock Tests
    it('PerformanceTest_AsyncReadWriteLock_WriteLock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let res: concurrency.stackless.AsyncWriteLock = rwLock.writeLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rwLock.writeLock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_WriteLock_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'writeLock',
        'writeLock(): AsyncWriteLock', arkTsAveragedTime);
    })

    // AsyncReadWriteLock.executeReadLock Tests
    it('PerformanceTest_AsyncReadWriteLock_ExecuteReadLock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        await rwLock.executeReadLock();
        rwLock.unlock();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = rwLock;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_ExecuteReadLock_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'executeReadLock',
        'executeReadLock(): Promise<void>', arkTsAveragedTime);
    })

    // AsyncReadWriteLock.executeWriteLock Tests
    // it('PerformanceTest_AsyncReadWriteLock_ExecuteWriteLock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     await rwLock.executeWriteLock(),rwLock.unlock(); }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_ExecuteWriteLock_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'executeWriteLock',
    //     'executeWriteLock(): Promise<void>', arkTsAveragedTime);
    // })

    // AsyncReadWriteLock.unlock Tests
    it('PerformanceTest_AsyncReadWriteLock_Unlock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      await rwLock.executeReadLock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        rwLock.unlock();
        await rwLock.executeReadLock();
      }
      let Dtime = new Date().getTime() - Stime;
      rwLock.unlock();
      let res1 = rwLock;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_Unlock_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'unlock',
        'unlock(): void', arkTsAveragedTime);
    })

    // AsyncReadLock Constructor Tests
    it('PerformanceTest_AsyncReadLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let res: concurrency.stackless.AsyncReadLock = new concurrency.stackless.AsyncReadLock(rwLock);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.stackless.AsyncReadLock(rwLock);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadLock', 'constructor',
        'constructor(rwl: AsyncReadWriteLock)', arkTsAveragedTime);
    })

    //原因: 在AsyncReadLock.lock中，会调用rwl.executeReadLock()，而rwl.executeReadLock()会调用rwl.readLock()，
    // AsyncReadLock.lock Tests
    // it('PerformanceTest_AsyncReadLock_Lock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let rLock = rwLock.readLock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     await rLock.lock();
    //     rLock.unlock();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadLock_Lock_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadLock', 'lock',
    //     'lock(): Promise<void>', arkTsAveragedTime);
    // })

    // AsyncReadLock.unlock Tests
    it('PerformanceTest_AsyncReadLock_Unlock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let rLock = rwLock.readLock();
      await rLock.lock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        rLock.unlock();
        await rLock.lock();
      }
      let Dtime = new Date().getTime() - Stime;
      rLock.unlock();
      let res1 = rLock;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadLock_Unlock_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadLock', 'unlock',
        'unlock(): void', arkTsAveragedTime);
    })

    // AsyncWriteLock Constructor Tests
    it('PerformanceTest_AsyncWriteLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock = new concurrency.stackless.AsyncReadWriteLock();
      let res: concurrency.stackless.AsyncWriteLock = new concurrency.stackless.AsyncWriteLock(rwLock);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.stackless.AsyncWriteLock(rwLock);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncWriteLock_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncWriteLock', 'constructor',
        'constructor(rwl: AsyncReadWriteLock)', arkTsAveragedTime);
    })

    // AsyncWriteLock.lock Tests
    // it('PerformanceTest_AsyncWriteLock_Lock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let wLock = rwLock.writeLock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     await wLock.lock();
    //     wLock.unlock();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncWriteLock_Lock_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncWriteLock', 'lock',
    //     'lock(): Promise<void>', arkTsAveragedTime);
    // })

    // AsyncWriteLock.unlock Tests
    // it('PerformanceTest_AsyncWriteLock_Unlock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let wLock = rwLock.writeLock();
    //   await wLock.lock();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     wLock.unlock();
    //     await wLock.lock();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   wLock.unlock();
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncWriteLock_Unlock_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncWriteLock', 'unlock',
    //     'unlock(): void', arkTsAveragedTime);
    // })

    // Multiple Readers Concurrent Test
    // it('PerformanceTest_AsyncReadWriteLock_MultiReaders_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 1000;
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let result = 0;
    //   let Stime = new Date().getTime();
    //   let readTask = async () => {
    //     await rwLock.executeReadLock();
    //     result++;
    //     rwLock.unlock();
    //   }
    //   let promises: Promise<void>[] = [];
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     promises.push(readTask());
    //   }
    //   await Promise.all(promises);
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_MultiReaders_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'multiReaders',
    //     'multiple readers concurrent', arkTsAveragedTime);
    // })

    // Write-After-Read Test
    // it('PerformanceTest_AsyncReadWriteLock_WriteAfterRead_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 1000;
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let result = 0;
    //   let Stime = new Date().getTime();
    //   let readThenWrite = async () => {
    //     await rwLock.executeReadLock();
    //     rwLock.unlock();
    //     await rwLock.executeWriteLock();
    //     result++;
    //     rwLock.unlock();
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     await readThenWrite();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_WriteAfterRead_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'writeAfterRead',
    //     'write after read', arkTsAveragedTime);
    // })

    // Read-After-Write Test
    // it('PerformanceTest_AsyncReadWriteLock_ReadAfterWrite_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 1000;
    //   let rwLock = new concurrency.stackless.AsyncReadWriteLock();
    //   let result = 0;
    //   let Stime = new Date().getTime();
    //   let writeThenRead = async () => {
    //     await rwLock.executeWriteLock();
    //     rwLock.unlock();
    //     await rwLock.executeReadLock();
    //     result++;
    //     rwLock.unlock();
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     await writeThenRead();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncReadWriteLock_ReadAfterWrite_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncReadWriteLock', 'readAfterWrite',
    //     'read after write', arkTsAveragedTime);
    // })

  })
}
