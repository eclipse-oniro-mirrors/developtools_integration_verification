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
import { HashMap } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function HashMapPerfTest(): void {
  describe('HashMapPerfTest', () => {
    const BASE_COUNT = 5000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_HashMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: HashMap<string, number> = new HashMap<string, number>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new HashMap<string, number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_HashMap_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('a', 1);
        let res: number = hashMap.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Length_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'length',
          'get length(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_HashMap_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        let res: boolean = hashMap.isEmpty();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.isEmpty();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. hasKey ====================

    it('PerformanceTest_HashMap_HasKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('testKey', 100);
        let res: boolean = hashMap.hasKey('testKey');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.hasKey('testKey');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_HasKey_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'hasKey',
          'hasKey(key: K): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. hasValue ====================

    it('PerformanceTest_HashMap_HasValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('testKey', 200);
        let res: boolean = hashMap.hasValue(200);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.hasValue(200);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_HasValue_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'hasValue',
          'hasValue(value: V): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. get ====================

    it('PerformanceTest_HashMap_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('key', 300);
        let res: number = hashMap.get('key')!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.get('key')!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Get_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'get',
          'get(key: K): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. set ====================

    it('PerformanceTest_HashMap_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: HashMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          maps.push(new HashMap<string, number>());
        }
        let keys: string[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          keys.push(j.toString());
        }
        let res: Object = maps[0].set("0", 0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].set(keys[i], i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Set_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'set',
          'set(key: K, value: V): Object', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. setAll ====================

    it('PerformanceTest_HashMap_SetAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcMap: HashMap<string, number> = new HashMap<string, number>();
        for (let j = 0; j < 100; j++) {
          srcMap.set('k' + j.toString(), j);
        }
        let targets: HashMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          targets.push(new HashMap<string, number>());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          targets[i].setAll(srcMap);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_SetAll_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'setAll',
          'setAll(map: HashMap<K, V>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. remove ====================

    it('PerformanceTest_HashMap_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: HashMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new HashMap<string, number>();
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'remove',
          'remove(key: K): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. clear ====================

    it('PerformanceTest_HashMap_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: HashMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new HashMap<string, number>();
          m.set('a', 1);
          maps.push(m);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          maps[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = maps[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Clear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. keys ====================

    it('PerformanceTest_HashMap_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('a', 1);
        let res = hashMap.keys();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Keys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'keys',
          'keys(): IterableIterator<K>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. values ====================

    it('PerformanceTest_HashMap_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('a', 1);
        let res = hashMap.values();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Values_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'values',
          'values(): IterableIterator<V>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. forEach ====================

    it('PerformanceTest_HashMap_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        for (let j = 0; j < 100; j++) {
          hashMap.set('k' + j.toString(), j);
        }
        let callback = (value: number, key: string, map: HashMap<string, number>): void => {
        };
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          hashMap.forEach(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_ForEach_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'forEach',
          'forEach(callbackFn: (value: V, key?: K, map?: HashMap<K, V>) => void): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. entries ====================

    it('PerformanceTest_HashMap_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('a', 1);
        let res = hashMap.entries();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = hashMap.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Entries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'entries',
          'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // // ==================== 15. $_iterator ====================
    //
    // it('PerformanceTest_HashMap_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   (done: Function) => {
    //     let hashMap: HashMap<string, number> = new HashMap<string, number>();
    //     hashMap.set('a', 1);
    //     let res = hashMap.$_iterator();
    //     let arkTsAveragedTime: number = 0;
    //     let Stime = systemDateTime.getTime(true);
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //       res = hashMap.$_iterator();
    //     }
    //     let Dtime = systemDateTime.getTime(true) - Stime;
    //     let res1 = res;
    //     arkTsAveragedTime = Dtime / BASE_COUNT;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Iterator_0100: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', '$_iterator',
    //       '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
    //     setTimeout(() => { done(); }, 10);
    //   })

    // ==================== 16. replace ====================

    it('PerformanceTest_HashMap_Replace_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: HashMap<string, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let m = new HashMap<string, number>();
          m.set('key', 100);
          maps.push(m);
        }
        let res: boolean = maps[0].replace('key', 200);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].replace('key', 200);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Replace_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'replace',
          'replace(key: K, newValue: V): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
