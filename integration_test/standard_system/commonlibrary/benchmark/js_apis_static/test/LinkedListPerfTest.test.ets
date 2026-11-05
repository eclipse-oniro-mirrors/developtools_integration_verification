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
import { LinkedList } from '@kit.ArkTS';
import performance from './Performance.util';

export default function LinkedListPerfTest(): void {
  describe('LinkedListPerfTest', () => {
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

    it('PerformanceTest_LinkedList_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkedList<int> = new LinkedList<int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkedList<int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_LinkedList_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      let res: int = linkedList.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. add ====================

    it('PerformanceTest_LinkedList_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedLists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        linkedLists.push(new LinkedList<int>());
      }
      let res: boolean = linkedLists[0].add(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedLists[i].add(i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 4. insert ====================

    it('PerformanceTest_LinkedList_Insert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        lists.push(new LinkedList<int>());
      }
      let res: void = lists[0].insert(0, 1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].insert(0, 1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Insert_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'insert',
        'insert(index: int, element: T): void', arkTsAveragedTime);
    })

    // ==================== 5. addFirst ====================

    it('PerformanceTest_LinkedList_AddFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        lists.push(new LinkedList<int>());
      }
      let res: void = lists[0].addFirst(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].addFirst(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_AddFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'addFirst',
        'addFirst(element: T): void', arkTsAveragedTime);
    })

    // ==================== 6. get ====================

    it('PerformanceTest_LinkedList_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(500);
      let res: int = linkedList.get(0)!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.get(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'get',
        'get(index: int): T', arkTsAveragedTime);
    })

    // ==================== 7. getFirst ====================

    it('PerformanceTest_LinkedList_GetFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(100);
      let res: int = linkedList.getFirst()!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.getFirst()!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getFirst',
        'getFirst(): T', arkTsAveragedTime);
    })

    // ==================== 8. getLast ====================

    it('PerformanceTest_LinkedList_GetLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(200);
      let res: int = linkedList.getLast()!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.getLast()!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetLast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getLast',
        'getLast(): T', arkTsAveragedTime);
    })

    // ==================== 9. has ====================

    it('PerformanceTest_LinkedList_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(123);
      let res: boolean = linkedList.has(123);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.has(123);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'has',
        'has(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 10. getLastIndexOf ====================

    it('PerformanceTest_LinkedList_GetLastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      linkedList.add(2);
      linkedList.add(1);
      let res: int = linkedList.getLastIndexOf(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.getLastIndexOf(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetLastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getLastIndexOf',
        'getLastIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== 11. getIndexOf ====================

    it('PerformanceTest_LinkedList_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      linkedList.add(2);
      let res: int = linkedList.getIndexOf(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.getIndexOf(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getIndexOf',
        'getIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== 12. set ====================

    it('PerformanceTest_LinkedList_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedLists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(10);
        linkedLists.push(l);
      }
      let res: int = linkedLists[0].set(0, 20);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedLists[i].set(0, 20);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'set',
        'set(index: int, element: T): T', arkTsAveragedTime);
    })

    // ==================== 13. remove ====================

    it('PerformanceTest_LinkedList_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(0);
        lists.push(l);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].remove(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'remove',
        'remove(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 14. removeFirstFound ====================

    it('PerformanceTest_LinkedList_RemoveFirstFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeFirstFound(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveFirstFound_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeFirstFound',
        'removeFirstFound(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 15. removeLastFound ====================

    it('PerformanceTest_LinkedList_RemoveLastFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeLastFound(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveLastFound_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeLastFound',
        'removeLastFound(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 16. removeByIndex ====================

    it('PerformanceTest_LinkedList_RemoveByIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeByIndex(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveByIndex_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeByIndex',
        'removeByIndex(index: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 17. removeFirst ====================

    it('PerformanceTest_LinkedList_RemoveFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeFirst()!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeFirst',
        'removeFirst(): T | undefined', arkTsAveragedTime);
    })

    // ==================== 18. removeLast ====================

    it('PerformanceTest_LinkedList_RemoveLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeLast()!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveLast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeLast',
        'removeLast(): T | undefined', arkTsAveragedTime);
    })

    // ==================== 19. clear ====================

    it('PerformanceTest_LinkedList_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: LinkedList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new LinkedList<int>();
        l.add(1);
        lists.push(l);
      }
      let res: void = lists[0].clear();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 20. clone ====================

    it('PerformanceTest_LinkedList_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      let res: LinkedList<int> = linkedList.clone();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.clone();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Clone_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'clone',
        'clone(): LinkedList<T>', arkTsAveragedTime);
    })

    // ==================== 21. convertToArray ====================

    it('PerformanceTest_LinkedList_ConvertToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      let res: Array<int> = linkedList.convertToArray();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.convertToArray();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_ConvertToArray_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'convertToArray',
        'convertToArray(): Array<T>', arkTsAveragedTime);
    })

    // ==================== 22. forEach ====================

    it('PerformanceTest_LinkedList_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      let callback = (value: int, index: int, linkedList: LinkedList<int>): void => {
      };
      let res: void = linkedList.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'forEach',
        'forEach(callbackfn: LinkedListForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 23. $_iterator ====================

    it('PerformanceTest_LinkedList_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList: LinkedList<int> = new LinkedList<int>();
      linkedList.add(1);
      let res = linkedList.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linkedList.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}