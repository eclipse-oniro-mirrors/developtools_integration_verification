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

export default function ConcurrentHashMapPerfTest(): void {
  describe('ConcurrentHashMapPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          map = new Map<number, number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = map;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let key = 1;
        let val = 1;
        let arr: Array<[number, number]> = [[key, val]];
        let map = new Map<number, number>(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          map = new Map<number, number>(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = map;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'constructor',
          'constructor(entries?: ([K, V])[] | null)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let key = 1;
        let val = 1;
        let entries: Array<[number, number]> = [[key, val]];
        let res = new Map<number, number>(entries);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Map<number, number>(entries);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'constructor',
          'constructor(entries: Iterable<[K, V]>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceMap = new Map<number, number>();
        sourceMap.set(1, 1);
        let res = new Map<number, number>(sourceMap);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Map<number, number>(sourceMap);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Constructor_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'constructor',
          'constructor(map: Map<K, V>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Set_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: Map<number, number>[] = [];
        let keys: number[] = [];
        let vals: number[] = [];
        for (let i = 0; i < BASE_COUNT; i++) {
          maps.push(new Map<number, number>());
          keys.push(i);
          vals.push(i);
        }
        let res: Map<number, number> = maps[0];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].set(keys[i], vals[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Set_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'set',
          'set(key: K, val: V): ConcurrentHashMap<K, V>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Get_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        let key = 1;
        let val = 1;
        map.set(key, val);
        let res: number | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.get(key);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Get_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'get',
          'get(key: K): V | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Has_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        let key = 1;
        let val = 1;
        map.set(key, val);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.has(key);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Has_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'has',
          'has(key: K): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Replace_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: Map<number, number>[] = [];
        let key = 1;
        let val1 = 1;
        let val2 = 2;
        for (let i = 0; i < BASE_COUNT; i++) {
          let map = new Map<number, number>();
          map.set(key, val1);
          maps.push(map);
        }
        let res: Map<number, number> = maps[0];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].set(key, val2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Replace_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'set',
          'set(key: K, val: V): Map<K, V>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Size_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        let key = 1;
        let val = 1;
        map.set(key, val);
        let currentSize = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          currentSize = map.size;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = currentSize;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Size_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'size',
          'size(): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Remove_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: Map<number, number>[] = [];
        let key = 1;
        let val = 1;
        for (let i = 0; i < BASE_COUNT; i++) {
          let map = new Map<number, number>();
          map.set(key, val);
          maps.push(map);
        }
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].delete(key);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Remove_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'delete',
          'delete(key: K): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Delete_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: Map<number, number>[] = [];
        let key = 1;
        let val = 1;
        for (let i = 0; i < BASE_COUNT; i++) {
          let map = new Map<number, number>();
          map.set(key, val);
          maps.push(map);
        }
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = maps[i].delete(key);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Delete_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'delete',
          'delete(key: K): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Clear_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let maps: Map<number, number>[] = [];
        let key = 1;
        let val = 1;
        for (let i = 0; i < BASE_COUNT; i++) {
          let map = new Map<number, number>();
          map.set(key, val);
          maps.push(map);
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          maps[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = maps[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Clear_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'clear',
          'clear(): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_ToString_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let res: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_ToString_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'toString',
          'toString(): String', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Keys_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let res: IterableIterator<number> | null = null;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Keys_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'keys',
          'keys(): IterableIterator<K>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Values_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let res: IterableIterator<number> | null = null;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Values_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'values',
          'values(): IterableIterator<V>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Entries_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let res: IterableIterator<[number, number]> | null = null;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Entries_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'entries',
          'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_Iterator_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let res: IterableIterator<[number, number]> | null = null;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = map.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_Iterator_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'entries',
          'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMap_ForEach_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let map = new Map<number, number>();
        map.set(1, 1);
        let cb = (v: number, k: number) => {};
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          map.forEach(cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = map;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMap_ForEach_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'Map', 'forEach',
          'forEach(callbackfn): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ConcurrentHashMapIterator_Next_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let iters: IterableIterator<[number, number]>[] = [];
        for (let i: number = 0; i < BASE_COUNT; i++) {
          let map: Map<number, number> = new Map<number, number>();
          map.set(i, i);
          iters.push(map.entries());
        }
        let res: IteratorResult<[number, number]> | null = null;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = iters[i].next();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: IteratorResult<[number, number]> | null = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentHashMapIterator_Next_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'MapIterator', 'next',
          'next(): IteratorResult<R>', arkTsAveragedTime);
      done();
      })

  })
}