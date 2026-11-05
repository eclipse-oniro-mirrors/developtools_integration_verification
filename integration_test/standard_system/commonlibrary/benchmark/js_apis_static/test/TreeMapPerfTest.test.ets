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
import { TreeMap, TreeMapComparator, TreeMapForEachCb } from '@kit.ArkTS';

export default function TreeMapPerfTest(): void {
  describe('TreeMapPerfTest', () => {
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

    it('TreeMapPerfTest_Object_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      let res = treeMap.set("key1", "value1");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.set("key" + i, "value" + i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_Set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'set',
        'set(key: K, value: V): V', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Object_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.get("key500");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.get("key500");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_Get_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'get',
        'get(key: K): V | undefined', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Object_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMapCb: TreeMapComparator<string> = (firstValue: string, secondValue: string): number => {
        return firstValue.localeCompare(secondValue);
      };
      let res = new TreeMap<string, string>(treeMapCb);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TreeMap<string, string>(treeMapCb);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'constructor',
        'constructor(comparator?: TreeMapComparator<K>)', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Boolean_IsEmpty_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      let res = treeMap.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Boolean_IsEmpty_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Boolean_HasKey_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.hasKey("key500");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.hasKey("key500");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Boolean_HasKey_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'hasKey',
        'hasKey(key: K): boolean', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Boolean_HasValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.hasValue("value500");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.hasValue("value500");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Boolean_HasValue_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'hasValue',
        'hasValue(value: V): boolean', arkTsAveragedTime);
    })



    it('TreeMapPerfTest_Void_SetAll_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sourceMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        sourceMap.set("key" + i, "value" + i);
      }
      let targets: TreeMap<string, string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        targets.push(new TreeMap<string, string>());
      }
      let res = targets[0].setAll(sourceMap);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = targets[i].setAll(sourceMap);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Void_SetAll_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'setAll',
        'setAll(map: TreeMap<K, V>): void', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Object_Remove_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMaps: TreeMap<string, string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new TreeMap<string, string>();
        for (let k = 0; k < 10; k++) {
          m.set("key" + k, "value" + k);
        }
        treeMaps.push(m);
      }

      let res = treeMaps[0].remove("key500");
      let Stime = Chrono.nanoNow();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMaps[i].remove("key" + (i % 10));
      }

      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_Remove_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'remove',
        'remove(key: K): V', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Object_GetLowerKey_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set(i, "value" + i);
      }
      let res = treeMap.getLowerKey(5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.getLowerKey(5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_GetLowerKey_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'getLowerKey',
        'getLowerKey(key: K): K', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Object_GetHigherKey_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set(i, "value" + i);
      }
      let res = treeMap.getHigherKey(5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.getHigherKey(5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Object_GetHigherKey_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'getHigherKey',
        'getHigherKey(key: K): K', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Boolean_Replace_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.replace("key500", "newValue500");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.replace("key500", "newValue500");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Boolean_Replace_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'replace',
        'replace(key: K, newValue: V): boolean', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Void_Clear_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.clear();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Void_Clear_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Iterator_Keys_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.keys();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.keys();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Iterator_Keys_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Iterator_Values_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Iterator_Values_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'values',
        'values(): IterableIterator<V>', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Void_ForEach_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let callbackFn = (value?: string, key?: string): void => {
      };
      let res = treeMap.forEach(callbackFn);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        treeMap.forEach(callbackFn);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Void_ForEach_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'forEach',
        'forEach(callbackFn: (value?: V, key?: K, map?: TreeMap<K, V>) => void, thisArg?: Object): void', arkTsAveragedTime);
    })


    it('TreeMapPerfTest_Iterator_Entries_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Iterator_Entries_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'entries',
        'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Iterator_SymbolIterator_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }

      let res = treeMap.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;

      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TpreeMapPerfTest_Iterator_SymbolIterator_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', 'Symbol.iterator',
        '[Symbol.iterator](): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    it('TreeMapPerfTest_Iterator_Iterator_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, string>();
      for (let i = 0; i < 10; i++) {
        treeMap.set("key" + i, "value" + i);
      }
      let res = treeMap.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = treeMap.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsTreeMapPerfTest arkTsAveragedTime TreeMapPerfTest_Iterator_Iterator_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.treeMap', 'TreeMap', '$_iterator',
        '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

  })
}
