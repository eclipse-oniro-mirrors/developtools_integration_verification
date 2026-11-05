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
import { PlainArray } from '@kit.ArkTS';
import performance from './Performance.util';

export default function PlainArrayPerfTest(): void {
  describe('PlainArrayPerfTest', () => {
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

    it('PerformanceTest_PlainArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: PlainArray<string> = new PlainArray<string>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new PlainArray<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length ====================

    it('PerformanceTest_PlainArray_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: int = plainArray.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_PlainArray_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      let res: boolean = plainArray.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 4. has ====================

    it('PerformanceTest_PlainArray_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: boolean = plainArray.has(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.has(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'has',
        'has(key: int): boolean', arkTsAveragedTime);
    })

    // ==================== 5. get ====================

    it('PerformanceTest_PlainArray_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: string = plainArray.get(1)!;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.get(1)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'get',
        'get(key: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 6. getIndexOfKey ====================

    it('PerformanceTest_PlainArray_GetIndexOfKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: int = plainArray.getIndexOfKey(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.getIndexOfKey(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetIndexOfKey_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getIndexOfKey',
        'getIndexOfKey(key: int): int', arkTsAveragedTime);
    })

    // ==================== 7. getIndexOfValue ====================

    it('PerformanceTest_PlainArray_GetIndexOfValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: int = plainArray.getIndexOfValue('test');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.getIndexOfValue('test');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetIndexOfValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getIndexOfValue',
        'getIndexOfValue(value: T): int', arkTsAveragedTime);
    })

    // ==================== 8. getKeyAt ====================

    it('PerformanceTest_PlainArray_GetKeyAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: int = plainArray.getKeyAt(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.getKeyAt(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetKeyAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getKeyAt',
        'getKeyAt(index: int): int', arkTsAveragedTime);
    })

    // ==================== 9. getValueAt ====================

    it('PerformanceTest_PlainArray_GetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: string = plainArray.getValueAt(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.getValueAt(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetValueAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getValueAt',
        'getValueAt(index: int): T', arkTsAveragedTime);
    })

    // ==================== 10. clone ====================

    it('PerformanceTest_PlainArray_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res: PlainArray<string> = plainArray.clone();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.clone();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Clone_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'clone',
        'clone(): PlainArray<T>', arkTsAveragedTime);
    })

    // ==================== 11. add ====================

    it('PerformanceTest_PlainArray_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrays: PlainArray<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new PlainArray<string>());
      }
      arrays[0].add(0, 'v');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].add(i, 'v');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'add',
        'add(key: int, value: T): void', arkTsAveragedTime);
    })

    // ==================== 12. remove ====================

    it('PerformanceTest_PlainArray_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrays: PlainArray<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let p = new PlainArray<string>();
        p.add(0, 'v');
        arrays.push(p);
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrays[i].remove(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Remove_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'remove',
        'remove(key: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 13. removeAt ====================

    it('PerformanceTest_PlainArray_RemoveAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrays: PlainArray<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let p = new PlainArray<string>();
        p.add(0, 'v');
        arrays.push(p);
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrays[i].removeAt(0)!;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_RemoveAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'removeAt',
        'removeAt(index: int): T | undefined', arkTsAveragedTime);
    })

    // ==================== 14. removeRangeFrom ====================

    it('PerformanceTest_PlainArray_RemoveRangeFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrays: PlainArray<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let p = new PlainArray<string>();
        p.add(0, 'v');
        arrays.push(p);
      }
      let res: int = 0;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arrays[i].removeRangeFrom(0, 1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_RemoveRangeFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'removeRangeFrom',
        'removeRangeFrom(index: int, size: int): int', arkTsAveragedTime);
    })

    // ==================== 15. setValueAt ====================

    it('PerformanceTest_PlainArray_SetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        plainArray.setValueAt(0, i.toString());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_SetValueAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'setValueAt',
        'setValueAt(index: int, value: T): void', arkTsAveragedTime);
    })

    // ==================== 16. toString ====================

    it('PerformanceTest_PlainArray_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res = plainArray.toString();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.toString();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_ToString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    // ==================== 17. clear ====================

    it('PerformanceTest_PlainArray_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrays: PlainArray<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let p = new PlainArray<string>();
        p.add(1, 'test');
        arrays.push(p);
      }
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].clear();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = arrays[0];
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    // ==================== 18. forEach ====================

    it('PerformanceTest_PlainArray_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let callback = (value: string, key: int, pa: PlainArray<string>): void => {
      };
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        plainArray.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'forEach',
        'forEach(callbackfn: PlainArrayForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 19. $_iterator ====================

    it('PerformanceTest_PlainArray_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, 'test');
      let res = plainArray.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = plainArray.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', '$_iterator',
        '$_iterator(): IterableIterator<[int, T]>', arkTsAveragedTime);
    })

  })
}
