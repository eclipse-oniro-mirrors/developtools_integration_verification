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
import { List } from '@kit.ArkTS';
import performance from './Performance.util';

export default function ListPerfTest(): void {
  describe('ListPerfTest', () => {
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

    it('PerformanceTest_List_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: List<int> = new List<int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new List<int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_List_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let res: int = list.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. add ====================

    it('PerformanceTest_List_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      let res: boolean = list.add(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.add(i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 4. insert ====================

    it('PerformanceTest_List_Insert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        lists.push(new List<int>());
      }
      let res: void = lists[0].insert(0, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].insert(0, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Insert_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'insert',
        'insert(element: T, index: int): void', arkTsAveragedTime);
    })

    // ==================== 5. has ====================

    it('PerformanceTest_List_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(123);
      let res: boolean = list.has(123);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.has(123);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'has',
        'has(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 6. get ====================

    it('PerformanceTest_List_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(500);
      let res: int = list.get(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.get(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'get',
        'get(index: int): T', arkTsAveragedTime);
    })

    // ==================== 7. getLastIndexOf ====================

    it('PerformanceTest_List_GetLastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(2);
      let res: int = list.getLastIndexOf(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.getLastIndexOf(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_GetLastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'getLastIndexOf',
        'getLastIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== 8. getIndexOf ====================

    it('PerformanceTest_List_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(2);
      let res: int = list.getIndexOf(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.getIndexOf(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'getIndexOf',
        'getIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== 9. equal ====================

    it('PerformanceTest_List_Equal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list1: List<int> = new List<int>();
      list1.add(1);
      let list2: List<int> = new List<int>();
      list2.add(1);
      let res: boolean = list1.equal(list2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list1.equal(list2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Equal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'equal',
        'equal(obj: RecordData): boolean', arkTsAveragedTime);
    })

    // ==================== 10. removeByIndex ====================

    it('PerformanceTest_List_RemoveByIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_RemoveByIndex_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'removeByIndex',
        'removeByIndex(index: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 11. remove ====================

    it('PerformanceTest_List_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'remove',
        'remove(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== 12. replaceAllElements ====================

    it('PerformanceTest_List_ReplaceAllElements_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
        l.add(1);
        lists.push(l);
      }
      let callback = (value: int, index: int, listObj: List<int>): int => {
        return value;
      };
      let res: void = lists[0].replaceAllElements(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].replaceAllElements(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_ReplaceAllElements_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'replaceAllElements',
        'replaceAllElements(callbackfn: ListReplaceCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 13. forEach ====================

    it('PerformanceTest_List_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let callback = (value: int, index: int, listObj: List<int>): void => {
      };
      let res: void = list.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'forEach',
        'forEach(callbackfn: ListForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 14. sort ====================

    it('PerformanceTest_List_Sort_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
        l.add(4);
        l.add(2);
        l.add(5);
        l.add(1);
        lists.push(l);
      }
      let comparator = (a: int, b: int): double => {
        return (a - b).toDouble();
      };
      let res: void = lists[0].sort(comparator);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].sort(comparator);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Sort_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'sort',
        'sort(comparator: ListComparatorFn<T>): void', arkTsAveragedTime);
    })

    // ==================== 15. getSubList ====================

    it('PerformanceTest_List_GetSubList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      list.add(2);
      list.add(3);
      let res: List<int> = list.getSubList(0, 2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.getSubList(0, 2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_GetSubList_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'getSubList',
        'getSubList(fromIndex: int, toIndex: int): List<T>', arkTsAveragedTime);
    })

    // ==================== 16. clear ====================

    it('PerformanceTest_List_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 17. set ====================

    it('PerformanceTest_List_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lists: List<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let l = new List<int>();
        l.add(10);
        lists.push(l);
      }
      let res: int = lists[0].set(0, 20);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].set(0, 20);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'set',
        'set(index: int, element: T): T', arkTsAveragedTime);
    })

    // ==================== 18. convertToArray ====================

    it('PerformanceTest_List_ConvertToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let res: Array<int> = list.convertToArray();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.convertToArray();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_ConvertToArray_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'convertToArray',
        'convertToArray(): Array<T>', arkTsAveragedTime);
    })

    // ==================== 19. isEmpty ====================

    it('PerformanceTest_List_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      let res: boolean = list.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 20. getFirst ====================

    it('PerformanceTest_List_GetFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let res: int = list.getFirst();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.getFirst();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_GetFirst_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'getFirst',
        'getFirst(): T', arkTsAveragedTime);
    })

    // ==================== 21. getLast ====================

    it('PerformanceTest_List_GetLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let res: int = list.getLast();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.getLast();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_GetLast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', 'getLast',
        'getLast(): T', arkTsAveragedTime);
    })

    // ==================== 22. [index: int] (Index Access) ====================

    it('PerformanceTest_List_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(5);
      let res: int = list[0];
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list[0];
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', '[index]',
        '[index: int]: T', arkTsAveragedTime);
    })

    // ==================== 23. $_iterator ====================

    it('PerformanceTest_List_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: List<int> = new List<int>();
      list.add(1);
      let res = list.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_List_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'List', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}