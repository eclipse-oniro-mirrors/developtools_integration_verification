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

export default function ArrayBlockingQueuePerfTest(): void {
  describe('ArrayBlockingQueuePerfTest', () => {

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

    // 01. constructor(capacity: int)
    it('PerformanceTest_ArrayBlockingQueue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: containers.ArrayBlockingQueue<String> = new containers.ArrayBlockingQueue<String>(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        queue = new containers.ArrayBlockingQueue<String>(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = queue;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'constructor', 'constructor(capacity: int)', arkTsAveragedTime);
    })

    // 02. constructor(capacity: int, iterable: Iterable<T>)
    it('PerformanceTest_ArrayBlockingQueue_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<String>();
      list.push("a");
      let queue: containers.ArrayBlockingQueue<String> = new containers.ArrayBlockingQueue<String>(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        queue = new containers.ArrayBlockingQueue<String>(10, list);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = queue;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'constructor', 'constructor(capacity: int, iterable: Iterable<T>)', arkTsAveragedTime);
    })

    //并发格式不规范
    // 03. push(el: T): void
    it('PerformanceTest_ArrayBlockingQueue_Push_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(BASE_COUNT + 1);
      let vals: String[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new String(i.toString()));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        queue.push(vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = queue;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Push_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'push', 'push(el: T): void', arkTsAveragedTime);
    })

    // 04. pop(): T
    it('PerformanceTest_ArrayBlockingQueue_Pop_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(BASE_COUNT + 1);
      for (let i = 0; i < BASE_COUNT; i++) {
        queue.add(new String("1"));
      }
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.pop();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Pop_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'pop', 'pop(): T', arkTsAveragedTime);
    })

    // 05. add(element: T): boolean
    it('PerformanceTest_ArrayBlockingQueue_Add_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(BASE_COUNT + 1);
      let vals: String[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new String(i.toString()));
      }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.add(vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Add_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'add', 'add(element: T): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    // 06. poll(): T | undefined
    it('PerformanceTest_ArrayBlockingQueue_Poll_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(BASE_COUNT + 1);
      for (let i = 0; i < BASE_COUNT; i++) {
        queue.add(new String("1"));
      }
      let res: String | undefined = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.poll();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Poll_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'poll', 'poll(): T | undefined', arkTsAveragedTime);
    })

    // 07. getFirst(): T | undefined
    it('PerformanceTest_ArrayBlockingQueue_GetFirst_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      queue.add(new String("1"));
      let res: String | undefined = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.getFirst();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_GetFirst_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'getFirst', 'getFirst(): T | undefined', arkTsAveragedTime);
    })

    // 08. getEnd(): T | undefined
    it('PerformanceTest_ArrayBlockingQueue_GetEnd_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      queue.add(new String("1"));
      let res: String | undefined = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.getEnd();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_GetEnd_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'getEnd', 'getEnd(): T | undefined', arkTsAveragedTime);
    })

    // 09. size (getter)
    it('PerformanceTest_ArrayBlockingQueue_Size_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Size_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'size', 'get size(): int', arkTsAveragedTime);
    })

    // 10. isEmpty(): boolean
    it('PerformanceTest_ArrayBlockingQueue_IsEmpty_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.isEmpty();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_IsEmpty_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'isEmpty', 'isEmpty(): boolean', arkTsAveragedTime);
    })

    // 11. capacity (getter)
    it('PerformanceTest_ArrayBlockingQueue_Capacity_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.capacity;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_Capacity_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'capacity', 'get capacity(): int', arkTsAveragedTime);
    })

    // 12. remainingCapacity(): int
    it('PerformanceTest_ArrayBlockingQueue_RemainingCapacity_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new containers.ArrayBlockingQueue<String>(10);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = queue.remainingCapacity();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBlockingQueue_RemainingCapacity_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayBlockingQueue', 'remainingCapacity', 'remainingCapacity(): int', arkTsAveragedTime);
    })

  })
}