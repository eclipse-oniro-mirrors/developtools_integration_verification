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

export default function WeakMapPerfTest(): void {
  describe('WeakMapPerfTest', () => {
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
    // 1. WeakMap Constructors
    // ================================================================

    it('PerformanceTest_WeakMap_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new WeakMap<Object, Object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakMap_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let key = new Object();
      let val = new Object();
      let arr: Array<[Object, Object]> = [[key, val]];
      let map = new WeakMap<Object, Object>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor(entries?: ([K, V])[] | null)', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakMap_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let key = new Object();
      let val = new Object();
      let entries: Array<[Object, Object]> = [[key, val]];
      let map = new WeakMap<Object, Object>(entries as Iterable<[Object, Object]>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new WeakMap<Object, Object>(entries as Iterable<[Object, Object]>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'constructor',
        'constructor(entries: Iterable<[K, V]>)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. WeakMap Methods
    // ================================================================

    it('PerformanceTest_WeakMap_ToString_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wm = new WeakMap<Object, Object>();
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_ToString_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakMap_Set_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        wm.set(key, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = wm;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Set_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'set',
        'set(key: K, val: V): WeakMap<K, V>', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakMap_Has_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      wm.set(key, val);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.has(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Has_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'has',
        'has(key: K): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakMap_Get_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wm = new WeakMap<Object, Object>();
      let key = new Object();
      let val = new Object();
      wm.set(key, val);
      let res: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.get(key);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Get_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'get',
        'get(key: K): V | undefined', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_WeakMap_Delete_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wm = new WeakMap<Object, Object>();
      let keys: Object[] = [];
      let val = new Object();
      for (let i = 0; i < BASE_COUNT; i++) {
        let key = new Object();
        keys.push(key);
        wm.set(key, val);
      }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = wm.delete(keys[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakMap_Delete_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakMap', 'delete',
        'delete(key: K): boolean', arkTsAveragedTime);
    })

  })
}
