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

export default function ArrayAsListStringPerfTest() : void{
  describe('ArrayAsListStringPerfTest', () => {
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
    // 1. ArrayAsListString Constructors
    // ================================================================

    it('PerformanceTest_ArrayAsListString_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ArrayAsListString = new containers.ArrayAsListString();
      let val = new String("1");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list = new containers.ArrayAsListString(10 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'constructor', 'constructor(capacity: int, val: String)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ArrayAsListString = new containers.ArrayAsListString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list = new containers.ArrayAsListString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'constructor', 'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ArrayAsListString = new containers.ArrayAsListString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list = new containers.ArrayAsListString(10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'constructor', 'constructor(capacity: int)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. ArrayAsListString Methods
    // ================================================================

    it('PerformanceTest_ArrayAsListString_Reserve_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.reserve(10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Reserve_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'reserve', 'reserve(capacity: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_ToArray_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(10 as int, new String("1"));
      let res: String[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.toArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_ToArray_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'toArray', 'toArray(): String[]', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ArrayAsListString_PushFront_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString();
      let vals: String[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new String(i.toString()));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushFront(vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_PushFront_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'pushFront', 'pushFront(e: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_PopFront_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(BASE_COUNT as int, new String("1"));
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.popFront();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_PopFront_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'popFront', 'popFront(): String', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ArrayAsListString_PushBack_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString();
      let vals: String[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new String(i.toString()));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushBack(vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_PushBack_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'pushBack', 'pushBack(e: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_PopBack_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(BASE_COUNT as int, new String("1"));
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.popBack();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_PopBack_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'popBack', 'popBack(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_Size_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(10 as int, new String("1"));
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.size();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Size_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'size', 'size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_At_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(10 as int, new String("1"));
      let res: String = new String("");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.at(0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_At_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'at', 'at(index: int): String', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_ArrayAsListString_Set_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(10 as int, new String("1"));
      let vals: String[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        vals.push(new String(i.toString()));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.set(0 as int, vals[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Set_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'set', 'set(index: int, e: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayAsListString_Has_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new containers.ArrayAsListString(10 as int, new String("1"));
      let val = new String("1");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.has(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayAsListString_Has_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ArrayAsListString', 'has', 'has(e: String): boolean', arkTsAveragedTime);
    })

  })
}