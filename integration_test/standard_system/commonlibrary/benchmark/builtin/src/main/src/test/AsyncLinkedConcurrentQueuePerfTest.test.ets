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

export default function AsyncLinkedConcurrentQueuePerfTest(): void {
  describe('AsyncLinkedConcurrentQueuePerfTest', () => {

    const BASE_COUNT = 50000;
    const ASYNC_BASE_COUNT = 1000;
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

    // ================================================================
    // 1. LinkedConcurrentQueue — Constructors
    // ================================================================
    it('PerformanceTest_AsyncLinkedConcurrentQueue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.stackless.LinkedConcurrentQueue<Int>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorCapacity_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.stackless.LinkedConcurrentQueue<Int>(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorCapacity_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'constructor',
        'constructor(capacity: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorIterable_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int[] = [];
      for (let i = 0; i < 10; i++) { arr.push(new Int(i as int)); }
      let res: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.stackless.LinkedConcurrentQueue<Int>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorIterable_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'constructor',
        'constructor(iterable: Iterable<T>)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorCapacityIterable_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int[] = [];
      for (let i = 0; i < 10; i++) { arr.push(new Int(i as int)); }
      let res: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(100, arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.stackless.LinkedConcurrentQueue<Int>(100, arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_ConstructorCapacityIterable_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'constructor',
        'constructor(capacity: int, iterable: Iterable<T>)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. LinkedConcurrentQueue — Async Methods
    // ================================================================
    it('PerformanceTest_AsyncLinkedConcurrentQueue_Push_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(ASYNC_BASE_COUNT + 10);
      let varObj = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        await queue.push(varObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = queue;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Push_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'push',
        'async push(element: T): Promise<void>', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_AsyncLinkedConcurrentQueue_Pop_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(ASYNC_BASE_COUNT + 10);
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) { queue.add(new Int(i as int)); }
      let res: Int = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < ASYNC_BASE_COUNT; i++) {
        res = await queue.pop();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / ASYNC_BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Pop_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'pop',
        'async pop(): Promise<Awaited<T>>', arkTsAveragedTime);
    })

    //并发格式不规范
    // ================================================================
    // 3. LinkedConcurrentQueue — Non-blocking Methods
    // ================================================================
    it('PerformanceTest_AsyncLinkedConcurrentQueue_Add_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(BASE_COUNT + 1);
      let vals: Int[] = [];
      for (let i = 0; i < BASE_COUNT; i++) { vals.push(new Int(i as int)); }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.add(vals[i]); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Add_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_AsyncLinkedConcurrentQueue_Poll_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(BASE_COUNT + 1);
      for (let i = 0; i < BASE_COUNT; i++) { queue.add(new Int(1)); }
      let res: Int | undefined = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.poll(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Poll_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'poll',
        'poll(): T | undefined', arkTsAveragedTime);
    })

    // ================================================================
    // 4. LinkedConcurrentQueue — Peek / Query Methods
    // ================================================================
    it('PerformanceTest_AsyncLinkedConcurrentQueue_GetFirst_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(10);
      queue.add(new Int(1));
      let res: Int | undefined = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.getFirst(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_GetFirst_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'getFirst',
        'getFirst(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_GetEnd_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(10);
      queue.add(new Int(1));
      let res: Int | undefined = new Int(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.getEnd(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_GetEnd_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'getEnd',
        'getEnd(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_IsEmpty_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.isEmpty(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_IsEmpty_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_Size_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(10);
      queue.add(new Int(1));
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.size; }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Size_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'size',
        'get size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_Capacity_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(BASE_COUNT);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.capacity; }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_Capacity_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'capacity',
        'get capacity(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLinkedConcurrentQueue_RemainingCapacity_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.stackless.LinkedConcurrentQueue<Int> = new containers.stackless.LinkedConcurrentQueue<Int>(BASE_COUNT);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) { res = queue.remainingCapacity(); }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLinkedConcurrentQueue_RemainingCapacity_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedConcurrentQueue', 'remainingCapacity',
        'remainingCapacity(): int', arkTsAveragedTime);
    })

  })
}
