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
import { Queue } from '@kit.ArkTS';
import { Deque } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ArrayBlockingQueuePerfTest(): void {
  describe('ArrayBlockingQueuePerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ArrayBlockingQueue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<string> = new Queue<string>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          queue = new Queue<string>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = queue;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Queue', 'constructor', 'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ArrayBlockingQueue_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let items: Array<string> = new Array<string>(BASE_COUNT);
        for (let j = 0; j < BASE_COUNT; j++) {
          items[j] = "a";
        }
        let queue: Queue<string> = new Queue<string>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          queue.add(items[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = queue;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Queue', 'add', 'add(element: T): boolean', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_ArrayBlockingQueue_Pop_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<string> = new Queue<string>();
        for (let i = 0; i < BASE_COUNT; i++) {
          queue.add("1");
        }
        let res: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queue.pop();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Pop_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Queue', 'pop', 'pop(): T', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_ArrayBlockingQueue_GetFirst_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<string> = new Queue<string>();
        queue.add("1");
        let res: string | undefined = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queue.getFirst();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_GetFirst_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Queue', 'getFirst', 'getFirst(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ArrayBlockingQueue_GetEnd_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("1");
        let res: string | undefined = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = deque.getLast();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_GetEnd_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Deque', 'getLast', 'getLast(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ArrayBlockingQueue_Size_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let queue: Queue<string> = new Queue<string>();
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = queue.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Size_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'Queue', 'length', 'length: number', arkTsAveragedTime);
      done();
      })


  })
}
