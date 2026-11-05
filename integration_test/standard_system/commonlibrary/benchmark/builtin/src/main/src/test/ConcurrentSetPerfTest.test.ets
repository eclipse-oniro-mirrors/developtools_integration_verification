/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function ConcurrentSetPerfTest(): void {
  describe('ConcurrentSetPerfTest', () => {
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

    // ================================================================
    // 1. ConcurrentSet Constructors
    // ================================================================

    it('PerformanceTest_ConcurrentSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new containers.ConcurrentSet<Int>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val = new Int(1);
      let arr: Array<Int> = [val];
      let res = new containers.ConcurrentSet<Int>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++)
      {
        res = new containers.ConcurrentSet<Int>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(values: ArrayLike<T>)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let entries: Array<Int> = [1];
      let entries1 = entries as Iterable<Int>
      let set = new containers.ConcurrentSet<Int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++)
      {
        set = new containers.ConcurrentSet<Int>(entries1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(iterable: Iterable<T>)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val = new Int(1);
      let srcSet: Set<Int> = new Set<Int>();
      srcSet.add(val);
      let set = new containers.ConcurrentSet<Int>(srcSet);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new containers.ConcurrentSet<Int>(srcSet);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(set: Set<T>)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. ConcurrentSet Methods
    // ================================================================

    //并发格式不规范
    it('PerformanceTest_ConcurrentSet_Add_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      let vals: Int[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new Int(i));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.add(vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Add_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'add',
        'add(v: K): ConcurrentSet<K>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Has_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      let val = new Int(1);
      set.add(val);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.has(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Has_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'has',
        'has(v: K): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let currentSize = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        currentSize = set.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = currentSize;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Size_0700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'size',
        'get size(): int', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentSet_Delete_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sets: containers.ConcurrentSet<Int>[] = [];
      let val = new Int(1);
      for (let i = 0; i < BASE_COUNT; i++) {
        let set = new containers.ConcurrentSet<Int>();
        set.add(val);
        sets.push(set);
      }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].delete(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Delete_0800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'delete',
        'delete(v: K): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentSet_Clear_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let sets: containers.ConcurrentSet<Int>[] = [];
      let val = new Int(1);
      for (let i = 0; i < BASE_COUNT; i++) {
        let set = new containers.ConcurrentSet<Int>();
        set.add(val);
        sets.push(set);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        sets[i].clear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = sets;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Clear_0900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_ToString_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_ToString_1000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Keys_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let res: IterableIterator<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Keys_1100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'keys',
        'keys(): IterableIterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Values_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let res: IterableIterator<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Values_1200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Entries_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let res: IterableIterator<[Int, Int]> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Entries_1300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'entries',
        'entries(): IterableIterator<[T, T]>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_Iterator_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let res: IterableIterator<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Iterator_1400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSet_ForEach_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      set.add(new Int(1));
      let cb = (value: Int, value2: Int, set: containers.ConcurrentSet<Int>) => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.forEach(cb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_ForEach_1500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'forEach',
        'forEach(callbackfn): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentSetIterator_Next_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new containers.ConcurrentSet<Int>();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.add(new Int(i as int));
      }
      let iter = set.values();
      let res: IteratorResult<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = iter.next();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSetIterator_Next_1600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSetIterator',
        'next', 'next(): IteratorResult<T>', arkTsAveragedTime);
    })

    // it('PerformanceTest_EmptyConcurrentSetIterator_Next_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let set = new containers.ConcurrentSet<Int>();
    //   let iter = set.values();
    //   let res: IteratorResult<Int> | null = null;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = iter.next();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EmptyConcurrentSetIterator_Next_1700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSetIterator',
    //     'next', 'next(): IteratorResult<T>', arkTsAveragedTime);
    // })

  })
}