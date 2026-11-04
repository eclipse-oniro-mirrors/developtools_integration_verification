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

let simpleFunc = (): int => { return 1; };

export default function TaskPoolPerfTest():void {
  describe('TaskPoolPerfTest', () => {
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

    it('PerformanceTest_Task_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.Task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.Task("testTask", simpleFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'constructor',
        'constructor(name: string, func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.Task = new taskpool.Task(simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.Task(simpleFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'constructor',
        'constructor(func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task.onEnqueued(() => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onEnqueued',
        'onEnqueued(callback: CallbackFunction): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task.onStartExecution(() => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onStartExecution',
        'onStartExecution(callback: CallbackFunction): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Task_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task.onExecutionFailed((e: Error) => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onExecutionFailed',
        'onExecutionFailed(callback: CallbackFunctionWithError): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task.onExecutionSucceeded(() => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onExecutionSucceeded',
        'onExecutionSucceeded(callback: CallbackFunction): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task.onReceiveData(() => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onReceiveData',
        'onReceiveData(callback?: Function): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let task = new taskpool.Task("testTask", simpleFunc);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = task.isDone();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'isDone',
        'isDone(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Task_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let task1 = new taskpool.Task("task1", simpleFunc);
      let task2 = new taskpool.Task("task2", simpleFunc);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        task1.addDependency(task2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = task1;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'addDependency',
        'addDependency(...tasks: Task[]): void', arkTsAveragedTime);
    })

    it('PerformanceTest_LongTask_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.LongTask = new taskpool.LongTask("longTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.LongTask("longTask", simpleFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongTask_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'LongTask', 'constructor',
        'constructor(name: string, func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
    })

    it('PerformanceTest_LongTask_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.LongTask = new taskpool.LongTask(simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.LongTask(simpleFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongTask_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'LongTask', 'constructor',
        'constructor(func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskGroup_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.TaskGroup = new taskpool.TaskGroup();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskGroup();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskGroup_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.TaskGroup = new taskpool.TaskGroup("groupTest");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskGroup("groupTest");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'constructor',
        'constructor(name: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskGroup_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let group = new taskpool.TaskGroup();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        group.addTask(simpleFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = group;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'addTask',
        'addTask(func: Function, ...args: FixedArray<Any>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskGroup_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let group = new taskpool.TaskGroup();
      let task = new taskpool.Task("testTask", simpleFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        group.addTask(task);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = group;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'addTask',
        'addTask(task: Task): void', arkTsAveragedTime);
    })

    it('PerformanceTest_SequenceRunner_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.SequenceRunner();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SequenceRunner_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'SequenceRunner', 'constructor',
        'constructor(priority?: Priority)', arkTsAveragedTime);
    })

    it('PerformanceTest_SequenceRunner_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.SequenceRunner = new taskpool.SequenceRunner("seqRunner");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.SequenceRunner("seqRunner");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SequenceRunner_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'SequenceRunner', 'constructor',
        'constructor(name: string, priority?: Priority)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncRunner_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.AsyncRunner = new taskpool.AsyncRunner(4);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.AsyncRunner(4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'constructor',
        'constructor(runningCapacity: int, waitingCapacity?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncRunner_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.AsyncRunner = new taskpool.AsyncRunner("asyncRunner", 4);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.AsyncRunner("asyncRunner", 4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'constructor',
        'constructor(name: string | undefined, runningCapacity: int, waitingCapacity?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskInfo_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.TaskInfo = new taskpool.TaskInfo();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskInfo();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskInfo_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskInfo', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_ThreadInfo_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.ThreadInfo = new taskpool.ThreadInfo();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.ThreadInfo();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ThreadInfo_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'ThreadInfo', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_TaskPoolInfo_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: taskpool.TaskPoolInfo = new taskpool.TaskPoolInfo();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskPoolInfo();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPoolInfo_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskPoolInfo', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // it('PerformanceTest_Task_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let task2 = new taskpool.Task("task2", simpleFunc);
    //   let task1 = new taskpool.Task("task1", simpleFunc);
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     task1.addDependency(task2);
    //     task1.removeDependency(task2);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = task1;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'removeDependency',
    //     'removeDependency(...tasks: Task[]): void', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res = taskpool.execute(simpleFunc);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = taskpool.execute(simpleFunc);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'execute',
    //     'execute(func: Function, ...args: FixedArray<Any>): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let task = new taskpool.Task("testTask", simpleFunc);
    //     taskpool.execute(task);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'execute',
    //     'execute(task: Task): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let task = new taskpool.Task("testTask", simpleFunc);
    //     taskpool.execute(task, taskpool.Priority.MEDIUM);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'execute',
    //     'execute(task: Task, priority: Priority): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let task = new taskpool.Task("testTask", simpleFunc);
    //     let configs: taskpool.Configs = { priority: taskpool.Priority.MEDIUM };
    //     taskpool.execute(task, configs);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0500: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'execute',
    //     'execute(task: Task, configs: Configs): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let group = new taskpool.TaskGroup();
    //   let res = taskpool.execute(group);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = taskpool.execute(group);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0600: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'execute',
    //     'execute(group: TaskGroup): Promise<Array<Any>>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let task = new taskpool.Task("testTask", simpleFunc);
    //   let res = taskpool.executeDelayed(0, task);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = taskpool.executeDelayed(0, task);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'executeDelayed',
    //     'executeDelayed(delayTime: int, task: Task): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let task = new taskpool.Task("testTask", simpleFunc);
    //   let  res = taskpool.executeDelayed(0, task, taskpool.Priority.MEDIUM);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = taskpool.executeDelayed(0, task, taskpool.Priority.MEDIUM);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'executeDelayed',
    //     'executeDelayed(delayTime: int, task: Task, priority: Priority): Promise<Any>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: boolean = false;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let task = new taskpool.Task("testTask", simpleFunc);
    //     res = taskpool.execute(task) != undefined;
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_0900: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'cancel',
    //     'cancel(task: Task): void', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: taskpool.Task | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = taskpool.getTask(i);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_1000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'getTask',
    //     'getTask(taskId: int, taskName?: string): Task | undefined', arkTsAveragedTime);
    // })

    // it('PerformanceTest_taskpool_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: taskpool.LongTask = new taskpool.LongTask("longTask", simpleFunc);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     taskpool.terminateTask(res);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_taskpool_Static_1100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'taskpool', 'terminateTask',
    //     'terminateTask(longTask: LongTask): void', arkTsAveragedTime);
    // })

    // 原因: SequenceRunner/AsyncRunner的execute方法内部会submit task，task提交后无法在循环中重复执行
    // it('PerformanceTest_SequenceRunner_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let seqRunner = new taskpool.SequenceRunner();
    //   let task = new taskpool.Task("testTask", simpleFunc);
    //   let  res = seqRunner.execute(task);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = seqRunner.execute(task);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SequenceRunner_Instance_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'SequenceRunner', 'execute',
    //     'execute(task: Task): Promise<Any>', arkTsAveragedTime);
    // })

    // 原因: AsyncRunner的execute方法内部会submit task，task提交后无法在循环中重复执行
    // it('PerformanceTest_AsyncRunner_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let asyncRunner = new taskpool.AsyncRunner(4);
    //   let task = new taskpool.Task("testTask", simpleFunc);
    //   let res = asyncRunner.execute(task);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = asyncRunner.execute(task);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Instance_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'execute',
    //     'execute(task: Task, priority?: Priority): Promise<Any>', arkTsAveragedTime);
    // })

    // 原因: AsyncRunner的execute方法内部会submit task，task提交后无法在循环中重复执行
    // it('PerformanceTest_AsyncRunner_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let asyncRunner = new taskpool.AsyncRunner(4);
    //   let task = new taskpool.Task("testTask", simpleFunc);
    //   let res = asyncRunner.execute(task, taskpool.Priority.MEDIUM);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = asyncRunner.execute(task, taskpool.Priority.MEDIUM);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Instance_0200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'execute',
    //     'execute(task: Task, priority: Priority): Promise<Any>', arkTsAveragedTime);
    // })
  })
}
