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
  describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach
} from "@ohos/hypium";
import { LinkedList } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function LinkedListPerfTest(): void {
  describe('LinkedListPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_LinkedList_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: LinkedList<number> = new LinkedList<number>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new LinkedList<number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_LinkedList_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        let res: number = linkedList.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Length_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'length',
          'get length(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. add ====================

    it('PerformanceTest_LinkedList_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          lists.push(new LinkedList<number>());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].add(i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Add_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'add',
          'add(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. insert ====================

    it('PerformanceTest_LinkedList_Insert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          lists.push(new LinkedList<number>());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].insert(0, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Insert_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'insert',
          'insert(index: number, element: T): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. addFirst ====================

    it('PerformanceTest_LinkedList_AddFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          lists.push(new LinkedList<number>());
        }
        lists[0].addFirst(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].addFirst(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lists[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_AddFirst_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'addFirst',
          'addFirst(element: T): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. get ====================

    it('PerformanceTest_LinkedList_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(500);
        let res: number = linkedList.get(0)!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.get(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Get_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'get',
          'get(index: number): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. getFirst ====================

    it('PerformanceTest_LinkedList_GetFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(100);
        let res: number = linkedList.getFirst()!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.getFirst()!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetFirst_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getFirst',
          'getFirst(): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. getLast ====================

    it('PerformanceTest_LinkedList_GetLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(200);
        let res: number = linkedList.getLast()!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.getLast()!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetLast_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getLast',
          'getLast(): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. has ====================

    it('PerformanceTest_LinkedList_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(123);
        let res: boolean = linkedList.has(123);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.has(123);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Has_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'has',
          'has(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. getLastIndexOf ====================

    it('PerformanceTest_LinkedList_GetLastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(1);
        let res: number = linkedList.getLastIndexOf(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.getLastIndexOf(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetLastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getLastIndexOf',
          'getLastIndexOf(element: T): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. getIndexOf ====================

    it('PerformanceTest_LinkedList_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        linkedList.add(2);
        let res: number = linkedList.getIndexOf(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.getIndexOf(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'getIndexOf',
          'getIndexOf(element: T): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. set ====================

    it('PerformanceTest_LinkedList_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          for (let k = 0; k < 10; k++) {
            l.add(k);
          }
          lists.push(l);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].set(0, 20);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'set',
          'set(index: number, element: T): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. remove ====================

    it('PerformanceTest_LinkedList_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(0);
          lists.push(l);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].remove(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'remove',
          'remove(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. removeFirstFound ====================

    it('PerformanceTest_LinkedList_RemoveFirstFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeFirstFound(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveFirstFound_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeFirstFound',
          'removeFirstFound(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 15. removeLastFound ====================

    it('PerformanceTest_LinkedList_RemoveLastFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeLastFound(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveLastFound_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeLastFound',
          'removeLastFound(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 16. removeByIndex ====================

    it('PerformanceTest_LinkedList_RemoveByIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeByIndex(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveByIndex_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeByIndex',
          'removeByIndex(index: number): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 17. removeFirst ====================

    it('PerformanceTest_LinkedList_RemoveFirst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeFirst()!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveFirst_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeFirst',
          'removeFirst(): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 18. removeLast ====================

    it('PerformanceTest_LinkedList_RemoveLast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeLast()!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_RemoveLast_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'removeLast',
          'removeLast(): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 19. clear ====================

    it('PerformanceTest_LinkedList_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: LinkedList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let l = new LinkedList<number>();
          l.add(1);
          lists.push(l);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lists[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Clear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 20. clone ====================

    it('PerformanceTest_LinkedList_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        let res: LinkedList<number> = linkedList.clone();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.clone();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Clone_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'clone',
          'clone(): LinkedList<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 21. convertToArray ====================

    it('PerformanceTest_LinkedList_ConvertToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        let res: Array<number> = linkedList.convertToArray();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.convertToArray();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_ConvertToArray_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'convertToArray',
          'convertToArray(): Array<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 22. forEach ====================

    it('PerformanceTest_LinkedList_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        let callback = (value: number, index: number, linkedList: LinkedList<number>): void => {
        };
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          linkedList.forEach(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_ForEach_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', 'forEach',
          'forEach(callbackfn: LinkedListForEachCb<T>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 23. $_iterator (skipped: not available in 1.1 Dyn) ====================
    /*
    it('PerformanceTest_LinkedList_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(1);
        let res = linkedList.$_iterator();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = linkedList.$_iterator();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkedList_Iterator_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LinkedList', '$_iterator',
          '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
    */

  })
}
