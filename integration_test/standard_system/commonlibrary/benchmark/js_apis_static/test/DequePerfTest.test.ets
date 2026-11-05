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
import { Deque, DequeForEachCb } from '@kit.ArkTS';
import performance from './Performance.util';

export default function DequePerfTest(): void {
  describe('DequePerfTest', () => {
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

    it('PerformanceTest_Deque_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Deque<int> = new Deque<int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Deque<int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_Deque_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertEnd(1);
      let res: int = deque.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. insertFront ====================

    it('PerformanceTest_Deque_InsertFront_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deques: Deque<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        deques.push(new Deque<int>());
      }
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        deques[i].insertFront(i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_InsertFront_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'insertFront',
        'insertFront(element: T): void', arkTsAveragedTime);
    })

    // ==================== 4. insertEnd ====================

    it('PerformanceTest_Deque_InsertEnd_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deques: Deque<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        deques.push(new Deque<int>());
      }
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        deques[i].insertEnd(i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_InsertEnd_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'insertEnd',
        'insertEnd(element: T): void', arkTsAveragedTime);
    })

    // ==================== 5. has ====================

    it('PerformanceTest_Deque_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertFront(99);
      let res: boolean = deque.has(99);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque.has(99);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'has',
        'has(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 6. popFirst ====================

    it('PerformanceTest_Deque_PopFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deques: Deque<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let d = new Deque<int>();
        d.insertEnd(1);
        deques.push(d);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deques[i].popFirst();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_PopFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'popFirst',
        'popFirst(): T', arkTsAveragedTime);
    })

    // ==================== 7. popLast ====================

    it('PerformanceTest_Deque_PopLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deques: Deque<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let d = new Deque<int>();
        d.insertEnd(1);
        deques.push(d);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deques[i].popLast();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_PopLast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'popLast',
        'popLast(): T', arkTsAveragedTime);
    })

    // ==================== 8. getFirst ====================

    it('PerformanceTest_Deque_GetFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertEnd(10);
      let res: int = deque.getFirst();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque.getFirst();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_GetFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'getFirst',
        'getFirst(): T', arkTsAveragedTime);
    })

    // ==================== 9. getLast ====================

    it('PerformanceTest_Deque_GetLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertEnd(20);
      let res: int = deque.getLast();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque.getLast();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_GetLast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'getLast',
        'getLast(): T', arkTsAveragedTime);
    })

    // ==================== 10. forEach ====================

    it('PerformanceTest_Deque_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      for (let j: int = 0; j < 10; j++) {
        deque.insertEnd(j);
      }
      let callback: DequeForEachCb<int> = (value: int, index: int, dequeObj: Deque<int>): void => {
      };
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        deque.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', 'forEach',
        'forEach(callbackFn: DequeForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 11. [index: int] ====================

    it('PerformanceTest_Deque_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertEnd(5);
      deque.insertEnd(10);
      let res: int = deque[1];
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque[1];
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', '[index]',
        '[index: int]: T', arkTsAveragedTime);
    })

    // ==================== 12. $_iterator ====================

    it('PerformanceTest_Deque_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque: Deque<int> = new Deque<int>();
      deque.insertEnd(1);
      let res = deque.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deque.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Deque_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Deque', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}