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
import performance from './Performance.util';
import { TreeSet, TreeSetForEachCb } from '@kit.ArkTS';
import { TreeSetComparator } from '@kit.ArkTS'

export default function TreeSetPerfTest(): void {
  describe('TreeSetTest', () => {
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

    it('TreeSetPerfTest_Constructor_Default_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 修复：统一使用 string 类型
      let res: TreeSet<string> = new TreeSet<string>()
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TreeSet<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_Constructor_Default_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'constructor',
        'constructor(comparator?: (firstValue: T, secondValue: T) => number)', arkTsAveragedTime);
    })



    it('TreeSetPerfTest_Object_Add_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSets: TreeSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        treeSets.push(new TreeSet<string>());
      }
      let res = treeSets[0].add("a");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSets[i].add("b");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_Object_Add_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'add',
        'add(value: T): boolean', arkTsAveragedTime);
    })

    it('TreeSetPerfTest_Object_Has_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      let res = treeSet.has("a");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.has("a");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_Object_Has_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'has',
        'has(value: T): boolean', arkTsAveragedTime);
    })

    it('TreeSetPerfTest_Object_Remove_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSets: TreeSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new TreeSet<string>();
        s.add("a");
        treeSets.push(s);
      }
      let res = treeSets[0].remove("a");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSets[i].remove("a");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_Object_Remove_0700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'remove',
        'remove(value: T): boolean', arkTsAveragedTime);
    })

    it('TreeSetPerfTest_Object_Values_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      let res = treeSet.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_Object_Values_0900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

    it('TreeSetPerfTest_boolean_isEmpty_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_boolean_isEmpty_1000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })





    it('TreeSetPerfTest_T_getFirstValue_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("apple");
      treeSet.add("zebra");
      let res: string | undefined = treeSet.getFirstValue();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.getFirstValue();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_getFirstValue_1700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'getFirstValue',
        'getFirstValue(): T', arkTsAveragedTime);
    })



    it('TreeSetPerfTest_T_getLastValue_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("apple");
      treeSet.add("zebra");
      let res: string | undefined = treeSet.getLastValue();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.getLastValue();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_getLastValue_2100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'getLastValue',
        'getLastValue(): T', arkTsAveragedTime);
    })









    it('TreeSetPerfTest_T_getLowerValue_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("gander");
      let res: string | undefined = treeSet.getLowerValue("sparrow");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.getLowerValue("sparrow");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_getLowerValue_3500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'getLowerValue',
        'getLowerValue(key: T): T', arkTsAveragedTime);
    })







    it('TreeSetPerfTest_T_getHigherValue_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("gander");
      let res: string | undefined = treeSet.getHigherValue("sparrow");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.getHigherValue("sparrow");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_getHigherValue_4500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'getHigherValue',
        'getHigherValue(key: T): T', arkTsAveragedTime);
    })







    //it('TreeSetPerfTest_T_popFirst_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //  let treeSet: TreeSet<number> = new TreeSet<number>();
    //  for (let i = 0; i < BASE_COUNT + 2; i++) {
    //    treeSet.add(i);
    //  }
    //  treeSet.add(BASE_COUNT + 2)
    //  let res: number | undefined = treeSet.popFirst();
    //  let Stime = Chrono.nanoNow();
    //  for (let i = 0; i < BASE_COUNT; i++) {
    //    res = treeSet.popFirst();
    //  }
    //  let Dtime = Chrono.nanoNow() - Stime;
    //  let res1 = res;
    //  let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
    //  console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_popFirst_5500: '
    //    + arkTsAveragedTime + 'ns');
    //  performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'popFirst',
    //    'popFirst(): T', arkTsAveragedTime);
    //})

    //it('TreeSetPerfTest_T_popLast_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //  let treeSet: TreeSet<number> = new TreeSet<number>();
    //  for (let i = 0; i < BASE_COUNT; i++) {
    //    treeSet.add(i);
    //  }
    //  treeSet.add(BASE_COUNT)
    //  let res: number | undefined = treeSet.popLast();
    //  let Stime = Chrono.nanoNow();
    //  for (let i = 0; i < BASE_COUNT; i++) {
    //    res = treeSet.popLast();
    //  }
    //  let Dtime = Chrono.nanoNow() - Stime;
    //  let res1 = res;
    //  let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
    //  console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_T_popLast_5600: '
    //    + arkTsAveragedTime + 'ns');
    //  performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'popLast',
    //    'popLast(): T', arkTsAveragedTime);
    //})

    it('TreeSetPerfTest_void_clear_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSets: TreeSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new TreeSet<string>();
        s.add("squirrel");
        s.add("sparrow");
        treeSets.push(s);
      }
      let res = treeSets[0].clear()
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSets[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_void_clear_5700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    it('TreeSetPerfTest_void_forEach_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("sparrow");
      treeSet.add("gull");
      let treeSetCb: TreeSetForEachCb<string> = (value: string, key: string, set: TreeSet<string>): void => {
      };
      let res = treeSet.forEach(treeSetCb)
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeSet.forEach(treeSetCb);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeSetPerfTest arkTsAveragedTime TreeSetPerfTest_void_forEach_5900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeset', 'TreeSet', 'forEach',
        'forEach(callbackFn: TreeSetForEachCb<T>): void', arkTsAveragedTime);
    })



  })
}