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

class CloneableImpl implements Cloneable {
  value: int = 42;
  clone(): Cloneable {
    let copy = new CloneableImpl();
    copy.value = this.value;
    return copy;
  }
}
export default function DeepCopyPerfTest():void {
  describe('DeepCopyPerfTest', () => {
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

    // ========== deepcopy 基础类型测试 ==========

    // deepcopy<String>(null)
    it('PerformanceTest_DeepCopy_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<String>(null);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<String>(undefined)
    it('PerformanceTest_DeepCopy_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String | null | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<String>(undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<String>(string)
    it('PerformanceTest_DeepCopy_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: String = new String("test string");
      let res: String | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<String>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Boolean>(boolean)
    it('PerformanceTest_DeepCopy_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Boolean = new Boolean(true);
      let res: Boolean | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Boolean>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Number>(number)
    it('PerformanceTest_DeepCopy_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Number = new Number(42);
      let res: Number | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Number>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<int>(int)
    it('PerformanceTest_DeepCopy_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: int = 123;
      let res: int | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<int>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<long>(long)
    it('PerformanceTest_DeepCopy_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: long = 12345678 as long;
      let res: long | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<long>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<double>(double)
    it('PerformanceTest_DeepCopy_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: double = 3.14159;
      let res: double | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<double>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // ========== deepcopy 复杂类型测试 ==========

    // deepcopy<Array<number>>(Array)
    it('PerformanceTest_DeepCopy_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Array<number> = new Array<number>();
      src.push(1);
      src.push(2);
      src.push(3);
      let res: Array<number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Array<number>>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Set<number>>(Set)
    it('PerformanceTest_DeepCopy_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Set<number> = new Set<number>();
      src.add(1);
      src.add(2);
      src.add(3);
      let res: Set<number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Set<number>>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Map<string, number>>(Map)
    it('PerformanceTest_DeepCopy_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Map<string, number> = new Map<string, number>();
      src.set("key1", 1);
      src.set("key2", 2);
      src.set("key3", 3);
      let res: Map<string, number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Map<string, number>>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy with depth parameter
    it('PerformanceTest_DeepCopy_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Array<number> = new Array<number>();
      src.push(1);
      src.push(2);
      src.push(3);
      let res: Array<number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Array<number>>(src, -1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy with depth = 0
    it('PerformanceTest_DeepCopy_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Array<number> = new Array<number>();
      src.push(1);
      src.push(2);
      let res: Array<number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Array<number>>(src, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy with depth = 1
    it('PerformanceTest_DeepCopy_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Array<number> = new Array<number>();
      src.push(1);
      src.push(2);
      let res: Array<number> | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Array<number>>(src, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Date>(Date)
    it('PerformanceTest_DeepCopy_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Date = new Date(2024, 1, 1);
      let res: Date | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Date>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // ========== ArkTS 基础类型测试 ==========

    // deepcopy<Byte>(Byte)
    it('PerformanceTest_DeepCopy_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Byte = new Byte(100);
      let res: Byte | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Byte>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Char>(Char)
    it('PerformanceTest_DeepCopy_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Char = c'A';
      let res: Char | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Char>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Short>(Short)
    it('PerformanceTest_DeepCopy_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Short = new Short(1000);
      let res: Short | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Short>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // deepcopy<Float>(Float)
    it('PerformanceTest_DeepCopy_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: Float = new Float(3.14);
      let res: Float | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<Float>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

    // ========== Cloneable 接口测试 ==========

    // Cloneable interface clone method test
    it('PerformanceTest_DeepCopy_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: CloneableImpl = new CloneableImpl();
      let res: Cloneable | null | undefined = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = deepcopy<CloneableImpl>(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DeepCopy_Static_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DeepCopy', 'deepcopy',
        'function deepcopy<T>(src: T | null | undefined, depth?: int = -1): T | null | undefined', arkTsAveragedTime);
    })

  })
}
