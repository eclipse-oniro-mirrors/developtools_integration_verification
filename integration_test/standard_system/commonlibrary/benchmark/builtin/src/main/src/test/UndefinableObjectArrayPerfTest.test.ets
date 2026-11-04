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

export default function UndefinableObjectArrayPerfTest(): void {
  describe('UndefinableObjectArrayPerfTest', () => {
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

    it('PerformanceTest_UndefinableObjectArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new containers.UndefinableObjectArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.UndefinableObjectArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new containers.UndefinableObjectArray(10 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.UndefinableObjectArray(10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor',
        'constructor(capacity: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val = new Object();
      let res = new containers.UndefinableObjectArray(10 as int, val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new containers.UndefinableObjectArray(10 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor',
        'constructor(capacity: int, val: UndefinableObject)', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_Reserve_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.reserve(100 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Reserve_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'reserve',
        'reserve(capacity: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_ToArray_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      arr.pushBack(new Object());
      let res: Object[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_ToArray_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'toArray',
        'toArray(): Object[]', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_PushBack_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      let val = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.pushBack(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_PushBack_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'pushBack',
        'pushBack(e: UndefinableObject): void', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_PopBack_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      let val = new Object();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.pushBack(val);
      }
      let res: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.popBack();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_PopBack_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'popBack',
        'popBack(): UndefinableObject', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_Size_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      arr.pushBack(new Object());
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.size();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Size_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'size',
        'size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_At_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      arr.pushBack(new Object());
      let res: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_At_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'at',
        'at(index: int): UndefinableObject', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableObjectArray_Set_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableObjectArray();
      arr.pushBack(new Object());
      let val = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(0 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Set_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'set',
        'set(index: int, e: UndefinableObject): void', arkTsAveragedTime);
    })

  })
}