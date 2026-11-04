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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function SetPerfTest(): void {
  describe('SetPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Set_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const sourceSet = new Set<number>();
      let set: Set<number> = new Set<number>(sourceSet);
      let Stime: number = systemDateTime.getTime(true);

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>(sourceSet);
      }

      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0100 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(set: Set<K>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let testArray: number[] = [1, 2, 3, 4, 5];

      let set: Set<number> = new Set<number>(testArray);

      let Stime: number = systemDateTime.getTime(true);

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>(testArray);
      }

      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0200 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(values: K[])', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_toString_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let testSet: Set<number> = new Set<number>([1, 2, 3]);
      let result: string = "";

      let Stime: number = systemDateTime.getTime(true);

      for (let i = 0; i < BASE_COUNT; i++) {
        result = testSet.toString();
      }

      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_toString_0300 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'toString',
        'toString(): String', arkTsAveragedTime);
      done();
    })
    it('PerformanceTest_Set_constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>();
      let Stime: number = systemDateTime.getTime(true);

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>();
      }

      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0400 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(elements?: Iterable<K> | FixedArray<K> | null)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_forEach_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {

      let set: Set<number> = new Set<number>();
      set.add(1);

      let total: number = 0;
      let callback = (k: number, v: number, s: Set<number>): void => {
        total += k;
      };

      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set.forEach(callback);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_forEach_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'forEach',
        'forEach(callbackfn: (k: K, v: K, set: Set<K>) => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_entries_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {

      let set: Set<number> = new Set<number>();
      set.add(1);
      let result: IterableIterator<[number, number]> = set.entries();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.entries();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_entries_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'entries',
        'entries(): IterableIterator<[K, K]>', arkTsAveragedTime);
      let entryResult = result.next();
      done();
    })

    it('PerformanceTest_Set_values_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>();
      set.add(1);
      let result: IterableIterator<number> = set.values();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.values();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_values_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'values',
        'values(): IterableIterator<K>', arkTsAveragedTime);
      let valueResult = result.next();
      done();
    })

    it('PerformanceTest_Set_keys_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>();
      set.add(1);
      let result: IterableIterator<number> = set.keys();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.keys();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_keys_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
      let keyResult = result.next();
      done();
    })
    it('PerformanceTest_Set_clear_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let sets: Set<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new Set<number>();
        s.add(1);
        sets.push(s);
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        sets[i].clear();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = sets[BASE_COUNT - 1];
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_clear_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'clear',
        'clear(): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_delete_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const testValue: number = 1;
      let sets: Set<number>[] = new Array<Set<number>>(BASE_COUNT);
      for (let i = 0; i < BASE_COUNT; i++) {
        sets[i] = new Set<number>([testValue]);
      }
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sets[i].delete(testValue);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_delete_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'delete',
        'delete(val: K): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_size_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>();
      set.add(1);
      let result: number = set.size;

      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.size;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_size_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'size',
        'get size(): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_has_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>();
      set.add(100);
      let result: boolean = set.has(100);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.has(100);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_has_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'has',
        'has(val: K): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Set_add_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let sets: Set<number>[] = new Array<Set<number>>(BASE_COUNT);
      for (let j = 0; j < BASE_COUNT; j++) {
        sets[j] = new Set<number>();
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        sets[i].add(i);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = sets[BASE_COUNT - 1];
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_add_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'add',
        'add(val: K): this', arkTsAveragedTime);
      done();
    })

  })
}