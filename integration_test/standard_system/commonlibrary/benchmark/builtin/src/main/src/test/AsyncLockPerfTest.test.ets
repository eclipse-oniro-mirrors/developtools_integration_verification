/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
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


export default function AsyncLockPerfTest(): void {
  describe('AsyncLockPerfTest', () => {
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

    it('PerformanceTest_AsyncLock_AsyncLockMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = AsyncLockMode.EXCLUSIVE;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AsyncLockMode.EXCLUSIVE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_AsyncLockMode_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockMode', 'EXCLUSIVE',
        'EXCLUSIVE', arkTsAveragedTime);
    })
    
    it('PerformanceTest_AsyncLock_AsyncLockMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = AsyncLockMode.SHARED;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AsyncLockMode.SHARED;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_AsyncLockMode_0200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockMode', 'SHARED',
        'SHARED', arkTsAveragedTime);
    })
    
    it('PerformanceTest_AsyncLock_AsyncLockMode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = AsyncLockMode.UNLOCKED;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AsyncLockMode.UNLOCKED;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_AsyncLockMode_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockMode', 'UNLOCKED',
        'UNLOCKED', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLock_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let result = new AsyncLock()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLock()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Constructor_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLock_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = AsyncLock.request("a")
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = AsyncLock.request("a")
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'request',
        'static request(id: string): AsyncLock', arkTsAveragedTime);
    })


    it('PerformanceTest_AsyncLock_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncLock = new AsyncLock()
      let result = 0;
      let callback = (): int => {
        result++;
        return result;
      };
      let resultA = await asyncLock.lockAsync(callback);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = await asyncLock.lockAsync(callback);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Instance_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'lockAsync',
        'lockAsync<T>(callback: () => T): Promise<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLock_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncLock = new AsyncLock()
      let result = 0;
      let callback = (): int => {
        result++;
        return result;
      };
      let resultA = await asyncLock.lockAsync(callback, AsyncLockMode.EXCLUSIVE);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = await asyncLock.lockAsync(callback, AsyncLockMode.EXCLUSIVE);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Instance_0200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'lockAsync',
        'lockAsync<T>(callback: () => T, mode: AsyncLockMode): Promise<T>', arkTsAveragedTime);
    })


    it('PerformanceTest_AsyncLock_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncLock = new AsyncLock()
      let result = 0;
      let callback = (): int => {
        result++;
        return result;
      };
      let options = new AsyncLockOptions();
      let resultA = await asyncLock.lockAsync(callback, AsyncLockMode.EXCLUSIVE, options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = await asyncLock.lockAsync(callback, AsyncLockMode.EXCLUSIVE, options);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Instance_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'lockAsync',
        'lockAsync<T>(callback: () => T, mode: AsyncLockMode, options?: AsyncLockOptions): Promise<T>',
        arkTsAveragedTime);
    })


    it('PerformanceTest_AsyncLock_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let ln = "a"
      let result = 0
      let callback = (): int => {
        result++;
        return result;
      };
      let lock = AsyncLock.request(ln)
      await lock.lockAsync(callback)
      let resultA = AsyncLock.query(lock.name)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = AsyncLock.query(lock.name)
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'query',
        'static query(id: string): AsyncLock | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLock_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let ln = "a"
      let result = 0
      let callback = (): int => {
        result++;
        return result;
      };
      let lock = AsyncLock.request(ln)
      await lock.lockAsync(callback)
      let resultA = AsyncLock.queryAll()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = AsyncLock.queryAll()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'queryAll',
        'static queryAll(): AsyncLock[]', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLock_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let ln = "a"
      let result = 0
      let callback = (): int => {
        result++;
        return result;
      };
      let lock = AsyncLock.request(ln)
      await lock.lockAsync(callback)
      let resultA = lock.query()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        resultA = lock.query()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = resultA
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Instance_0400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'query',
        'query(): AsyncLockState', arkTsAveragedTime);
    })
  })
}