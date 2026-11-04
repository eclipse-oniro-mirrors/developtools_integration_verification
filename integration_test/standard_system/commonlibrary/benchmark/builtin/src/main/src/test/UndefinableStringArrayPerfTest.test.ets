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

export default function UndefinableStringArrayPerfTest(): void {
  describe('UndefinableStringArrayPerfTest', () => {
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

    it('PerformanceTest_UndefinableStringArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr = new containers.UndefinableStringArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray(10 as int);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr = new containers.UndefinableStringArray(10 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'constructor',
        'constructor(capacity: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val = new String("test");
      let arr = new containers.UndefinableStringArray(10 as int, val);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr = new containers.UndefinableStringArray(10 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'constructor',
        'constructor(capacity: int, val: UndefinableString)', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_Reserve_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.reserve(100 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Reserve_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'reserve',
        'reserve(capacity: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_ToArray_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let res: String[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_ToArray_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'toArray',
        'toArray(): String[]', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_ToFixedArray_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let res: FixedArray<String> | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toFixedArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_ToFixedArray_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'toFixedArray',
        'toFixedArray(): FixedArray<String>', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_ToUndefinableArray_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let res: (String | undefined)[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toUndefinableArray();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_ToUndefinableArray_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'toUndefinableArray',
        'toUndefinableArray(): (String | undefined)[]', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_PushBack_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      let val = new String("test");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.pushBack(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_PushBack_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'pushBack',
        'pushBack(e: UndefinableString): void', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_PopBack_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      let val = new String("test");
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.pushBack(val);
      }
      let res: String | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.popBack();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_PopBack_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'popBack',
        'popBack(): UndefinableString', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_Size_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.size();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Size_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'size',
        'size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_At_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let res: String | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.at(0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_At_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'at',
        'at(index: int): UndefinableString', arkTsAveragedTime);
    })

    it('PerformanceTest_UndefinableStringArray_Set_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new containers.UndefinableStringArray();
      arr.pushBack(new String("test"));
      let val = new String("test2");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.set(0 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Set_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableStringArray', 'set',
        'set(index: int, e: UndefinableString): void', arkTsAveragedTime);
    })

  })
}