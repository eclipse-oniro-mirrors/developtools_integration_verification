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
} from '@ohos/hypium';
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import Queue from '@ohos.util.Queue';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function AsyncLinkedConcurrentQueuePerfTest(): void {
  describe('AsyncLinkedConcurrentQueuePerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Queue<number> = new Queue<number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Queue<number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: Queue<number> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@ohos.util', 'Queue', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_Push_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queues: Array<Queue<number>> = [];
        let varObj: number = 0;
        for (let i = 0; i < BASE_COUNT; i++) {
          queues.push(new Queue<number>());
        }
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queues[i].add(varObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Push_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@ohos.util', 'Queue', 'add',
          'add(element: T): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_Pop_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queues: Array<Queue<number>> = [];
        let createQueue: (value: number) => Queue<number> = (value: number): Queue<number> => {
          let queue: Queue<number> = new Queue<number>();
          queue.add(value);
          return queue;
        };
        for (let i = 0; i < BASE_COUNT; i++) {
          queues.push(createQueue(i));
        }
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queues[i].pop();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Pop_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@ohos.util', 'Queue', 'pop',
          'pop(): T', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_GetFirst_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        queue.add(1);
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queue.getFirst();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_GetFirst_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@ohos.util', 'Queue', 'getFirst',
          'getFirst(): T', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_IsEmpty_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<number> = new Queue<number>();
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queue.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_IsEmpty_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@ohos.util', 'Queue', 'length',
          'get length(): number', arkTsAveragedTime);
      done();
      })


  })
}
