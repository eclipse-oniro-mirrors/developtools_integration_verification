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
import { LightWeightMap } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function LightWeightMapPerfTest(): void {
  describe('LightWeightMapPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_LightWeightMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new LightWeightMap<string, number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_LightWeightMap_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res: number = lightWeightMap.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Length_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'length',
          'get length(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_LightWeightMap_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let res: boolean = lightWeightMap.isEmpty();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.isEmpty();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. hasKey ====================

    it('PerformanceTest_LightWeightMap_HasKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('testKey', 100);
        let res: boolean = lightWeightMap.hasKey('testKey');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.hasKey('testKey');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasKey_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasKey',
          'hasKey(key: K): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. hasValue ====================

    it('PerformanceTest_LightWeightMap_HasValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('testKey', 200);
        let res: boolean = lightWeightMap.hasValue(200);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.hasValue(200);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasValue_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasValue',
          'hasValue(value: V): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. hasAll ====================

    it('PerformanceTest_LightWeightMap_HasAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map1: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        map1.set('a', 1);
        let map2: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        map2.set('a', 1);
        let res: boolean = map1.hasAll(map2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map1.hasAll(map2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_HasAll_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'hasAll',
          'hasAll(map: LightWeightMap<K, V>): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. get ====================

    it('PerformanceTest_LightWeightMap_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('key', 300);
        let res: number = lightWeightMap.get('key')!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.get('key')!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Get_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'get',
          'get(key: K): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. set ====================

    it('PerformanceTest_LightWeightMap_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMaps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          lightWeightMaps.push(new LightWeightMap<string, number>());
        }
        let args: string[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          args.push(j.toString());
        }
        let res: Object = new Object();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMaps[i].set(args[i], i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'set',
          'set(key: K, value: V): Object', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. remove ====================

    it('PerformanceTest_LightWeightMap_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new LightWeightMap<string, number>();
          m.set('k', 1);
          maps.push(m);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].remove('k')!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'remove',
          'remove(key: K): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. removeAt ====================

    it('PerformanceTest_LightWeightMap_RemoveAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new LightWeightMap<string, number>();
          m.set('k', 1);
          maps.push(m);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].removeAt(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_RemoveAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'removeAt',
          'removeAt(index: number): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. clear ====================

    it('PerformanceTest_LightWeightMap_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new LightWeightMap<string, number>();
          m.set('a', 1);
          maps.push(m);
        }
        let res: void = maps[0].clear();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Clear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. setAll ====================

    it('PerformanceTest_LightWeightMap_SetAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        for (let j = 0; j < 10; j++) {
          srcMap.set('k' + j.toString(), j);
        }
        let targets: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          targets.push(new LightWeightMap<string, number>());
        }
        let res: void = targets[0].setAll(srcMap);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = targets[i].setAll(srcMap);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_SetAll_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'setAll',
          'setAll(map: LightWeightMap<K, V>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. getKeyAt ====================

    it('PerformanceTest_LightWeightMap_GetKeyAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res: string = lightWeightMap.getKeyAt(0)!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.getKeyAt(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetKeyAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getKeyAt',
          'getKeyAt(index: number): K', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. getValueAt ====================

    it('PerformanceTest_LightWeightMap_GetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 10);
        let res: number = lightWeightMap.getValueAt(0)!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.getValueAt(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetValueAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getValueAt',
          'getValueAt(index: number): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 15. setValueAt ====================

    it('PerformanceTest_LightWeightMap_SetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new LightWeightMap<string, number>();
          m.set('a', 10);
          maps.push(m);
        }
        let res: boolean = maps[0].setValueAt(0, 20);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].setValueAt(0, 20);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_SetValueAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'setValueAt',
          'setValueAt(index: number, value: V): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 16. getIndexOfKey ====================

    it('PerformanceTest_LightWeightMap_GetIndexOfKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('target', 55);
        let res: number = lightWeightMap.getIndexOfKey('target');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.getIndexOfKey('target');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetIndexOfKey_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getIndexOfKey',
          'getIndexOfKey(key: K): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 17. getIndexOfValue ====================

    it('PerformanceTest_LightWeightMap_GetIndexOfValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 888);
        let res: number = lightWeightMap.getIndexOfValue(888);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.getIndexOfValue(888);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_GetIndexOfValue_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'getIndexOfValue',
          'getIndexOfValue(value: V): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 18. toString ====================

    it('PerformanceTest_LightWeightMap_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res: String = lightWeightMap.toString();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_ToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'toString',
          'toString(): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 19. forEach ====================

    it('PerformanceTest_LightWeightMap_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        for (let j: number = 0; j < 100; j++) {
          lightWeightMap.set('k' + j.toString(), j);
        }
        let callback = (value: number, key: string, map: LightWeightMap<string, number>): void => {
        };
        let res: void = lightWeightMap.forEach(callback);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.forEach(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_ForEach_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'forEach',
          'forEach(callbackFn: (value: V, key?: K, map?: LightWeightMap<K, V>) => void): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 20. $_iterator (skipped: not available in 1.1 Dyn) ====================
    /*
    it('PerformanceTest_LightWeightMap_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res = lightWeightMap.$_iterator();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.$_iterator();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Iterator_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', '$_iterator',
          '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
    */

    // ==================== 21. increaseCapacityTo ====================

    it('PerformanceTest_LightWeightMap_IncreaseCapacityTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: LightWeightMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          maps.push(new LightWeightMap<string, number>());
        }
        let res: void = maps[0].increaseCapacityTo(10);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].increaseCapacityTo(10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_IncreaseCapacityTo_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'increaseCapacityTo',
          'increaseCapacityTo(minimumCapacity: number): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 22. keys ====================

    it('PerformanceTest_LightWeightMap_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res = lightWeightMap.keys();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Keys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'keys',
          'keys(): IterableIterator<K>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 23. values ====================

    it('PerformanceTest_LightWeightMap_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res = lightWeightMap.values();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Values_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'values',
          'values(): IterableIterator<V>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 24. entries ====================

    it('PerformanceTest_LightWeightMap_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('a', 1);
        let res = lightWeightMap.entries();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lightWeightMap.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightMap_Entries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightMap', 'entries',
          'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
