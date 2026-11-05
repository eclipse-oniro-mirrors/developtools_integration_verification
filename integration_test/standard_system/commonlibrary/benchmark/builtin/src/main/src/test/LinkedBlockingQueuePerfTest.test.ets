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

export default function LinkedBlockingQueuePerfTest(): void {
  describe('LinkedBlockingQueuePerfTest', () => {
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

    // ================================================================
    // 1. LinkedBlockingQueue Constructors
    // ================================================================
    it('PerformanceTest_LinkedBlockingQueue_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new containers.LinkedBlockingQueue<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.LinkedBlockingQueue<number>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new containers.LinkedBlockingQueue<number>(100000);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.LinkedBlockingQueue<number>(100000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'constructor',
        'constructor(capacity: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1];
      let res = new containers.LinkedBlockingQueue<number>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.LinkedBlockingQueue<number>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'constructor',
        'constructor(iterable: Iterable<T>)', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1];
      let res = new containers.LinkedBlockingQueue<number>(100, arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.LinkedBlockingQueue<number>(100, arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'constructor',
        'constructor(capacity: int, iterable: Iterable<T>)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. LinkedBlockingQueue Methods
    // ================================================================
    it('PerformanceTest_LinkedBlockingQueue_Push_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        q.push(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = q;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Push_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'push',
        'push(element: T): void', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_LinkedBlockingQueue_Pop_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      for (let i = 0; i < BASE_COUNT; i++) {
        q.add(i);
      }
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.pop();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Pop_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'pop',
        'pop(): T', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Add_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>(BASE_COUNT + 1);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.add(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Add_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_LinkedBlockingQueue_Poll_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      for (let i = 0; i < BASE_COUNT; i++) {
        q.add(i);
      }
      let res: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.poll();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Poll_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'poll',
        'poll(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_GetFirst_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      q.add(1);
      let res: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.getFirst();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_GetFirst_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'getFirst',
        'getFirst(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_GetEnd_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      q.add(1);
      let res: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.getEnd();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_GetEnd_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'getEnd',
        'getEnd(): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_IsEmpty_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.isEmpty();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_IsEmpty_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Size_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      q.add(1);
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Size_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'size',
        'get size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_Capacity_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.capacity;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_Capacity_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'capacity',
        'get capacity(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_LinkedBlockingQueue_RemainingCapacity_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let q = new containers.LinkedBlockingQueue<number>();
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = q.remainingCapacity();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedBlockingQueue_RemainingCapacity_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'LinkedBlockingQueue', 'remainingCapacity',
        'remainingCapacity(): int', arkTsAveragedTime);
    })

  })
}