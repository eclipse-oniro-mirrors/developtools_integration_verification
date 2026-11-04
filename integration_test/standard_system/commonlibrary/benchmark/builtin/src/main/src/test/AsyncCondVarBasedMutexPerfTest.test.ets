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

export default function AsyncCondVarBasedMutexPerfTest(): void {
  describe('AsyncCondVarBasedMutexPerfTest', () => {
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

    it('PerformanceTest_AsyncCondVarBasedMutex_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: concurrency.stackless.AsyncCondVarBasedMutex = new concurrency.stackless.AsyncCondVarBasedMutex();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.stackless.AsyncCondVarBasedMutex();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncCondVarBasedMutex_NotifyOne_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let condVar = new concurrency.stackless.AsyncCondVarBasedMutex();
      let mutex = new concurrency.stackless.AsyncMutex();
      await mutex.lock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        condVar.notifyOne();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = condVar;
      mutex.unlock();
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_NotifyOne_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'notifyOne',
        'notifyOne(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncCondVarBasedMutex_NotifyAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let condVar = new concurrency.stackless.AsyncCondVarBasedMutex();
      let mutex = new concurrency.stackless.AsyncMutex();
      await mutex.lock();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        condVar.notifyAll();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      mutex.unlock();
      let res1 = condVar;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_NotifyAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'notifyAll',
        'notifyAll(): void', arkTsAveragedTime);
    })


    //原因：wait 和 notifyOne 的性能测试，在 wait 中会调用 notifyOne，导致 notifyOne 的性能测试结果不准确
    // it('PerformanceTest_AsyncCondVarBasedMutex_WaitWithNotifyOne_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 1000;
    //   let condVar = new concurrency.stackless.AsyncCondVarBasedMutex();
    //   let mutex = new concurrency.stackless.AsyncMutex();
    //   await mutex.lock();
    //   let result = 0;
    //   let Stime = new Date().getTime();
    //   let waitAndNotifyOne = async () => {
    //     let waitPromise = condVar.wait(mutex);
    //     mutex.unlock();
    //     condVar.notifyOne();
    //     await waitPromise;
    //     await mutex.lock();
    //     result++;
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     waitAndNotifyOne();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   mutex.unlock();
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_WaitWithNotifyOne_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'wait_notifyOne',
    //     'wait + notifyOne', arkTsAveragedTime);
    // })
    //原因：wait 和 notifyOne 的性能测试，在 wait 中会调用 notifyOne，导致 notifyOne 的性能测试结果不准确
    // it('PerformanceTest_AsyncCondVarBasedMutex_WaitWithNotifyAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 1000;
    //   let condVar = new concurrency.stackless.AsyncCondVarBasedMutex();
    //   let mutex = new concurrency.stackless.AsyncMutex();
    //   await mutex.lock();
    //   let result = 0;
    //   let Stime = new Date().getTime();
    //   let waitAndNotifyAll = async () => {
    //     let waitPromise = condVar.wait(mutex);
    //     mutex.unlock();
    //     condVar.notifyAll();
    //     await waitPromise;
    //     await mutex.lock();
    //     result++;
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     waitAndNotifyAll();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   mutex.unlock();
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_WaitWithNotifyAll_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'wait_notifyAll',
    //     'wait + notifyAll', arkTsAveragedTime);
    // })
    //原因：wait 和 notifyOne 的性能测试，在 wait 中会调用 notifyOne，导致 notifyOne 的性能测试结果不准确
    // it('PerformanceTest_AsyncCondVarBasedMutex_ProducerConsumer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    //   let BASE_COUNT_SYNC = 500;
    //   let condVar = new concurrency.stackless.AsyncCondVarBasedMutex();
    //   let mutex = new concurrency.stackless.AsyncMutex();
    //   let queue: number[] = [];
    //   await mutex.lock();
    //   let Stime = new Date().getTime();
    //   let producer = (idx: number) => {
    //     queue.push(idx);
    //     condVar.notifyOne();
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     producer(i);
    //   }
    //   for (let i = 0; i < BASE_COUNT_SYNC; i++) {
    //     while (queue.length === 0) {
    //       await condVar.wait(mutex);
    //     }
    //     queue.shift();
    //     mutex.unlock();
    //     await mutex.lock();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   mutex.unlock();
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SYNC;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVarBasedMutex_ProducerConsumer_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncCondVarBasedMutex', 'producerConsumer',
    //     'Producer-Consumer Pattern', arkTsAveragedTime);
    // })

  })
}
