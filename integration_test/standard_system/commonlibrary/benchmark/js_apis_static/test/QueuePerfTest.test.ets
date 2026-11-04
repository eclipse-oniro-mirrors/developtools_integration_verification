'use static'
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
} from "../../../hypium/index";
import { Queue } from '@kit.ArkTS';
import performance from './Performance.util';

export default function QueuePerfTest(): void {
  describe('QueuePerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_Queue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Queue<string> = new Queue<string>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Queue<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length ====================

    it('PerformanceTest_Queue_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Queue<string> = new Queue<string>();
      queue.add('test');
      let res: int = queue.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. add ====================

    it('PerformanceTest_Queue_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Queue<string> = new Queue<string>();
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.add('v');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 4. pop ====================

    it('PerformanceTest_Queue_Pop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queues: Queue<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let q = new Queue<string>();
        q.add('a');
        queues.push(q);
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queues[i].pop();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_Pop_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'pop',
        'pop(): T', arkTsAveragedTime);
    })

    // ==================== 5. getFirst ====================

    it('PerformanceTest_Queue_GetFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Queue<string> = new Queue<string>();
      queue.add('test');
      let res: string = queue.getFirst();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.getFirst();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_GetFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'getFirst',
        'getFirst(): T', arkTsAveragedTime);
    })

    // ==================== 6. forEach ====================

    it('PerformanceTest_Queue_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Queue<string> = new Queue<string>();
      queue.add('test');
      let callback = (value: string, index: int, q: Queue<string>): void => {
      };
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        queue.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', 'forEach',
        'forEach(callbackfn: QueueForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 7. $_iterator ====================

    it('PerformanceTest_Queue_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Queue<string> = new Queue<string>();
      queue.add('test');
      let res = queue.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Queue_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Queue', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}
