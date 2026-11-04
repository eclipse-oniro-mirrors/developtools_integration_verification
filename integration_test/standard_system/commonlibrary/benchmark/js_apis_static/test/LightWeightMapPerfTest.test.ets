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
import { LightWeightMap } from '@kit.ArkTS';
import performance from './Performance.util';

export default function LightWeightMapPerfTest(): void {
  describe('LightWeightMapPerfTest', (): void => {
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

    it('PerformanceTest_LightWeightMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LightWeightMap<string, int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_LightWeightMap_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res: int = lightWeightMap.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_LightWeightMap_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      let res: boolean = lightWeightMap.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 4. hasKey ====================

    it('PerformanceTest_LightWeightMap_HasKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('testKey', 100);
      let res: boolean = lightWeightMap.hasKey('testKey');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.hasKey('testKey');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasKey_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasKey',
        'hasKey(key: K): boolean', arkTsAveragedTime);
    })

    // ==================== 5. hasValue ====================

    it('PerformanceTest_LightWeightMap_HasValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('testKey', 200);
      let res: boolean = lightWeightMap.hasValue(200);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.hasValue(200);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasValue',
        'hasValue(value: V): boolean', arkTsAveragedTime);
    })

    // ==================== 6. hasAll ====================

    it('PerformanceTest_LightWeightMap_HasAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map1: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      map1.set('a', 1);
      let map2: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      map2.set('a', 1);
      let res: boolean = map1.hasAll(map2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map1.hasAll(map2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasAll',
        'hasAll(map: LightWeightMap<K, V>): boolean', arkTsAveragedTime);
    })

    // ==================== 7. get ====================

    it('PerformanceTest_LightWeightMap_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('key', 300);
      let res: int = lightWeightMap.get('key')!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.get('key')!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'get',
        'get(key: K): V', arkTsAveragedTime);
    })

    // ==================== 8. set ====================

    it('PerformanceTest_LightWeightMap_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        maps.push(new LightWeightMap<string, int>());
      }
      let res: Object = maps[0].set('0', 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].set(i.toString(), i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'set',
        'set(key: K, value: V): Object', arkTsAveragedTime);
    })

    // ==================== 9. remove ====================

    it('PerformanceTest_LightWeightMap_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new LightWeightMap<string, int>();
        m.set('k', 1);
        maps.push(m);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].remove('k')!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'remove',
        'remove(key: K): V', arkTsAveragedTime);
    })

    // ==================== 10. removeAt ====================

    it('PerformanceTest_LightWeightMap_RemoveAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new LightWeightMap<string, int>();
        m.set('k', 1);
        maps.push(m);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].removeAt(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_RemoveAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'removeAt',
        'removeAt(index: int): boolean', arkTsAveragedTime);
    })

    // ==================== 11. clear ====================

    it('PerformanceTest_LightWeightMap_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new LightWeightMap<string, int>();
        m.set('a', 1);
        maps.push(m);
      }
      let res: void = maps[0].clear();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 12. setAll ====================

    it('PerformanceTest_LightWeightMap_SetAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      srcMap.set('1', 10);
      srcMap.set('2', 20);
      let targets: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        targets.push(new LightWeightMap<string, int>());
      }
      let res: void = targets[0].setAll(srcMap);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = targets[i].setAll(srcMap);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_SetAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'setAll',
        'setAll(map: LightWeightMap<K, V>): void', arkTsAveragedTime);
    })

    // ==================== 13. getKeyAt ====================

    it('PerformanceTest_LightWeightMap_GetKeyAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res: string = lightWeightMap.getKeyAt(0)!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.getKeyAt(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetKeyAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getKeyAt',
        'getKeyAt(index: int): K', arkTsAveragedTime);
    })

    // ==================== 14. getValueAt ====================

    it('PerformanceTest_LightWeightMap_GetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 10);
      let res: int = lightWeightMap.getValueAt(0)!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.getValueAt(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetValueAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getValueAt',
        'getValueAt(index: int): V', arkTsAveragedTime);
    })

    // ==================== 15. setValueAt ====================

    it('PerformanceTest_LightWeightMap_SetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let setMaps: LightWeightMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new LightWeightMap<string, int>();
        m.set('a', 10);
        setMaps.push(m);
      }
      let res: boolean = setMaps[0].setValueAt(0, 20);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = setMaps[i].setValueAt(0, 20);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_SetValueAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'setValueAt',
        'setValueAt(index: int, value: V): boolean', arkTsAveragedTime);
    })

    // ==================== 16. getIndexOfKey ====================

    it('PerformanceTest_LightWeightMap_GetIndexOfKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('target', 55);
      let res: int = lightWeightMap.getIndexOfKey('target');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.getIndexOfKey('target');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetIndexOfKey_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getIndexOfKey',
        'getIndexOfKey(key: K): int', arkTsAveragedTime);
    })

    // ==================== 17. getIndexOfValue ====================

    it('PerformanceTest_LightWeightMap_GetIndexOfValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 888);
      let res: int = lightWeightMap.getIndexOfValue(888);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.getIndexOfValue(888);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetIndexOfValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getIndexOfValue',
        'getIndexOfValue(value: V): int', arkTsAveragedTime);
    })

    // ==================== 18. toString ====================

    it('PerformanceTest_LightWeightMap_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res: string = lightWeightMap.toString();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.toString();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_ToString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    // ==================== 19. forEach ====================

    it('PerformanceTest_LightWeightMap_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      for (let j: int = 0; j < 10; j++) {
        lightWeightMap.set('k' + j.toString(), j);
      }
      let callback = (value: int, key: string, map: LightWeightMap<string, int>): void => {
      };
      let res: void = lightWeightMap.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'forEach',
        'forEach(callbackFn: (value: V, key?: K, map?: LightWeightMap<K, V>) => void): void', arkTsAveragedTime);
    })

    // ==================== 20. $_iterator ====================

    it('PerformanceTest_LightWeightMap_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res = lightWeightMap.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', '$_iterator',
        '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    // ==================== 21. increaseCapacityTo ====================

    it('PerformanceTest_LightWeightMap_IncreaseCapacityTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      let res: void = lightWeightMap.increaseCapacityTo(10);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.increaseCapacityTo(10);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_IncreaseCapacityTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'increaseCapacityTo',
        'increaseCapacityTo(minimumCapacity: int): void', arkTsAveragedTime);
    })

    // ==================== 22. keys ====================

    it('PerformanceTest_LightWeightMap_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res = lightWeightMap.keys();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.keys();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Keys_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
    })

    // ==================== 23. values ====================

    it('PerformanceTest_LightWeightMap_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res = lightWeightMap.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'values',
        'values(): IterableIterator<V>', arkTsAveragedTime);
    })

    // ==================== 24. entries ====================

    it('PerformanceTest_LightWeightMap_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
      lightWeightMap.set('a', 1);
      let res = lightWeightMap.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightMap.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'entries',
        'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

  })
}