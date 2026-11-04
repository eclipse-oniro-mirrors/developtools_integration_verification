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
import { ArrayList, ArrayListForEachCb, ArrayListReplaceCb, ArrayListComparatorFn } from '@kit.ArkTS';
import performance from './Performance.util';

export default function ArrayListPerfTest(): void {
  describe('ArrayListPerfTest', (): void => {
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

    // ==================== constructor ====================

    it('PerformanceTest_ArrayList_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: ArrayList<int> = new ArrayList<int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayList<int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== length ====================

    it('PerformanceTest_ArrayList_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(1);
      let res: int = arrayList.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== add ====================

    it('PerformanceTest_ArrayList_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        lists.push(new ArrayList<int>());
      }
      let res: boolean = lists[0].add(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].add(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'add',
        'add(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== insert ====================

    it('PerformanceTest_ArrayList_Insert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(0);
        lists.push(a);
      }
      let res: void = lists[0].insert(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        lists[i].insert(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Insert_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'insert',
        'insert(element: T, index: int): void', arkTsAveragedTime);
    })

    // ==================== has ====================

    it('PerformanceTest_ArrayList_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: boolean = arrayList.has(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.has(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'has',
        'has(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== getIndexOf ====================

    it('PerformanceTest_ArrayList_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: int = arrayList.getIndexOf(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.getIndexOf(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getIndexOf',
        'getIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== getLastIndexOf ====================

    it('PerformanceTest_ArrayList_GetLastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: int = arrayList.getLastIndexOf(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.getLastIndexOf(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetLastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getLastIndexOf',
        'getLastIndexOf(element: T): int', arkTsAveragedTime);
    })

    // ==================== removeByIndex ====================

    it('PerformanceTest_ArrayList_RemoveByIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(0);
        lists.push(a);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeByIndex(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_RemoveByIndex_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'removeByIndex',
        'removeByIndex(index: int): T', arkTsAveragedTime);
    })

    // ==================== remove ====================

    it('PerformanceTest_ArrayList_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(0);
        lists.push(a);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].remove(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'remove',
        'remove(element: T): boolean', arkTsAveragedTime);
    })

    // ==================== removeByRange ====================

    it('PerformanceTest_ArrayList_RemoveByRange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(0);
        a.add(1);
        lists.push(a);
      }
      let res: void = lists[0].removeByRange(0, 1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].removeByRange(0, 1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_RemoveByRange_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'removeByRange',
        'removeByRange(fromIndex: int, toIndex: int): void', arkTsAveragedTime);
    })

    // ==================== replaceAllElements ====================

    it('PerformanceTest_ArrayList_ReplaceAllElements_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(2);
        a.add(4);
        a.add(5);
        a.add(4);
        lists.push(a);
      }
      let cb: ArrayListReplaceCb<int> = (value: int, index: int, arrlist: ArrayList<int>): int => {
        return value;
      };
      let res: void = lists[0].replaceAllElements(cb);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        lists[i].replaceAllElements(cb);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ReplaceAllElements_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'replaceAllElements',
        'replaceAllElements(callbackFn: ArrayListReplaceCb<T>): void', arkTsAveragedTime);
    })

    // ==================== forEach ====================

    it('PerformanceTest_ArrayList_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let cb: ArrayListForEachCb<int> = (value: int, index: int, arrlist: ArrayList<int>): void => {
      };
      let res: void = arrayList.forEach(cb);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.forEach(cb);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'forEach',
        'forEach(callbackFn: ArrayListForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== sort ====================

    it('PerformanceTest_ArrayList_Sort_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(4); a.add(2); a.add(5); a.add(1);
        lists.push(a);
      }
      let cmp: ArrayListComparatorFn<int> = (a: int, b: int): double => a - b;
      let res: void = lists[0].sort(cmp);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].sort(cmp);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Sort_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'sort',
        'sort(comparator: ArrayListComparatorFn<T>): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayList_Sort_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(4); a.add(2); a.add(5); a.add(1);
        lists.push(a);
      }
      let res: void = lists[0].sort();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].sort();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Sort_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'sort',
        'sort(): void', arkTsAveragedTime);
    })

    // ==================== subArrayList ====================

    it('PerformanceTest_ArrayList_SubArrayList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: ArrayList<int> = arrayList.subArrayList(2, 4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.subArrayList(2, 4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_SubArrayList_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'subArrayList',
        'subArrayList(fromIndex: int, toIndex: int): ArrayList<T>', arkTsAveragedTime);
    })

    // ==================== clear ====================

    it('PerformanceTest_ArrayList_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(2); a.add(4); a.add(5); a.add(4);
        lists.push(a);
      }
      let res: void = lists[0].clear();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== clone ====================

    it('PerformanceTest_ArrayList_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: ArrayList<int> = arrayList.clone();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.clone();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Clone_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'clone',
        'clone(): ArrayList<T>', arkTsAveragedTime);
    })

    // ==================== getCapacity ====================

    it('PerformanceTest_ArrayList_GetCapacity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: int = arrayList.getCapacity();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.getCapacity();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_GetCapacity_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'getCapacity',
        'getCapacity(): int', arkTsAveragedTime);
    })

    // ==================== convertToArray ====================

    it('PerformanceTest_ArrayList_ConvertToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: Array<int> = arrayList.convertToArray();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.convertToArray();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_ConvertToArray_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'convertToArray',
        'convertToArray(): Array<T>', arkTsAveragedTime);
    })

    // ==================== isEmpty ====================

    it('PerformanceTest_ArrayList_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: boolean = arrayList.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== [index] ====================

    it('PerformanceTest_ArrayList_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res: int = arrayList[2];
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList[2];
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', '[index]',
        '[index: int]: T', arkTsAveragedTime);
    })

    // ==================== increaseCapacityTo ====================

    it('PerformanceTest_ArrayList_IncreaseCapacityTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(2);
        a.add(4);
        a.add(5);
        a.add(4);
        lists.push(a);
      }
      let res: void = lists[0].increaseCapacityTo(8);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].increaseCapacityTo(8);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_IncreaseCapacityTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'increaseCapacityTo',
        'increaseCapacityTo(newCapacity: int): void', arkTsAveragedTime);
    })

    // ==================== trimToCurrentLength ====================

    it('PerformanceTest_ArrayList_TrimToCurrentLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lists: ArrayList<int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let a = new ArrayList<int>();
        a.add(2);
        a.add(4);
        a.add(5);
        a.add(4);
        lists.push(a);
      }
      let res: void = lists[0].trimToCurrentLength();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lists[i].trimToCurrentLength();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_TrimToCurrentLength_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', 'trimToCurrentLength',
        'trimToCurrentLength(): void', arkTsAveragedTime);
    })

    // ==================== $_iterator ====================

    it('PerformanceTest_ArrayList_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<int> = new ArrayList<int>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      let res = arrayList.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrayList.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayList_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArrayList', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}
