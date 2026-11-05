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
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import taskpool from '@ohos.taskpool'

@Concurrent
function simpleFunc(): number {
  return 1;
}

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TaskPoolPerfTest():void {
  describe('TaskPoolPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Task_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.Task = new taskpool.Task("testTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.Task("testTask", simpleFunc);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'constructor',
        'constructor(name: string, func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.Task = new taskpool.Task(simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.Task(simpleFunc);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'constructor',
        'constructor(func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let cb = (): void => {};
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.onEnqueued(cb);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onEnqueued',
        'onEnqueued(callback: CallbackFunction): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.onStartExecution(() => {});
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onStartExecution',
        'onStartExecution(callback: CallbackFunction): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.onExecutionFailed((e: Error) => {});
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onExecutionFailed',
        'onExecutionFailed(callback: CallbackFunctionWithError): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.onExecutionSucceeded(() => {});
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onExecutionSucceeded',
        'onExecutionSucceeded(callback: CallbackFunction): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.onReceiveData(() => {});
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'onReceiveData',
        'onReceiveData(callback?: Function): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.Task("testTask", simpleFunc);
      let doneResult: boolean = false;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        doneResult = res.isDone();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = doneResult;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'isDone',
        'isDone(): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Task_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let tasks: taskpool.Task[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        tasks.push(new taskpool.Task("task" + i, simpleFunc));
      }
      let task2 = new taskpool.Task("task2", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        tasks[i].addDependency(task2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = tasks[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Task_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Task', 'addDependency',
        'addDependency(...tasks: Task[]): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_LongTask_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.LongTask = new taskpool.LongTask("longTask", simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.LongTask("longTask", simpleFunc);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongTask_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'LongTask', 'constructor',
        'constructor(name: string, func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_LongTask_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.LongTask = new taskpool.LongTask(simpleFunc);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.LongTask(simpleFunc);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongTask_Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'LongTask', 'constructor',
        'constructor(func: Function, ...args: FixedArray<Any>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskGroup_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.TaskGroup = new taskpool.TaskGroup();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskGroup();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Constructor_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'constructor',
        'constructor()', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskGroup_Constructor_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.TaskGroup = new taskpool.TaskGroup("groupTest");
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.TaskGroup("groupTest");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Constructor_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'constructor',
        'constructor(name: string)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskGroup_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res = new taskpool.TaskGroup();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.addTask(simpleFunc);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'addTask',
        'addTask(func: Function, ...args: FixedArray<Any>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskGroup_Instance_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let tasks: taskpool.Task[] = new Array<taskpool.Task>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        tasks[i] = new taskpool.Task("testTask", simpleFunc);
      }
      let res = new taskpool.TaskGroup();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res.addTask(tasks[i]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskGroup_Instance_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskGroup', 'addTask',
        'addTask(task: Task): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_SequenceRunner_Constructor_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.SequenceRunner();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SequenceRunner_Constructor_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'SequenceRunner', 'constructor',
        'constructor(priority?: Priority)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_SequenceRunner_Constructor_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.SequenceRunner = new taskpool.SequenceRunner("seqRunner");
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.SequenceRunner("seqRunner");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SequenceRunner_Constructor_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'SequenceRunner', 'constructor',
        'constructor(name: string, priority?: Priority)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_AsyncRunner_Constructor_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.AsyncRunner = new taskpool.AsyncRunner(4);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.AsyncRunner(4);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Constructor_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'constructor',
        'constructor(runningCapacity: number, waitingCapacity?: number)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_AsyncRunner_Constructor_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.AsyncRunner = new taskpool.AsyncRunner("asyncRunner", 4);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new taskpool.AsyncRunner("asyncRunner", 4);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncRunner_Constructor_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncRunner', 'constructor',
        'constructor(name: string | undefined, runningCapacity: number, waitingCapacity?: number)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskInfo_Constructor_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.TaskInfo[] = taskpool.getTaskPoolInfo().taskInfos;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = taskpool.getTaskPoolInfo().taskInfos;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskInfo_Constructor_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskInfo', 'getTaskPoolInfo.taskInfos',
        'getTaskPoolInfo().taskInfos', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ThreadInfo_Constructor_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.ThreadInfo[] = taskpool.getTaskPoolInfo().threadInfos;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = taskpool.getTaskPoolInfo().threadInfos;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ThreadInfo_Constructor_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'ThreadInfo', 'getTaskPoolInfo.threadInfos',
        'getTaskPoolInfo().threadInfos', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_TaskPoolInfo_Constructor_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = taskpool.getTaskPoolInfo();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPoolInfo_Constructor_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'TaskPoolInfo', 'getTaskPoolInfo',
        'getTaskPoolInfo()', arkTsAveragedTime);
      done();
    })

  })
}