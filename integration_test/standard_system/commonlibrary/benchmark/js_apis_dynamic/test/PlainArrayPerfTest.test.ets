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
import { PlainArray } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function PlainArrayPerfTest(): void {
  describe('PlainArrayPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_PlainArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: PlainArray<string> = new PlainArray<string>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new PlainArray<string>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. length ====================

    it('PerformanceTest_PlainArray_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: number = plainArray.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Length_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'length',
          'get length(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. isEmpty ====================

    it('PerformanceTest_PlainArray_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let res: boolean = plainArray.isEmpty();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.isEmpty();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. has ====================

    it('PerformanceTest_PlainArray_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: boolean = plainArray.has(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.has(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Has_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'has',
          'has(key: number): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. get ====================

    it('PerformanceTest_PlainArray_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: string = plainArray.get(1)!;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.get(1)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Get_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'get',
          'get(key: number): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. getIndexOfKey ====================

    it('PerformanceTest_PlainArray_GetIndexOfKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: number = plainArray.getIndexOfKey(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.getIndexOfKey(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetIndexOfKey_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getIndexOfKey',
          'getIndexOfKey(key: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. getIndexOfValue ====================

    it('PerformanceTest_PlainArray_GetIndexOfValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: number = plainArray.getIndexOfValue('test');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.getIndexOfValue('test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetIndexOfValue_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getIndexOfValue',
          'getIndexOfValue(value: T): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. getKeyAt ====================

    it('PerformanceTest_PlainArray_GetKeyAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: number = plainArray.getKeyAt(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.getKeyAt(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetKeyAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getKeyAt',
          'getKeyAt(index: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. getValueAt ====================

    it('PerformanceTest_PlainArray_GetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: string = plainArray.getValueAt(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.getValueAt(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_GetValueAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'getValueAt',
          'getValueAt(index: number): T', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. clone ====================

    it('PerformanceTest_PlainArray_Clone_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res: PlainArray<string> = plainArray.clone();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.clone();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Clone_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'clone',
          'clone(): PlainArray<T>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. add ====================

    it('PerformanceTest_PlainArray_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          arrays.push(new PlainArray<string>());
        }
        let arkTsAveragedTime: number = 0;
        let res: void = arrays[0].add(0, 'v');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrays[i].add(i, 'v');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Add_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'add',
          'add(key: number, value: T): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. remove ====================

    it('PerformanceTest_PlainArray_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let p = new PlainArray<string>();
          p.add(0, 'v');
          arrays.push(p);
        }
        let res: string = '';
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrays[i].remove(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'remove',
          'remove(key: number): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. removeAt ====================

    it('PerformanceTest_PlainArray_RemoveAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let p = new PlainArray<string>();
          p.add(0, 'v');
          arrays.push(p);
        }
        let res: string = '';
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrays[i].removeAt(0)!;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_RemoveAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'removeAt',
          'removeAt(index: number): T | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. removeRangeFrom ====================

    it('PerformanceTest_PlainArray_RemoveRangeFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let p = new PlainArray<string>();
          p.add(0, 'v');
          arrays.push(p);
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arrays[i].removeRangeFrom(0, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_RemoveRangeFrom_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'removeRangeFrom',
          'removeRangeFrom(index: number, size: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 15. setValueAt ====================

    it('PerformanceTest_PlainArray_SetValueAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let p = new PlainArray<string>();
          p.add(1, 'test');
          arrays.push(p);
        }
        let args: string[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          args.push(j.toString());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrays[i].setValueAt(0, args[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_SetValueAt_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'setValueAt',
          'setValueAt(index: number, value: T): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 16. toString ====================

    it('PerformanceTest_PlainArray_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res = plainArray.toString();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_ToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'toString',
          'toString(): String', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 17. clear ====================

    it('PerformanceTest_PlainArray_Clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arrays: PlainArray<string>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let p = new PlainArray<string>();
          p.add(1, 'test');
          arrays.push(p);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrays[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = arrays[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Clear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 18. forEach ====================

    it('PerformanceTest_PlainArray_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let callback = (value: string, key: number, pa: PlainArray<string>): void => {
        };
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          plainArray.forEach(callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_ForEach_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', 'forEach',
          'forEach(callbackfn: PlainArrayForEachCb<T>): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 19. $_iterator (skipped: not available in 1.1 Dyn) ====================
    /*
    it('PerformanceTest_PlainArray_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, 'test');
        let res = plainArray.$_iterator();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = plainArray.$_iterator();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PlainArray_Iterator_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'PlainArray', '$_iterator',
          '$_iterator(): IterableIterator<[number, T]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
    */

  })
}
