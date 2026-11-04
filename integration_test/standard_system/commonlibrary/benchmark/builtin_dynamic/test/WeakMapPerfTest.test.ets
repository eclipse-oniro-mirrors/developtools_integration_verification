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

export default function WeakMapPerfTest(): void {
  describe('WeakMapPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_WeakMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let map = new WeakMap<Object, Object>();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = map;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor()', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let key = new Object();
      let val = new Object();
      let arr: Array<[Object, Object]> = [[key, val]];
      let map = new WeakMap<Object, Object>(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = map;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor(entries?: ([K, V])[] | null)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let key = new Object();
      let val = new Object();
      let entries: Array<[Object, Object]> = [[key, val]];
      let map = new WeakMap<Object, Object>(entries as Iterable<[Object, Object]>);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>(entries as Iterable<[Object, Object]>);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = map;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor(entries: Iterable<[K, V]>)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_ToString_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let wm = new WeakMap<Object, Object>();
      let res: String = new String("");
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.toString();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_ToString_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'toString',
        'toString(): String', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Set_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      let setRes: WeakMap<Object, Object> = wm;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        setRes = wm.set(key, val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = setRes;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Set_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'set',
        'set(key: K, val: V): WeakMap<K, V>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Has_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      wm.set(key, val);
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.has(key);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Has_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'has',
        'has(key: K): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Get_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      wm.set(key, val);
      let res: Object | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.get(key);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Get_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'get',
        'get(key: K): V | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_WeakMap_Delete_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let wm = new WeakMap<Object, Object>();
      let keys: Object[] = [];
      let val = new Object();
      for (let i = 0; i < BASE_COUNT; i++) {
        let key = new Object();
        keys.push(key);
        wm.set(key, val);
      }
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.delete(keys[i]);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Delete_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'delete',
        'delete(key: K): boolean', arkTsAveragedTime);
      done();
    })

  })
}