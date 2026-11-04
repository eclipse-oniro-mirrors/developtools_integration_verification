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

export default function EAWorkerPerfTest(): void {
  describe('EAWorkerPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 100; //太大要出现 app died
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

    it('PerformanceTest_EAWorker_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = new EAWorker();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EAWorker();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'constructor',
        'constructor(needInterop?: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = new EAWorker();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EAWorker("TestWorker");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'constructor',
        'constructor(name: string, needInterop?: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = new EAWorker();
      let task = () => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EAWorker(task);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'constructor',
        'constructor(task: Task, needInterop?: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = new EAWorker();
      let task = () => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EAWorker("TestWorker", task);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'constructor',
        'constructor(name: string, task: Task, needInterop?: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = new EAWorker();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EAWorker(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'constructor',
        'constructor(needInterop: boolean)', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_EAWorker_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let workers: EAWorker[] = new Array<EAWorker>();
      for (let i = 0; i < BASE_COUNT; i++) {
        let worker = new EAWorker();
        // worker.start();
        workers.push(worker);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].start();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].quit();
      }
      let res1 = workers;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'start',
        'start(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.isAlive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'isAlive',
      'isAlive(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        worker.setPriority(WorkerPriority.PRIORITY_HIGH);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = worker;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'setPriority',
        'setPriority(priority: WorkerPriority): void', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let res: WorkerPriority = WorkerPriority.PRIORITY_DEFAULT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.getPriority();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'getPriority',
        'getPriority(): WorkerPriority', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let res: int | undefined = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.getWorkerId();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'getWorkerId',
        'getWorkerId(): int | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let task = () => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        worker.postTask(task);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = worker;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'postTask',
        'postTask(task: Task): void', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let fn = () => { return 42; };
      let res: Promise<number> | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.run<number>(fn);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'run',
        'run<R>(task: Function, ...args: FixedArray<Any>): Promise<R>', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      let handler = (error: Error) => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        worker.setUncaughtExceptionHandler(handler);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = worker;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'setUncaughtExceptionHandler',
        'setUncaughtExceptionHandler(handler: (error: Error) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let worker = new EAWorker();
      worker.start();
      worker.setUncaughtExceptionHandler((error: Error) => {});
      let res: ((error: Error) => void) | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = worker.getUncaughtExceptionHandler();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      worker.quit();
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'getUncaughtExceptionHandler',
        'getUncaughtExceptionHandler(): ErrorHandlerType | undefined', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_EAWorker_Instance_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let workers: EAWorker[] = new Array<EAWorker>();
      for (let i = 0; i < BASE_COUNT; i++) {
        let worker = new EAWorker();
        workers.push(worker);
      }
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].start();
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].join();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = workers;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'join',
        'join(): Promise<void>', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Instance_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let workers: EAWorker[] = new Array<EAWorker>();
      for (let i = 0; i < BASE_COUNT; i++) {
        let worker = new EAWorker();
        workers.push(worker);
      }
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].start();
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        workers[i].quit();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = workers;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Instance_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'quit',
        'quit(): void', arkTsAveragedTime);
    })


    it('PerformanceTest_EAWorker_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker = EAWorker.main();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = EAWorker.main();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'main',
        'static main(): EAWorker', arkTsAveragedTime);
    })

    it('PerformanceTest_EAWorker_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EAWorker | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = EAWorker.current();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'current',
        'static current(): EAWorker | undefined', arkTsAveragedTime);
    })

    // postToMain 每次调用在主线程调度新协程，大量累积导致 App died，使用较低迭代数
    // it('PerformanceTest_EAWorker_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const POST_MAIN_COUNT = 5000;
    //   let fn = () => {};
    //   let res: Promise<void> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < POST_MAIN_COUNT; i++) {
    //     res = EAWorker.postToMain<void>(fn);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / POST_MAIN_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Static_0300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'postToMain',
    //     'static postToMain<R>(coroFun: Function, ...args: FixedArray<Any>): Promise<R>', arkTsAveragedTime);
    // })

    // 0400 与 0300 内部代码路径相同（仅 abortFlag 差异且 new LaunchParams() 默认为 false），
    // 且大量调用同样会导致 App died，故此重载无需单独测试
    // it('PerformanceTest_EAWorker_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const POST_MAIN_COUNT = 5000;
    //   let launchParams = new LaunchParams();
    //   let fn = () => {};
    //   let res: Promise<void> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < POST_MAIN_COUNT; i++) {
    //     res = EAWorker.postToMain<void>(fn, launchParams);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / POST_MAIN_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EAWorker_Static_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'EAWorker', 'postToMain',
    //     'static postToMain<R>(coroFun: Function, launchParams: LaunchParams, ...args: FixedArray<Any>): Promise<R>', arkTsAveragedTime);
    // })


  })
}
