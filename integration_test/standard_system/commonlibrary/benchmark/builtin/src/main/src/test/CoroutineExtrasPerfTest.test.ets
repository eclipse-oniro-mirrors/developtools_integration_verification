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

/*
 * NOTE: CoroutineExtras type does not exist in doc/stdlib.
 * All test cases using CoroutineExtras are commented out.
 * Uncomment when std.debug.concurrency module is available.
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
import {
  CoroutineExtras
} from 'std/debug/concurrency';

export default function CoroutineExtrasPerfTest():void {
  describe('CoroutineExtrasPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    // const BASE_COUNT = 50000;
    const BASE_COUNT = 1000;
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

    // ========== 静态常量测试 ==========

    // POLICY_ANY 常量访问测试
    it('PerformanceTest_CoroutineExtras_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.POLICY_ANY;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'POLICY_ANY',
        'static POLICY_ANY: int', arkTsAveragedTime);
    })

    // POLICY_NON_MAIN 常量访问测试
    it('PerformanceTest_CoroutineExtras_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.POLICY_NON_MAIN;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'POLICY_NON_MAIN',
        'static POLICY_NON_MAIN: int', arkTsAveragedTime);
    })

    // ========== Worker 相关方法测试 ==========

    // getWorkerId() 测试
    it('PerformanceTest_CoroutineExtras_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.getWorkerId();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'getWorkerId',
        'static getWorkerId(): int', arkTsAveragedTime);
    })

    // setSchedulingPolicy() 测试
    it('PerformanceTest_CoroutineExtras_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setSchedulingPolicy(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setSchedulingPolicy',
        'static setSchedulingPolicy(policy: int): void', arkTsAveragedTime);
    })

    // ========== Coroutine 相关方法测试 ==========

    // getCoroutineId() 测试
    it('PerformanceTest_CoroutineExtras_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.getCoroutineId();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'getCoroutineId',
        'static getCoroutineId(): int', arkTsAveragedTime);
    })

    // isMainWorker() 测试
    it('PerformanceTest_CoroutineExtras_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.isMainWorker();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'isMainWorker',
        'static isMainWorker(): boolean', arkTsAveragedTime);
    })

    // scaleWorkersPool() 测试
    it('PerformanceTest_CoroutineExtras_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.scaleWorkersPool(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'scaleWorkersPool',
        'static scaleWorkersPool(scaler: int): void', arkTsAveragedTime);
    })

    // getCoroutineCount() 测试
    it('PerformanceTest_CoroutineExtras_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.getCoroutineCount();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'getCoroutineCount',
        'static getCoroutineCount(): long', arkTsAveragedTime);
    })

    // ========== Taskpool 相关方法测试 ==========

    // workerHasExternalScheduler() 测试
    it('PerformanceTest_CoroutineExtras_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.workerHasExternalScheduler();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'workerHasExternalScheduler',
        'static workerHasExternalScheduler(): boolean', arkTsAveragedTime);
    })

    // isExternalTimerEnabled() 测试
    it('PerformanceTest_CoroutineExtras_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.isExternalTimerEnabled();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'isExternalTimerEnabled',
        'static isExternalTimerEnabled(): boolean', arkTsAveragedTime);
    })

    // isTaskpoolUsingLaunchMode() 测试
    it('PerformanceTest_CoroutineExtras_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.isTaskpoolUsingLaunchMode();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'isTaskpoolUsingLaunchMode',
        'static isTaskpoolUsingLaunchMode(): boolean', arkTsAveragedTime);
    })

    // isTaskpoolSupportingInterop() 测试
    it('PerformanceTest_CoroutineExtras_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.isTaskpoolSupportingInterop();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'isTaskpoolSupportingInterop',
        'static isTaskpoolSupportingInterop(): boolean', arkTsAveragedTime);
    })

    // getTaskPoolWorkersNum() 测试
    it('PerformanceTest_CoroutineExtras_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.getTaskPoolWorkersNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'getTaskPoolWorkersNum',
        'static getTaskPoolWorkersNum(): int', arkTsAveragedTime);
    })

    // getTaskPoolWorkersLimit() 测试
    it('PerformanceTest_CoroutineExtras_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = CoroutineExtras.getTaskPoolWorkersLimit();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'getTaskPoolWorkersLimit',
        'static getTaskPoolWorkersLimit(): int', arkTsAveragedTime);
    })

    // setTaskPoolTriggerShrinkInterval() 测试
    it('PerformanceTest_CoroutineExtras_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setTaskPoolTriggerShrinkInterval(60000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setTaskPoolTriggerShrinkInterval',
        'static setTaskPoolTriggerShrinkInterval(interval: int): void', arkTsAveragedTime);
    })

    // setTaskPoolIdleThreshold() 测试
    it('PerformanceTest_CoroutineExtras_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setTaskPoolIdleThreshold(5000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setTaskPoolIdleThreshold',
        'static setTaskPoolIdleThreshold(threshold: int): void', arkTsAveragedTime);
    })

    // setTaskPoolBlockedWorkerThresholdDebug() 测试
    it('PerformanceTest_CoroutineExtras_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setTaskPoolBlockedWorkerThresholdDebug(30000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setTaskPoolBlockedWorkerThresholdDebug',
        'static setTaskPoolBlockedWorkerThresholdDebug(thresholdMs: int): void', arkTsAveragedTime);
    })

    // setTaskPoolBlockedWorkerMonitorIntervalDebug() 测试
    it('PerformanceTest_CoroutineExtras_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setTaskPoolBlockedWorkerMonitorIntervalDebug(10000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setTaskPoolBlockedWorkerMonitorIntervalDebug',
        'static setTaskPoolBlockedWorkerMonitorIntervalDebug(intervalMs: int): void', arkTsAveragedTime);
    })

    // setTaskPoolWorkersLimit() 测试
    it('PerformanceTest_CoroutineExtras_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.setTaskPoolWorkersLimit(8);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'setTaskPoolWorkersLimit',
        'static setTaskPoolWorkersLimit(limit: int): void', arkTsAveragedTime);
    })

    // stopTaskpool() 测试 - 需要先启动taskpool才能调用，不适合性能测试
    // it('PerformanceTest_CoroutineExtras_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     CoroutineExtras.stopTaskpool();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_2000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'stopTaskpool',
    //     'static stopTaskpool(): void', arkTsAveragedTime);
    // })

    // retriggerTaskPoolShrink() 测试 - 需要先启动taskpool才能调用，不适合性能测试
    // it('PerformanceTest_CoroutineExtras_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     CoroutineExtras.retriggerTaskPoolShrink();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_2100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'retriggerTaskPoolShrink',
    //     'static retriggerTaskPoolShrink(): void', arkTsAveragedTime);
    // })

    // increaseTaskpoolWorkersToN() 测试
    it('PerformanceTest_CoroutineExtras_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        CoroutineExtras.increaseTaskpoolWorkersToN(4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'increaseTaskpoolWorkersToN',
        'static increaseTaskpoolWorkersToN(workersNum: int): void', arkTsAveragedTime);
    })

    // retriggerTaskPoolBlockedExpandMonitorDebug() 测试 - 需要先启动taskpool才能调用，不适合性能测试
    // it('PerformanceTest_CoroutineExtras_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     CoroutineExtras.retriggerTaskPoolBlockedExpandMonitorDebug();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutineExtras_Static_2300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.debug.concurrency', 'CoroutineExtras', 'retriggerTaskPoolBlockedExpandMonitorDebug',
    //     'static retriggerTaskPoolBlockedExpandMonitorDebug(): void', arkTsAveragedTime);
    // })

  })
}

