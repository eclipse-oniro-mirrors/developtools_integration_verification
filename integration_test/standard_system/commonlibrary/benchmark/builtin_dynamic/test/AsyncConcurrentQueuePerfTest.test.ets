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
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import { Queue } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function AsyncConcurrentQueuePerfTest(): void {
  describe('AsyncConcurrentQueuePerfTest', () => {

    const BASE_COUNT = 1000;
    const ASYNC_BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_AsyncConcurrentQueue_Push_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        let pools: number[] = new Array<number>(ASYNC_BASE_COUNT);
        for (let i: number = 0; i < ASYNC_BASE_COUNT; i++) {
          pools[i] = i;
        }
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < ASYNC_BASE_COUNT; i++) {
          await queue.add(pools[i]);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Queue<number> = queue;
        let arkTsAveragedTime: number = Dtime / ASYNC_BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_Push_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'add',
          'add(element: T): Promise<void>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_Pop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        for (let i: number = 0; i < ASYNC_BASE_COUNT; i++) { queue.add(i); }
        let res: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < ASYNC_BASE_COUNT; i++) {
          res = await queue.pop();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime: number = Dtime / ASYNC_BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_Pop_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'pop',
          'pop(): Promise<Awaited<T>>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_Add_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queues: Queue<number>[] = [];
        let vals: number[] = [];
        for (let i: number = 0; i < BASE_COUNT; i++) {
          queues.push(new Queue<number>());
          vals.push(i);
        }
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = queues[i].add(vals[i]);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_Add_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'add',
          'add(element: T): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_Poll_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queues: Queue<number>[] = [];
        for (let i: number = 0; i < BASE_COUNT; i++) {
          let queue: Queue<number> = new Queue<number>();
          queue.add(1);
          queues.push(queue);
        }
        let res: number | undefined = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = queues[i].pop();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number | undefined = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_Poll_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'pop',
          'poll(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_GetFirst_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        queue.add(1);
        let res: number | undefined = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) { res = queue.getFirst(); }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number | undefined = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_GetFirst_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'getFirst',
          'getFirst(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_IsEmpty_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) { res = (queue.length === 0); }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_IsEmpty_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncConcurrentQueue_Size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        queue.add(1);
        let res: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) { res = queue.length; }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncConcurrentQueue_Size_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Queue', 'length',
          'get length(): int', arkTsAveragedTime);
      done();
      })

  })
}