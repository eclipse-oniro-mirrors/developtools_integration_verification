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
import { HashMap } from '@kit.ArkTS';
import performance from './Performance.util';

export default function HashMapPerfTest(): void {
  describe('HashMapPerfTest', (): void => {
    const BASE_COUNT = 5000;

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

    it('PerformanceTest_HashMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: HashMap<string, int> = new HashMap<string, int>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new HashMap<string, int>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_HashMap_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('a', 1);
      let res: int = hashMap.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_HashMap_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      let res: boolean = hashMap.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 4. hasKey ====================

    it('PerformanceTest_HashMap_HasKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('testKey', 100);
      let res: boolean = hashMap.hasKey('testKey');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.hasKey('testKey');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_HasKey_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'hasKey',
        'hasKey(key: K): boolean', arkTsAveragedTime);
    })

    // ==================== 5. hasValue ====================

    it('PerformanceTest_HashMap_HasValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('testKey', 200);
      let res: boolean = hashMap.hasValue(200);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.hasValue(200);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_HasValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'hasValue',
        'hasValue(value: V): boolean', arkTsAveragedTime);
    })

    // ==================== 6. get ====================

    it('PerformanceTest_HashMap_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('key', 300);
      let res: int = hashMap.get('key')!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.get('key')!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'get',
        'get(key: K): V', arkTsAveragedTime);
    })

    // ==================== 7. set ====================

    it('PerformanceTest_HashMap_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: HashMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        maps.push(new HashMap<string, int>());
      }
      let res: Object = maps[0].set('0', 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].set(i.toString(), i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Set_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'set',
        'set(key: K, value: V): Object', arkTsAveragedTime);
    })

    // ==================== 8. setAll ====================

    it('PerformanceTest_HashMap_SetAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcMap: HashMap<string, int> = new HashMap<string, int>();
      srcMap.set('1', 10);
      srcMap.set('2', 20);
      let targets: HashMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        targets.push(new HashMap<string, int>());
      }
      let res: void = targets[0].setAll(srcMap);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = targets[i].setAll(srcMap);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_SetAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'setAll',
        'setAll(map: HashMap<K, V>): void', arkTsAveragedTime);
    })

    // ==================== 9. remove ====================

    it('PerformanceTest_HashMap_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: HashMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new HashMap<string, int>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'remove',
        'remove(key: K): V', arkTsAveragedTime);
    })

    // ==================== 10. clear ====================

    it('PerformanceTest_HashMap_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: HashMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new HashMap<string, int>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 11. keys ====================

    it('PerformanceTest_HashMap_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('a', 1);
      let res = hashMap.keys();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.keys();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Keys_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
    })

    // ==================== 12. values ====================

    it('PerformanceTest_HashMap_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('a', 1);
      let res = hashMap.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'values',
        'values(): IterableIterator<V>', arkTsAveragedTime);
    })

    // ==================== 13. forEach ====================

    it('PerformanceTest_HashMap_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      for (let j: int = 0; j < 10; j++) {
        hashMap.set('k' + j.toString(), j);
      }
      let callback = (value: int, key: string, map: HashMap<string, int>): void => {
      };
      let res: void = hashMap.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'forEach',
        'forEach(callbackFn: (value: V, key?: K, map?: HashMap<K, V>) => void): void', arkTsAveragedTime);
    })

    // ==================== 14. entries ====================

    it('PerformanceTest_HashMap_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('a', 1);
      let res = hashMap.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'entries',
        'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    // ==================== 15. $_iterator ====================

    it('PerformanceTest_HashMap_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap: HashMap<string, int> = new HashMap<string, int>();
      hashMap.set('a', 1);
      let res = hashMap.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashMap.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', '$_iterator',
        '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    // ==================== 16. replace ====================

    it('PerformanceTest_HashMap_Replace_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let maps: HashMap<string, int>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let m = new HashMap<string, int>();
        m.set('key', 100);
        maps.push(m);
      }
      let res: boolean = maps[0].replace('key', 200);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].replace('key', i);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashMap_Replace_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashMap', 'replace',
        'replace(key: K, newValue: V): boolean', arkTsAveragedTime);
    })

  })
}
