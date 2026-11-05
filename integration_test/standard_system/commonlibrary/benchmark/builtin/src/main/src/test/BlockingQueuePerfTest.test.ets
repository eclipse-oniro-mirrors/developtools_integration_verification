/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function BlockingQueuePerfTest(): void {
  describe('BlockingQueuePerfTest', () => {
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

    //并发格式不规范
    // ----------------------------------------------------------------
    // 01 push(element: T): void
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Push_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT + 1);
      let vals: Int[] = [];
      for (let i = 0; i < BASE_COUNT; i++) { vals.push(new Int(i as int)); }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { queue.push(vals[i]); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = queue;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Push_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'push', 'push(element: T): void', arkTsAveragedTime);
    })

    //并发格式不规范
    // ----------------------------------------------------------------
    // 02 pop(): T
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Pop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT + 1);
      for (let i = 0; i < BASE_COUNT; i++) { queue.add(new Int(1)); }
      let res: Int = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.pop(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Pop_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'pop', 'pop(): T', arkTsAveragedTime);
    })

    //并发格式不规范
    // ----------------------------------------------------------------
    // 03 add(element: T): boolean
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Add_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT + 1);
      let vals: Int[] = [];
      for (let i = 0; i < BASE_COUNT; i++) { vals.push(new Int(i as int)); }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.add(vals[i]); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Add_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'add', 'add(element: T): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    // ----------------------------------------------------------------
    // 04 poll(): T | undefined
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Poll_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT + 1);
      for (let i = 0; i < BASE_COUNT; i++) { queue.add(new Int(1)); }
      let res: Int | undefined = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.poll(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Poll_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'poll', 'poll(): T | undefined', arkTsAveragedTime);
    })

    // ----------------------------------------------------------------
    // 05 getFirst(): T | undefined
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_GetFirst_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(10);
      queue.add(new Int(1));
      let res: Int | undefined = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.getFirst(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_GetFirst_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'getFirst', 'getFirst(): T | undefined', arkTsAveragedTime);
    })

    // ----------------------------------------------------------------
    // 06 isEmpty(): boolean
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_IsEmpty_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.isEmpty(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_IsEmpty_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'isEmpty', 'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ----------------------------------------------------------------
    // 07 get size(): int
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(10);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.size; }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Size_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'size', 'get size(): int', arkTsAveragedTime);
    })

    // ----------------------------------------------------------------
    // 08 get capacity(): int
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_Capacity_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.capacity; }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_Capacity_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'capacity', 'get capacity(): int', arkTsAveragedTime);
    })

    // ----------------------------------------------------------------
    // 09 remainingCapacity(): int
    // ----------------------------------------------------------------
    it('PerformanceTest_BlockingQueue_RemainingCapacity_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.BlockingQueue<Int> = new containers.ArrayBlockingQueue<Int>(BASE_COUNT);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.remainingCapacity(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BlockingQueue_RemainingCapacity_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'BlockingQueue', 'remainingCapacity', 'remainingCapacity(): int', arkTsAveragedTime);
    })

  })
}