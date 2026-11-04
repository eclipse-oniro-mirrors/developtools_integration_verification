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

export default function AsyncCondVarPerfTest() : void{
  describe('AsyncCondVarPerfTest', () => {
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

    it('PerformanceTest_AsyncCondVar_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: concurrency.stackless.AsyncCondVar = new concurrency.stackless.AsyncCondVar();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.stackless.AsyncCondVar();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVar', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // it('PerformanceTest_AsyncCondVar_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let condVar = new concurrency.stackless.AsyncCondVar();
    //     let mutex = new concurrency.stackless.AsyncMutex();
    //     await mutex.lock();
    //     let waitPromise = condVar.wait(mutex);
    //     condVar.notifyOne(mutex);
    //     await waitPromise;
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Instance_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVar', 'wait',
    //     'wait(mutex: AsyncMutex): Promise<void>', arkTsAveragedTime);
    // })

    it('PerformanceTest_AsyncCondVar_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let condVar = new concurrency.stackless.AsyncCondVar();
      let mutex = new concurrency.stackless.AsyncMutex();
      await mutex.lock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        condVar.notifyOne(mutex);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      mutex.unlock();
      let res1 = condVar;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVar', 'notifyOne',
        'notifyOne(mutex: AsyncMutex): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncCondVar_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let condVar = new concurrency.stackless.AsyncCondVar();
      let mutex = new concurrency.stackless.AsyncMutex();
      await mutex.lock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        condVar.notifyAll(mutex);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      mutex.unlock();
      let res1 = condVar;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVar', 'notifyAll',
        'notifyAll(mutex: AsyncMutex): void', arkTsAveragedTime);
    })
  })
}
