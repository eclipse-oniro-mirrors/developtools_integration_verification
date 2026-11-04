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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

import { ArkTSUtils } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function AsyncLockPerfTest(): void {
  describe('AsyncLockPerfTest', () => {

    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_AsyncLock_AsyncLockMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {

        let res: ArkTSUtils.locks.AsyncLockMode = ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_AsyncLockMode_0100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockMode', 'EXCLUSIVE',
          'EXCLUSIVE', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLock_AsyncLockMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.AsyncLockMode = ArkTSUtils.locks.AsyncLockMode.SHARED;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.AsyncLockMode.SHARED;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTet arkTsAveragedTime PerformanceTest_AsyncLock_AsyncLockMode_0200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockMode', 'SHARED',
          'SHARED', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLock_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {

        let result: ArkTSUtils.locks.AsyncLock | undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new ArkTSUtils.locks.AsyncLock()
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Constructor_0400: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLock_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: ArkTSUtils.locks.AsyncLock | undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = ArkTSUtils.locks.AsyncLock.request("a");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime  / BASE_COUNT;
        let res1 = result
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0500: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'request',
          'static request(id: string): AsyncLock', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLock_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let asyncLock = new ArkTSUtils.locks.AsyncLock();
        let result = 0;
        let callback = (): number => {
          result++;
          return result;
        };
        let resultA = await asyncLock.lockAsync(callback);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          resultA = await asyncLock.lockAsync(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = resultA
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Instance_0600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'lockAsync',
          'lockAsync<T>(callback: () => T): Promise<T>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLock_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let resultA: ArkTSUtils.locks.AsyncLockState[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          resultA = ArkTSUtils.locks.AsyncLock.queryAll();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = resultA;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0900: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'queryAll',
          'static queryAll(): AsyncLockState[]', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_AsyncLock_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let lock = ArkTSUtils.locks.AsyncLock.request("a");
        let resultA: ArkTSUtils.locks.AsyncLockState | undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          resultA = ArkTSUtils.locks.AsyncLock.query(lock.name);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = resultA
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLock_Static_0800: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLock', 'query',
          'static query(id: string): AsyncLock | undefined', arkTsAveragedTime);
      done();
      })

  })
}
