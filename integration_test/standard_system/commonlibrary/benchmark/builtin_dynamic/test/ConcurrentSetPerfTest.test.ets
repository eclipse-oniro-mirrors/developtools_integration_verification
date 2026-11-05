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
import { collections } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ConcurrentSetPerfTest(): void {
  describe('ConcurrentSetPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new collections.Set<number>();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor()', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let val = 1;
      let arr: Array<number> = [val];
      let res = new collections.Set<number>(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new collections.Set<number>(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(values: ArrayLike<T>)', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let entries: Array<number> = [1];
      let entries1 = entries as Iterable<number>;
      let set = new collections.Set<number>();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new collections.Set<number>(entries1);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(iterable: Iterable<T>)', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let val = 1;
      let srcSet: collections.Set<number> = new collections.Set<number>();
      srcSet.add(val);
      let set = new collections.Set<number>(srcSet);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new collections.Set<number>(srcSet);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Constructor_0400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'constructor',
        'constructor(set: Set<T>)', arkTsAveragedTime);

      done();
    })
    it('PerformanceTest_ConcurrentSet_Add_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      let vals: number[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(i);
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set.add(vals[i]);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Add_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'add',
        'add(v: K): ConcurrentSet<K>', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Has_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      let val = 1;
      set.add(val);
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.has(val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Has_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'has',
        'has(v: K): boolean', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let currentSize = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        currentSize = set.size;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = currentSize;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Size_0700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'size',
        'get size(): int', arkTsAveragedTime);

      done();
    })
    it('PerformanceTest_ConcurrentSet_Delete_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let sets: collections.Set<number>[] = [];
      let val = 1;
      for (let i = 0; i < BASE_COUNT; i++) {
        let set = new collections.Set<number>();
        set.add(val);
        sets.push(set);
      }
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = sets[i].delete(val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Delete_0800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'delete',
        'delete(v: K): boolean', arkTsAveragedTime);

      done();
    })
    it('PerformanceTest_ConcurrentSet_Clear_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {

      let sets: collections.Set<number>[] = [];
      let val = 1;
      for (let i = 0; i < BASE_COUNT; i++) {
        let set = new collections.Set<number>();
        set.add(val);
        sets.push(set);
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        sets[i].clear();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = sets;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Clear_0900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'clear',
        'clear(): void', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_ToString_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let res: string = "";
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.toString();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_ToString_1000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'toString',
        'toString(): string', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Keys_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let res: IterableIterator<number> | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.keys();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Keys_1100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'keys',
        'keys(): IterableIterator<T>', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Values_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let res: IterableIterator<number> | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.values();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Values_1200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'values',
        'values(): IterableIterator<T>', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Entries_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let res: IterableIterator<[number, number]> | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.entries();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Entries_1300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'entries',
        'entries(): IterableIterator<[T, T]>', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_Iterator_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let res: IterableIterator<number> | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = set.values();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_Iterator_1400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'values',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSet_ForEach_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      let cb = (value: number, value2: number, set: collections.Set<number>) => {};
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        set.forEach(cb);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = set;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSet_ForEach_1500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSet', 'forEach',
        'forEach(callbackfn): void', arkTsAveragedTime);

      done();
    })

    it('PerformanceTest_ConcurrentSetIterator_Next_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set = new collections.Set<number>();
      for (let i = 0; i < BASE_COUNT; i++) {
        set.add(i as number);
      }
      let iter = set.values();
      let res: IteratorResult<number> | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = iter.next();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res !== null;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcurrentSetIterator_Next_1600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ConcurrentSetIterator',
        'next', 'next(): IteratorResult<T>', arkTsAveragedTime);

      done();
    })

  })
}