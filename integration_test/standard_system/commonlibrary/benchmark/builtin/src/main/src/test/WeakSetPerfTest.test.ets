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

export default function WeakSetPerfTest(): void {
  describe('WeakSetPerfTest', () => {
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
    // 1. WeakSet Constructors
    // ================================================================

    it('PerformanceTest_WeakSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set = new WeakSet<Object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new WeakSet<Object>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakSet_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new Object();
      let arr: Object[] = [obj];
      let set = new WeakSet<Object>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new WeakSet<Object>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
        'constructor(elements?: K[] | null)', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakSet_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new Object();
      let entries: Array<Object> = [obj];
      let set = new WeakSet<Object>(entries as Iterable<Object>);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        set = new WeakSet<Object>(entries as Iterable<Object>);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = set;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
        'constructor(elements: Iterable<K>)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. WeakSet Methods
    // ================================================================

    it('PerformanceTest_WeakSet_Add_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ws = new WeakSet<Object>();
      let obj = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        ws.add(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = ws;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Add_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'add',
        'add(v: K): WeakSet<K>', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakSet_Has_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ws = new WeakSet<Object>();
      let obj = new Object();
      ws.add(obj);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ws.has(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Has_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'has',
        'has(v: K): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_WeakSet_Delete_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ws = new WeakSet<Object>();
      let objects: Object[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let obj = new Object();
        objects.push(obj);
        ws.add(obj);
      }
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ws.delete(objects[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Delete_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'delete',
        'delete(v: K): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_WeakSet_ToString_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ws = new WeakSet<Object>();
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ws.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_ToString_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

  })
}
