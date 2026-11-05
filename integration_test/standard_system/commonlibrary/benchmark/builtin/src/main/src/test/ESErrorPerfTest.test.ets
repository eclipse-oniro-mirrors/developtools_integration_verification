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

export default function ESErrorPerfTest(): void {
  describe('ESErrorPerfTest', () => {
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
    // 0. ESError Constructor
    // ================================================================

    it('PerformanceTest_ESError_Constructor_0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err: ESError = new ESError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        err = new ESError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = err;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_Constructor_0000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'constructor', 'constructor(err: Any)', arkTsAveragedTime);
    })

    // ================================================================
    // 1. ESError Getters & Setters
    // ================================================================

    it('PerformanceTest_ESError_GetName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = err.name;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_GetName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'name(get)', 'get name(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ESError_SetName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let val = "TestErrorName";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        err.name = val;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = err.name;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_SetName_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'name(set)', 'set name(val: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_ESError_GetMessage_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = err.message;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_GetMessage_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'message(get)', 'get message(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ESError_SetMessage_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let val = "Test error message";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        err.message = val;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = err.message;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_SetMessage_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'message(set)', 'set message(val: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_ESError_GetCause_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let res: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = err.cause;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_GetCause_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'cause(get)', 'get cause(): ESValue | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_ESError_SetCause_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let causeObj = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        err.cause = causeObj;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = err.cause;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_SetCause_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'cause(set)', 'set cause(val: Object | undefined)', arkTsAveragedTime);
    })

    // ================================================================
    // 2. ESError Methods
    // ================================================================

    it('PerformanceTest_ESError_GetValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let err = new ESError();
      let res: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = err.getValue();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ESError_GetValue_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'ESError', 'getValue', 'getValue(): ESValue', arkTsAveragedTime);
    })

  })
}