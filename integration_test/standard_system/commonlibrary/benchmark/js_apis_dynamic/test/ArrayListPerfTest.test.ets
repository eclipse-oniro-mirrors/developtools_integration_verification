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
import { ArrayList } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ArrayListPerfTest(): void {
  describe('ArrayListPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== constructor ====================

    it('PerformanceTest_ArrayList_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArrayList<number> = new ArrayList<number>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new ArrayList<number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== length ====================

    it('PerformanceTest_ArrayList_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(1);
        let res: number = arrayList.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Length_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'length',
          'get length(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== add ====================

    it('PerformanceTest_ArrayList_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          lists.push(new ArrayList<number>());
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Add_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'add',
          'add(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== insert ====================

    it('PerformanceTest_ArrayList_Insert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          for (let k = 0; k < 10; k++) {
            a.add(k);
          }
          lists.push(a);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].insert(1, 5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Insert_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'insert',
          'insert(element: T, index: number): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== has ====================

    it('PerformanceTest_ArrayList_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: boolean = arrayList.has(2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.has(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Has_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'has',
          'has(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== getIndexOf ====================

    it('PerformanceTest_ArrayList_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: number = arrayList.getIndexOf(2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.getIndexOf(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getIndexOf',
          'getIndexOf(element: T): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== getLastIndexOf ====================

    it('PerformanceTest_ArrayList_GetLastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: number = arrayList.getLastIndexOf(2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.getLastIndexOf(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetLastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getLastIndexOf',
          'getLastIndexOf(element: T): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== removeByIndex ====================

    it('PerformanceTest_ArrayList_RemoveByIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(0);
          lists.push(a);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].removeByIndex(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_RemoveByIndex_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'removeByIndex',
          'removeByIndex(index: number): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== remove ====================

    it('PerformanceTest_ArrayList_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(0);
          lists.push(a);
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'remove',
          'remove(element: T): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== removeByRange ====================

    it('PerformanceTest_ArrayList_RemoveByRange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(0);
          a.add(1);
          lists.push(a);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].removeByRange(0, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lists[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_RemoveByRange_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'removeByRange',
          'removeByRange(fromIndex: number, toIndex: number): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== replaceAllElements ====================

    it('PerformanceTest_ArrayList_ReplaceAllElements_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(2);
          a.add(4);
          a.add(5);
          a.add(4);
          lists.push(a);
        }
        let cb = (value: number, index: number, arrlist: ArrayList<number>): number => {
          return value;
        };
        let res: void = lists[0].replaceAllElements(cb);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].replaceAllElements(cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ReplaceAllElements_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'replaceAllElements',
          'replaceAllElements(callbackFn: ArrayListReplaceCb<T>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== forEach ====================

    it('PerformanceTest_ArrayList_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let cb = (value: number, index: number, arrlist: ArrayList<number>): void => {
        };
        let res: void = arrayList.forEach(cb);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.forEach(cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ForEach_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'forEach',
          'forEach(callbackFn: ArrayListForEachCb<T>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== sort ====================

    it('PerformanceTest_ArrayList_Sort_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(4); a.add(2); a.add(5); a.add(1);
          lists.push(a);
        }
        let cmp = (a: number, b: number): number => a - b;
        let res: void = lists[0].sort(cmp);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].sort(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Sort_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'sort',
          'sort(comparator: ArrayListComparatorFn<T>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_ArrayList_Sort_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(4); a.add(2); a.add(5); a.add(1);
          lists.push(a);
        }
        let res: void = lists[0].sort();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Sort_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'sort',
          'sort(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== subArrayList ====================

    it('PerformanceTest_ArrayList_SubArrayList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: ArrayList<number> = arrayList.subArrayList(2, 4);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.subArrayList(2, 4);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_SubArrayList_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'subArrayList',
          'subArrayList(fromIndex: number, toIndex: number): ArrayList<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== clear ====================

    it('PerformanceTest_ArrayList_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(2); a.add(4); a.add(5); a.add(4);
          lists.push(a);
        }
        let res: void = lists[0].clear();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Clear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== clone ====================

    it('PerformanceTest_ArrayList_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: ArrayList<number> = arrayList.clone();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.clone();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Clone_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'clone',
          'clone(): ArrayList<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== getCapacity ====================

    it('PerformanceTest_ArrayList_GetCapacity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: number = arrayList.getCapacity();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.getCapacity();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetCapacity_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getCapacity',
          'getCapacity(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== convertToArray ====================

    it('PerformanceTest_ArrayList_ConvertToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: Array<number> = arrayList.convertToArray();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.convertToArray();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ConvertToArray_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'convertToArray',
          'convertToArray(): Array<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== isEmpty ====================

    it('PerformanceTest_ArrayList_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: boolean = arrayList.isEmpty();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.isEmpty();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== [index] ====================

    it('PerformanceTest_ArrayList_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res: number = arrayList[2];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList[2];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', '[index]',
          '[index: number]: T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== increaseCapacityTo ====================

    it('PerformanceTest_ArrayList_IncreaseCapacityTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(2);
          a.add(4);
          a.add(5);
          a.add(4);
          lists.push(a);
        }
        let res: void = lists[0].increaseCapacityTo(8);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].increaseCapacityTo(8);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IncreaseCapacityTo_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'increaseCapacityTo',
          'increaseCapacityTo(newCapacity: number): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== trimToCurrentLength ====================

    it('PerformanceTest_ArrayList_TrimToCurrentLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ArrayList<number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let a = new ArrayList<number>();
          a.add(2);
          a.add(4);
          a.add(5);
          a.add(4);
          lists.push(a);
        }
        let res: void = lists[0].trimToCurrentLength();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lists[i].trimToCurrentLength();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_TrimToCurrentLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'trimToCurrentLength',
          'trimToCurrentLength(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== $_iterator (skipped: not available in 1.1 Dyn) ====================
    /*
    it('PerformanceTest_ArrayList_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let res = arrayList.$_iterator();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrayList.$_iterator();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Iterator_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', '$_iterator',
          '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
    */

  })
}
