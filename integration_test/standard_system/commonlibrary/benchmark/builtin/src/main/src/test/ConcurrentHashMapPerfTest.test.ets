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

export default function ConcurrentHashMapPerfTest(): void {
  describe('ConcurrentHashMapPerfTest', () => {
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
    // 1. ConcurrentHashMap Constructors
    // ================================================================

    it('PerformanceTest_ConcurrentHashMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new containers.ConcurrentHashMap<Int, Int>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let key = new Int(1);
      let val = new Int(1);
      let arr: Array<[Int, Int]> = [[key, val]];
      let map = new containers.ConcurrentHashMap<Int, Int>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new containers.ConcurrentHashMap<Int, Int>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'constructor',
        'constructor(entries?: ([K, V])[] | null)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let key = new Int(1);
      let val = new Int(1);
      let entries: Array<[Int, Int]> = [[key, val]];
      let res = new containers.ConcurrentHashMap<Int, Int>(entries as Iterable<[Int, Int]>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.ConcurrentHashMap<Int, Int>(entries as Iterable<[Int, Int]>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'constructor',
        'constructor(entries: Iterable<[K, V]>)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sourceMap = new Map<Int, Int>();
      sourceMap.set(new Int(1), new Int(1));
      let res = new containers.ConcurrentHashMap<Int, Int>(sourceMap);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.ConcurrentHashMap<Int, Int>(sourceMap);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'constructor',
        'constructor(map: Map<K, V>)', arkTsAveragedTime);
    })
    //并发格式不规范
    // ================================================================
    // 2. ConcurrentHashMap Methods
    // ================================================================
    it('PerformanceTest_ConcurrentHashMap_Set_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let keys: Int[] = [];
      let vals: Int[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        keys.push(new Int(i as int));
        vals.push(new Int(i as int));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.set(keys[i], vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Set_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'set',
        'set(key: K, val: V): ConcurrentHashMap<K, V>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Get_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let key = new Int(1);
      let val = new Int(1);
      map.set(key, val);
      let res: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.get(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Get_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'get',
        'get(key: K): V | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Has_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let key = new Int(1);
      let val = new Int(1);
      map.set(key, val);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.has(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Has_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'has',
        'has(key: K): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Replace_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let key = new Int(1);
      let val1 = new Int(1);
      let val2 = new Int(2);
      map.set(key, val1);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.replace(key, val2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Replace_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'replace',
        'replace(key: K, newValue: V): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Size_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let key = new Int(1);
      let val = new Int(1);
      map.set(key, val);
      let currentSize = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        currentSize = map.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = currentSize;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Size_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'size',
        'size(): int', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentHashMap_Remove_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: containers.ConcurrentHashMap<Int, Int>[] = [];
      let key = new Int(1);
      let val = new Int(1);
      for (let i = 0; i < BASE_COUNT; i++) {
        let map = new containers.ConcurrentHashMap<Int, Int>();
        map.set(key, val);
        maps.push(map);
      }
      let res: Int | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].remove(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Remove_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'remove',
        'remove(key: K): V | undefined', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentHashMap_Delete_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: containers.ConcurrentHashMap<Int, Int>[] = [];
      let key = new Int(1);
      let val = new Int(1);
      for (let i = 0; i < BASE_COUNT; i++) {
        let map = new containers.ConcurrentHashMap<Int, Int>();
        map.set(key, val);
        maps.push(map);
      }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = maps[i].delete(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Delete_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'delete',
        'delete(key: K): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentHashMap_Clear_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: containers.ConcurrentHashMap<Int, Int>[] = [];
      let key = new Int(1);
      let val = new Int(1);
      for (let i = 0; i < BASE_COUNT; i++) {
        let map = new containers.ConcurrentHashMap<Int, Int>();
        map.set(key, val);
        maps.push(map);
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        maps[i].clear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = maps[0];
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Clear_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'clear',
        'clear(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_IsEmpty_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.isEmpty();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_IsEmpty_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_ToString_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_ToString_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Keys_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let res: IterableIterator<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Keys_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Values_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let res: IterableIterator<Int> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Values_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'values',
        'values(): IterableIterator<V>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Entries_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let res: IterableIterator<[Int, Int]> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Entries_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'entries',
        'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_Iterator_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let res: IterableIterator<[Int, Int]> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = map.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Iterator_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', '$_iterator',
        '$_iterator(): IterableIterator<[K, V]>', arkTsAveragedTime);
    })

    it('PerformanceTest_ConcurrentHashMap_ForEach_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      map.set(new Int(1), new Int(1));
      let cb = (v: Int, k: Int) => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.forEach(cb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_ForEach_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMap', 'forEach',
        'forEach(callbackfn): void', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ConcurrentHashMapIterator_Next_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new containers.ConcurrentHashMap<Int, Int>();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.set(new Int(i as int), new Int(i as int));
      }
      let iter = map.entries();
      let res: IteratorResult<[Int, Int]> | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = iter.next();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMapIterator_Next_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMapIterator', 'next',
        'next(): IteratorResult<R>', arkTsAveragedTime);
    })

    // it('PerformanceTest_EmptyConcurrentHashMapIterator_Next_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let map = new containers.ConcurrentHashMap<Int, Int>();
    //   let iter = map.entries();
    //   let res: IteratorResult<[Int, Int]> | null = null;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = iter.next();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EmptyConcurrentHashMapIterator_Next_2100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentHashMapIterator', 'next',
    //     'next(): IteratorResult<R>', arkTsAveragedTime);
    // })

  })
}
