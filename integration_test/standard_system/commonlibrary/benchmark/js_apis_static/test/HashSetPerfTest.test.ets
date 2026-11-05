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
import { HashSet } from '@kit.ArkTS';
import performance from './Performance.util';

export default function HashSetPerfTest(): void {
  describe('HashSetPerfTest', () => {
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

    it('PerformanceTest_HashSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: HashSet<string> = new HashSet<string>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new HashSet<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_HashSet_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add('a');
      let res: int = hashSet.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_HashSet_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      let res: boolean = hashSet.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 4. has ====================

    it('PerformanceTest_HashSet_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add('testValue');
      let res: boolean = hashSet.has('testValue');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.has('testValue');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'has',
        'has(value: T): boolean', arkTsAveragedTime);
    })

    // ==================== 5. add ====================

    it('PerformanceTest_HashSet_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSets: HashSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        hashSets.push(new HashSet<string>());
      }
      let res: boolean = hashSets[0].add('0');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSets[i].add(i.toString());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'add',
        'add(value: T): boolean', arkTsAveragedTime);
    })

    // ==================== 6. remove ====================

    it('PerformanceTest_HashSet_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: HashSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new HashSet<string>();
        s.add('a');
        sets.push(s);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].remove('a');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'remove',
        'remove(value: T): boolean', arkTsAveragedTime);
    })

    // ==================== 7. clear ====================

    it('PerformanceTest_HashSet_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: HashSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new HashSet<string>();
        s.add('a');
        sets.push(s);
      }
      let res: void = sets[0].clear();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 8. values ====================

    it('PerformanceTest_HashSet_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add('a');
      let res = hashSet.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

    // ==================== 9. forEach ====================

    it('PerformanceTest_HashSet_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      for (let j: int = 0; j < 10; j++) {
        hashSet.add('v' + j.toString());
      }
      let callback = (value: string, key?: string, set?: HashSet<string>): void => {
      };
      let res: void = hashSet.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'forEach',
        'forEach(callbackFn: (value: T, key?: T, set?: HashSet<T>) => void): void', arkTsAveragedTime);
    })

    // ==================== 10. entries ====================

    it('PerformanceTest_HashSet_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add('a');
      let res = hashSet.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', 'entries',
        'entries(): IterableIterator<[T, T]>', arkTsAveragedTime);
    })

    // ==================== 11. $_iterator ====================

    it('PerformanceTest_HashSet_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add('a');
      let res = hashSet.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = hashSet.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_HashSet_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'HashSet', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}