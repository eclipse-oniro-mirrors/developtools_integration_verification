/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function SetPerfTest(): void{
  describe('SetPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })
    it('PerformanceTest_Set_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Set<number>(10);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Set<number>(10);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0100 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(bucketsCount: int)', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sourceSet = new Set<number>();
      let set = new Set<number>(sourceSet);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>(sourceSet);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0200 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(set: Set<K>)', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testArray: number[] = [1, 2, 3, 4, 5];

      let set = new Set<number>(testArray);

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>(testArray);
      }


      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0300 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(values: K[])', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testSet = new Set<number>([1, 2, 3]);
      let result: String = "";

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = testSet.toString();
      }


      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_toString_0100 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'toString',
        'toString(): String', arkTsAveragedTime);

    })
    it('PerformanceTest_Set_constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        set = new Set<number>();
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_constructor_0400 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'constructor',
        'constructor(elements?: Iterable<K> | FixedArray<K> | null)', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_forEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let set = new Set<number>();
      set.add(1);

      let callback = (k: number, v: number, s: Set<number>): void => {};

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.forEach(callback);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_forEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'forEach',
        'forEach(callbackfn: (k: K, v: K, set: Set<K>) => void): void', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let set = new Set<number>();
      set.add(1);
      let result: IterableIterator<[number, number]> = set.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
         result = set.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'entries',
        'entries(): IterableIterator<[K, K]>', arkTsAveragedTime);

    })
    it('PerformanceTest_Set_$_iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let set = new Set<number>();
      set.add(1);
      let result: IterableIterator<number> = set.$_iterator();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_$_iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', '$_iterator',
        '$_iterator(): IterableIterator<K>', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      set.add(1);
      let result: IterableIterator<number> = set.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'values',
        'values(): IterableIterator<K>', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      set.add(1);
      let result: IterableIterator<number> = set.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_keys_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);

    })
    it('PerformanceTest_Set_clear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.clear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_clear_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'clear',
        'clear(): void', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_delete_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      const testValue = 1;
	  let result: boolean = set.delete(testValue);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.delete(testValue);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_delete_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'delete',
        'delete(val: K): boolean', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_size_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      set.add(1);
      let result = set.size;

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_size_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'size',
        'get size(): int', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();
      set.add(100);
      let result: boolean = set.has(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = set.has(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_has_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'has',
        'has(val: K): boolean', arkTsAveragedTime);

    })

    it('PerformanceTest_Set_add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new Set<number>();

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.add(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Set_add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Set', 'add',
        'add(val: K): this', arkTsAveragedTime);

    })


  })
}
