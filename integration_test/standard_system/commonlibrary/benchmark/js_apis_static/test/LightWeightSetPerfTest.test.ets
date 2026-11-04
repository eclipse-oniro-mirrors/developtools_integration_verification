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
import { LightWeightSet } from '@kit.ArkTS';
import performance from './Performance.util';

export default function LightWeightSetPerfTest(): void {
  describe('LightWeightSetPerfTest', () => {
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

    it('PerformanceTest_LightWeightSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LightWeightSet<string> = new LightWeightSet<string>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LightWeightSet<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length (Attributes) ====================

    it('PerformanceTest_LightWeightSet_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res: int = lightWeightSet.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_LightWeightSet_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      let res: boolean = lightWeightSet.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 4. add ====================

    it('PerformanceTest_LightWeightSet_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      let res: boolean = lightWeightSet.add('0');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.add(i.toString());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'add',
        'add(value: T): boolean', arkTsAveragedTime);
    })

    // ==================== 5. addAll ====================

    it('PerformanceTest_LightWeightSet_AddAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let srcSet: LightWeightSet<string> = new LightWeightSet<string>();
      srcSet.add('a');
      srcSet.add('b');
      let targets: LightWeightSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        targets.push(new LightWeightSet<string>());
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = targets[i].addAll(srcSet);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_AddAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'addAll',
        'addAll(set: LightWeightSet<T>): boolean', arkTsAveragedTime);
    })

    // ==================== 6. has ====================

    it('PerformanceTest_LightWeightSet_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('test');
      let res: boolean = lightWeightSet.has('test');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.has('test');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'has',
        'has(value: T): boolean', arkTsAveragedTime);
    })

    // ==================== 7. hasAll ====================

    it('PerformanceTest_LightWeightSet_HasAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set1: LightWeightSet<string> = new LightWeightSet<string>();
      set1.add('a');
      let set2: LightWeightSet<string> = new LightWeightSet<string>();
      set2.add('a');
      let res: boolean = set1.hasAll(set2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set1.hasAll(set2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_HasAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'hasAll',
        'hasAll(set: LightWeightSet<T>): boolean', arkTsAveragedTime);
    })

    // ==================== 8. getIndexOf ====================

    it('PerformanceTest_LightWeightSet_GetIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('target');
      let res: int = lightWeightSet.getIndexOf('target');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.getIndexOf('target');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_GetIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'getIndexOf',
        'getIndexOf(key: T): int', arkTsAveragedTime);
    })

    // ==================== 9. getValueAt ====================

    it('PerformanceTest_LightWeightSet_GetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res: string = lightWeightSet.getValueAt(0)!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.getValueAt(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_GetValueAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'getValueAt',
        'getValueAt(index: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 10. remove ====================

    it('PerformanceTest_LightWeightSet_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: LightWeightSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new LightWeightSet<string>();
        s.add('a');
        sets.push(s);
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].remove('a')!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'remove',
        'remove(key: T): T | undefined', arkTsAveragedTime);
    })

    // ==================== 11. removeAt ====================

    it('PerformanceTest_LightWeightSet_RemoveAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: LightWeightSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new LightWeightSet<string>();
        s.add('a');
        sets.push(s);
      }
      let res: boolean = false;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].removeAt(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_RemoveAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'removeAt',
        'removeAt(index: int): boolean', arkTsAveragedTime);
    })

    // ==================== 12. clear ====================

    it('PerformanceTest_LightWeightSet_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: LightWeightSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new LightWeightSet<string>();
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 13. increaseCapacityTo ====================

    it('PerformanceTest_LightWeightSet_IncreaseCapacityTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: LightWeightSet<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        sets.push(new LightWeightSet<string>());
      }
      let res: void = undefined;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].increaseCapacityTo(32);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_IncreaseCapacityTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'increaseCapacityTo',
        'increaseCapacityTo(minimumCapacity: int): void', arkTsAveragedTime);
    })

    // ==================== 14. toString ====================

    it('PerformanceTest_LightWeightSet_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res: string = lightWeightSet.toString();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.toString();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_ToString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    // ==================== 15. toArray ====================

    it('PerformanceTest_LightWeightSet_ToArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res: Array<string> = lightWeightSet.toArray();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.toArray();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_ToArray_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'toArray',
        'toArray(): Array<T>', arkTsAveragedTime);
    })

    // ==================== 16. values ====================

    it('PerformanceTest_LightWeightSet_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res = lightWeightSet.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

    // ==================== 17. entries ====================

    it('PerformanceTest_LightWeightSet_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res = lightWeightSet.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'entries',
        'entries(): IterableIterator<[T, T]>', arkTsAveragedTime);
    })

    // ==================== 18. forEach ====================

    it('PerformanceTest_LightWeightSet_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let callback = (value: string, key: string, set: LightWeightSet<string>): void => {
      };
      let res: void = lightWeightSet.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', 'forEach',
        'forEach(callbackFn: LightWeightSetForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 19. $_iterator ====================

    it('PerformanceTest_LightWeightSet_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      lightWeightSet.add('a');
      let res = lightWeightSet.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = lightWeightSet.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LightWeightSet_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'LightWeightSet', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}