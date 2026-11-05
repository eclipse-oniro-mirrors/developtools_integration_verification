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
  describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach
} from "@ohos/hypium";
import { taskpool } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

@Concurrent
function concurrentFunc(args: number): number {
  return args + 1;
}

@Concurrent
function concurrentFunc2(args: string): string {
  return args;
}

function normalFunc(args: number): number {
  return args + 1;
}

export default function TaskPoolPerfTest(): void {
  describe('TaskPoolPerfTest', () => {
    const BASE_COUNT = 500;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. Task constructor(func, ...args) ====================

    it('PerformanceTest_TaskPool_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          task = new taskpool.Task(concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = task;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'constructor',
          'constructor(func: Function, ...args: Object[])', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. Task constructor(name, func, ...args) ====================

    it('PerformanceTest_TaskPool_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task('testTask', concurrentFunc, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          task = new taskpool.Task('testTask', concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = task;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'constructor',
          'constructor(name: string, func: Function, ...args: Object[])', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. Task.isCanceled (static) ====================

    it('PerformanceTest_TaskPool_IsCanceled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = taskpool.Task.isCanceled();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = taskpool.Task.isCanceled();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_IsCanceled_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'isCanceled',
          'static isCanceled(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. task.setTransferList ====================

    it('PerformanceTest_TaskPool_SetTransferList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        let buffers: ArrayBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
          buffers.push(new ArrayBuffer(8));
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].setTransferList([buffers[i]]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_SetTransferList_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'setTransferList',
          'setTransferList(transfer?: ArrayBuffer[]): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. task.setCloneList ====================

    it('PerformanceTest_TaskPool_SetCloneList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cloneData: ArrayBuffer = new ArrayBuffer(8);
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].setCloneList([cloneData]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_SetCloneList_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'setCloneList',
          'setCloneList(cloneList: Object[] | ArrayBuffer[]): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. task.onReceiveData ====================

    it('PerformanceTest_TaskPool_OnReceiveData_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let callback = (): void => {};
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].onReceiveData(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_OnReceiveData_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'onReceiveData',
          'onReceiveData(callback?: Function): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. task.addDependency ====================

    it('PerformanceTest_TaskPool_AddDependency_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        let deps: taskpool.Task[] = [];
        for (let j = 0; j <= BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
          deps.push(new taskpool.Task(concurrentFunc, 2));
        }
        tasks[0].addDependency(deps[0]);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 1; i <= BASE_COUNT; i++) {
          tasks[i].addDependency(deps[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_AddDependency_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'addDependency',
          'addDependency(...tasks: Task[]): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. task.removeDependency ====================

    it('PerformanceTest_TaskPool_RemoveDependency_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        let deps: taskpool.Task[] = [];
        for (let j = 0; j <= BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
          deps.push(new taskpool.Task(concurrentFunc, 2));
          tasks[j].addDependency(deps[j]);
        }
        tasks[0].removeDependency(deps[0]);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 1; i <= BASE_COUNT; i++) {
          tasks[i].removeDependency(deps[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_RemoveDependency_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'removeDependency',
          'removeDependency(...tasks: Task[]): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. task.onEnqueued ====================

    it('PerformanceTest_TaskPool_OnEnqueued_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let callback = (): void => {};
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].onEnqueued(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_OnEnqueued_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'onEnqueued',
          'onEnqueued(callback: CallbackFunction): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. task.onStartExecution ====================

    it('PerformanceTest_TaskPool_OnStartExecution_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let callback = (): void => {};
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].onStartExecution(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_OnStartExecution_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'onStartExecution',
          'onStartExecution(callback: CallbackFunction): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. task.onExecutionFailed ====================

    it('PerformanceTest_TaskPool_OnExecutionFailed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let callback = (e: Error): void => {};
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].onExecutionFailed(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_OnExecutionFailed_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'onExecutionFailed',
          'onExecutionFailed(callback: CallbackFunctionWithError): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. task.onExecutionSucceeded ====================

    it('PerformanceTest_TaskPool_OnExecutionSucceeded_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let callback = (): void => {};
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          tasks[i].onExecutionSucceeded(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = tasks[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_OnExecutionSucceeded_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'onExecutionSucceeded',
          'onExecutionSucceeded(callback: CallbackFunction): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. task.isDone ====================

    it('PerformanceTest_TaskPool_IsDone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: boolean = task.isDone();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.isDone();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_IsDone_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'isDone',
          'isDone(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. task.name (attribute) ====================

    it('PerformanceTest_TaskPool_Name_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task('myTask', concurrentFunc, 1);
        let res: string = task.name;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.name;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_Name_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'name',
          'get name: string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 15. task.taskId (attribute) ====================

    it('PerformanceTest_TaskPool_TaskId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: number = task.taskId;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.taskId;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskId_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'taskId',
          'get taskId: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 16. task.function (attribute) ====================

    it('PerformanceTest_TaskPool_Function_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: Function = task.function;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.function;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_Function_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'function',
          'get function: Function', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 17. task.totalDuration (attribute) ====================

    it('PerformanceTest_TaskPool_TotalDuration_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: number = task.totalDuration;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.totalDuration;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TotalDuration_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'totalDuration',
          'get totalDuration: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 18. task.ioDuration (attribute) ====================

    it('PerformanceTest_TaskPool_IoDuration_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: number = task.ioDuration;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.ioDuration;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_IoDuration_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'ioDuration',
          'get ioDuration: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 19. task.cpuDuration (attribute) ====================

    it('PerformanceTest_TaskPool_CpuDuration_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.Task(concurrentFunc, 1);
        let res: number = task.cpuDuration;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = task.cpuDuration;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_CpuDuration_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Task', 'cpuDuration',
          'get cpuDuration: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 20. taskpool.isConcurrent ====================

    it('PerformanceTest_TaskPool_IsConcurrent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = taskpool.isConcurrent(concurrentFunc);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = taskpool.isConcurrent(concurrentFunc);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_IsConcurrent_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'taskpool', 'isConcurrent',
          'isConcurrent(func: Function): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 21. taskpool.getTaskPoolInfo ====================

    it('PerformanceTest_TaskPool_GetTaskPoolInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = taskpool.getTaskPoolInfo();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_GetTaskPoolInfo_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'taskpool', 'getTaskPoolInfo',
          'getTaskPoolInfo(): TaskPoolInfo', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 22. TaskGroup constructor() ====================

    it('PerformanceTest_TaskPool_TaskGroupConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          group = new taskpool.TaskGroup();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = group;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskGroupConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'TaskGroup', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 23. TaskGroup constructor(name) ====================

    it('PerformanceTest_TaskPool_TaskGroupConstructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup('testGroup');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          group = new taskpool.TaskGroup('testGroup');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = group;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskGroupConstructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'TaskGroup', 'constructor',
          'constructor(name: string)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 24. taskGroup.addTask(func, ...args) ====================

    it('PerformanceTest_TaskPool_TaskGroupAddTask_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let groups: taskpool.TaskGroup[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          groups.push(new taskpool.TaskGroup());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          groups[i].addTask(concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = groups[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskGroupAddTask_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'TaskGroup', 'addTask',
          'addTask(func: Function, ...args: Object[]): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 25. taskGroup.addTask(task) ====================

    it('PerformanceTest_TaskPool_TaskGroupAddTask_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let groups: taskpool.TaskGroup[] = [];
        let tasks: taskpool.Task[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          groups.push(new taskpool.TaskGroup());
          tasks.push(new taskpool.Task(concurrentFunc, 1));
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          groups[i].addTask(tasks[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = groups[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskGroupAddTask_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'TaskGroup', 'addTask',
          'addTask(task: Task): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 26. TaskGroup.name (attribute) ====================

    it('PerformanceTest_TaskPool_TaskGroupName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup('myGroup');
        let res: string = group.name;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = group.name;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_TaskGroupName_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'TaskGroup', 'name',
          'get name: string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 27. SequenceRunner constructor() ====================

    it('PerformanceTest_TaskPool_SequenceRunnerConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          runner = new taskpool.SequenceRunner();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = runner;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_SequenceRunnerConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SequenceRunner', 'constructor',
          'constructor(priority?: Priority)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 28. SequenceRunner constructor(priority) ====================

    it('PerformanceTest_TaskPool_SequenceRunnerConstructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          runner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = runner;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_SequenceRunnerConstructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SequenceRunner', 'constructor',
          'constructor(priority?: Priority)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 29. LongTask constructor ====================

    it('PerformanceTest_TaskPool_LongTaskConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.LongTask = new taskpool.LongTask(concurrentFunc, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          task = new taskpool.LongTask(concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = task;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_LongTaskConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LongTask', 'constructor',
          'constructor(func: Function, ...args: Object[])', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 30. GenericsTask constructor(func, ...args) ====================

    it('PerformanceTest_TaskPool_GenericsTaskConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(concurrentFunc, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          task = new taskpool.GenericsTask<[number], number>(concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = task;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_GenericsTaskConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'GenericsTask', 'constructor',
          'constructor(func: (...args: A) => R | Promise<R>, ...args: A)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 31. GenericsTask constructor(name, func, ...args) ====================

    it('PerformanceTest_TaskPool_GenericsTaskConstructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let task: taskpool.Task = new taskpool.GenericsTask<[number], number>('genTask', concurrentFunc, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          task = new taskpool.GenericsTask<[number], number>('genTask', concurrentFunc, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = task;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_GenericsTaskConstructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'GenericsTask', 'constructor',
          'constructor(name: string, func: (...args: A) => R | Promise<R>, ...args: A)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 32. AsyncRunner constructor(runningCapacity) ====================

    it('PerformanceTest_TaskPool_AsyncRunnerConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          runner = new taskpool.AsyncRunner(5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = runner;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_AsyncRunnerConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncRunner', 'constructor',
          'constructor(runningCapacity: number, waitingCapacity?: number)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 33. AsyncRunner constructor(name, runningCapacity) ====================

    it('PerformanceTest_TaskPool_AsyncRunnerConstructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner('asyncRunner', 5, 5);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          runner = new taskpool.AsyncRunner('asyncRunner', 5, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = runner;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TaskPool_AsyncRunnerConstructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncRunner', 'constructor',
          'constructor(name: string, runningCapacity: number, waitingCapacity?: number)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
  })
}
