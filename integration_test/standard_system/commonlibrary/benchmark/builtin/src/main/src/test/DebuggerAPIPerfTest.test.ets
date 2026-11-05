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

export default function DebuggerAPIPerfTest():void {
  describe('DebuggerAPIPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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


    it('PerformanceTest_DebuggerAPI_getLocalBoolean_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalBoolean(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalBoolean_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalBoolean',
          'static getLocalBoolean(regNumber: long): boolean', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalBoolean_0100: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalByte 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalByte_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalByte(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalByte_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalByte',
          'static getLocalByte(regNumber: long): byte', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalByte_0200: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalShort 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalShort_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: short = 0;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalShort(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalShort_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalShort',
          'static getLocalShort(regNumber: long): short', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalShort_0300: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalChar 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalChar_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\0';
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalChar(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalChar_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalChar',
          'static getLocalChar(regNumber: long): char', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalChar_0400: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalInt 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalInt_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalInt(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalInt_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalInt',
          'static getLocalInt(regNumber: long): int', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalInt_0500: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalFloat 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalFloat_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float = 0.0f;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalFloat(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalFloat_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalFloat',
          'static getLocalFloat(regNumber: long): float', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalFloat_0600: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalDouble 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalDouble_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = 0.0;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalDouble(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalDouble_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalDouble',
          'static getLocalDouble(regNumber: long): double', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalDouble_0700: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalLong 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalLong_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalLong(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalLong_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalLong',
          'static getLocalLong(regNumber: long): long', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalLong_0800: skip - Debugger is not enabled');
      }
    })

    // ========== getLocalObject 测试 ==========
    it('PerformanceTest_DebuggerAPI_getLocalObject_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Object | null = null;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = DebuggerAPI.getLocalObject(0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getLocalObject_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getLocalObject',
          'static getLocalObject(regNumber: long): Object', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_getLocalObject_0900: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalBoolean 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalBoolean_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalBoolean(0, true);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalBoolean_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalBoolean',
          'static setLocalBoolean(regNumber: long, value: boolean): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalBoolean_1000: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalByte 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalByte_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalByte(0, 1 as byte);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalByte_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalByte',
          'static setLocalByte(regNumber: long, value: byte): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalByte_1100: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalShort 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalShort_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalShort(0, 100 as short);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalShort_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalShort',
          'static setLocalShort(regNumber: long, value: short): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalShort_1200: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalChar 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalChar_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalChar(0, c'A');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalChar_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalChar',
          'static setLocalChar(regNumber: long, value: char): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalChar_1300: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalInt 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalInt_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalInt(0, 42);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalInt_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalInt',
          'static setLocalInt(regNumber: long, value: int): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalInt_1400: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalFloat 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalFloat_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let value: float = 3.14f;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalFloat(0, value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalFloat_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalFloat',
          'static setLocalFloat(regNumber: long, value: float): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalFloat_1500: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalDouble 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalDouble_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalDouble(0, 3.1415926);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalDouble_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalDouble',
          'static setLocalDouble(regNumber: long, value: double): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalDouble_1600: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalLong 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalLong_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let value = 123456789 as long;
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalLong(0,value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalLong_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalLong',
          'static setLocalLong(regNumber: long, value: long): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalLong_1700: skip - Debugger is not enabled');
      }
    })

    // ========== setLocalObject 测试 ==========
    it('PerformanceTest_DebuggerAPI_setLocalObject_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let testObj: Object = new Object();
      try {
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          DebuggerAPI.setLocalObject(0, testObj);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_setLocalObject_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'setLocalObject',
          'static setLocalObject(regNumber: long, value: Object): void', arkTsAveragedTime);
      } catch (e) {
        console.info('arkTsPerformanceTest PerformanceTest_DebuggerAPI_setLocalObject_1800: skip - Debugger is not enabled');
      }
    })

    // ========== getCallerABCPath 测试 ==========
    // it('PerformanceTest_DebuggerAPI_getCallerABCPath_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res: String = new String('');
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = DebuggerAPI.getCallerABCPath();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DebuggerAPI_getCallerABCPath_1900: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.debug', 'DebuggerAPI', 'getCallerABCPath',
    //     'static getCallerABCPath(): String', arkTsAveragedTime);
    // })

  })
}
