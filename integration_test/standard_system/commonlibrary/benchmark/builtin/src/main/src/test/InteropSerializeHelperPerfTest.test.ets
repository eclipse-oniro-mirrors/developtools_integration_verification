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

export default function InteropSerializeHelperPerfTest(): void {
  describe('InteropSerializeHelperPerfTest', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 1000;
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

    it('PerformanceTest_InteropArgRecord_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InteropArgRecord = new InteropArgRecord();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InteropArgRecord();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropArgRecord_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropArgRecord', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropArgRecord_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InteropArgRecord = new InteropArgRecord(InteropArgType.DIRECT, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InteropArgRecord(InteropArgType.DIRECT, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropArgRecord_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropArgRecord', 'constructor',
        'constructor(type: InteropArgType, value: Any)', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropArgRecord_Type_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let record: InteropArgRecord = new InteropArgRecord(InteropArgType.DIRECT, 0);
      let res: InteropArgType = InteropArgType.DIRECT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = record.type;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropArgRecord_Type_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropArgRecord', 'type',
        'type: InteropArgType', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropArgRecord_Value_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let record: InteropArgRecord = new InteropArgRecord(InteropArgType.DIRECT, 42);
      let res: Any = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = record.value;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropArgRecord_Value_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropArgRecord', 'value',
        'value: Any', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropSerializeHelper_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let args: FixedArray<Any> = new FixedArray<Any>(3, undefined);
      args[0] = 1;
      args[1] = "test";
      args[2] = true;
      let res: InteropSerializeHelper = new InteropSerializeHelper(args);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InteropSerializeHelper(args);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropSerializeHelper_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropSerializeHelper', 'constructor',
        'constructor(args: FixedArray<Any>)', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropSerializeHelper_Deserialize_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let args: FixedArray<Any> = new FixedArray<Any>(3, undefined);
      args[0] = 1;
      args[1] = "test";
      args[2] = true;
      let helper: InteropSerializeHelper = new InteropSerializeHelper(args);
      let res: FixedArray<Any> = new FixedArray<Any>(0, undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = helper.deserialize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropSerializeHelper_Deserialize_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropSerializeHelper', 'deserialize',
        'deserialize(): FixedArray<Any>', arkTsAveragedTime);
    })

    it('PerformanceTest_InteropSerializeHelper_IsJSInteropRef_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let testVal: Any = 42;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropSerializeHelper.isJSInteropRef(testVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropSerializeHelper_IsJSInteropRef_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropSerializeHelper', 'isJSInteropRef',
        'isJSInteropRef(value: Any): boolean', arkTsAveragedTime);
    })

    // Note: JSValue tests require dynamic type input which cannot be created in pure ArkTS
    // environment. Commented out to prevent runtime crashes.

    /*
    it('PerformanceTest_InteropSerializeHelper_SerializeHandle_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsVal: JSValue = new JSValue();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropSerializeHelper.serializeHandle(jsVal);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropSerializeHelper_SerializeHandle_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropSerializeHelper', 'serializeHandle',
        'serializeHandle(value: JSValue): long', arkTsAveragedTime);
    })
    */

    /*
    it('PerformanceTest_InteropSerializeHelper_DeserializeHandle_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsVal: JSValue = new JSValue();
      let handle: long = InteropSerializeHelper.serializeHandle(jsVal);
      let res: JSValue = new JSValue();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropSerializeHelper.deserializeHandle(handle);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropSerializeHelper_DeserializeHandle_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop', 'InteropSerializeHelper', 'deserializeHandle',
        'deserializeHandle(value: long): JSValue', arkTsAveragedTime);
    })
    */

  })
}
