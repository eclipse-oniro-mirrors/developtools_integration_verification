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

export default function ErrorsPerfTest() : void{
  describe('ErrorsPerfTest', () => {
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

    // ========== RangeError 测试 ==========

    it('PerformanceTest_RangeError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: RangeError = new RangeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new RangeError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RangeError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RangeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_RangeError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: RangeError = new RangeError("RangeError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new RangeError("RangeError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RangeError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RangeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_RangeError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: RangeError = new RangeError("RangeError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new RangeError("RangeError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RangeError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RangeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_RangeError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: RangeError = new RangeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = RangeError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RangeError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RangeError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): RangeError', arkTsAveragedTime);
    })

    // ========== SyntaxError 测试 ==========

    it('PerformanceTest_SyntaxError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SyntaxError = new SyntaxError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SyntaxError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SyntaxError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SyntaxError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_SyntaxError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SyntaxError = new SyntaxError("SyntaxError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SyntaxError("SyntaxError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SyntaxError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SyntaxError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_SyntaxError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: SyntaxError = new SyntaxError("SyntaxError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new SyntaxError("SyntaxError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SyntaxError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SyntaxError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_SyntaxError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: SyntaxError = new SyntaxError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = SyntaxError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_SyntaxError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'SyntaxError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): SyntaxError', arkTsAveragedTime);
    })

    // ========== AssertionError 测试 ==========

    it('PerformanceTest_AssertionError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AssertionError = new AssertionError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AssertionError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AssertionError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AssertionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AssertionError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AssertionError = new AssertionError("AssertionError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AssertionError("AssertionError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AssertionError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AssertionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AssertionError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: AssertionError = new AssertionError("AssertionError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AssertionError("AssertionError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AssertionError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AssertionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== DivideByZeroError 测试 ==========

    it('PerformanceTest_DivideByZeroError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: DivideByZeroError = new DivideByZeroError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DivideByZeroError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DivideByZeroError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DivideByZeroError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_DivideByZeroError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: DivideByZeroError = new DivideByZeroError("DivideByZeroError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DivideByZeroError("DivideByZeroError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DivideByZeroError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DivideByZeroError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_DivideByZeroError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: DivideByZeroError = new DivideByZeroError("DivideByZeroError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DivideByZeroError("DivideByZeroError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DivideByZeroError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DivideByZeroError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== NullPointerError 测试 ==========

    it('PerformanceTest_NullPointerError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NullPointerError = new NullPointerError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NullPointerError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullPointerError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullPointerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NullPointerError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NullPointerError = new NullPointerError("NullPointerError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NullPointerError("NullPointerError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullPointerError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullPointerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NullPointerError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: NullPointerError = new NullPointerError("NullPointerError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NullPointerError("NullPointerError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullPointerError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullPointerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== UncaughtExceptionError 测试 ==========

    it('PerformanceTest_UncaughtExceptionError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: UncaughtExceptionError = new UncaughtExceptionError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new UncaughtExceptionError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UncaughtExceptionError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UncaughtExceptionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_UncaughtExceptionError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: UncaughtExceptionError = new UncaughtExceptionError("UncaughtExceptionError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new UncaughtExceptionError("UncaughtExceptionError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UncaughtExceptionError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UncaughtExceptionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_UncaughtExceptionError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: UncaughtExceptionError = new UncaughtExceptionError("UncaughtExceptionError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new UncaughtExceptionError("UncaughtExceptionError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UncaughtExceptionError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UncaughtExceptionError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== JSONTypeError 测试 ==========

    it('PerformanceTest_JSONTypeError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: JSONTypeError = new JSONTypeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new JSONTypeError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSONTypeError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'JSONTypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_JSONTypeError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: JSONTypeError = new JSONTypeError("JSONTypeError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new JSONTypeError("JSONTypeError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSONTypeError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'JSONTypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_JSONTypeError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: JSONTypeError = new JSONTypeError("JSONTypeError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new JSONTypeError("JSONTypeError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSONTypeError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'JSONTypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== NegativeArraySizeError 测试 ==========

    it('PerformanceTest_NegativeArraySizeError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NegativeArraySizeError = new NegativeArraySizeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NegativeArraySizeError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NegativeArraySizeError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NegativeArraySizeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NegativeArraySizeError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NegativeArraySizeError = new NegativeArraySizeError("NegativeArraySizeError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NegativeArraySizeError("NegativeArraySizeError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NegativeArraySizeError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NegativeArraySizeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NegativeArraySizeError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: NegativeArraySizeError = new NegativeArraySizeError("NegativeArraySizeError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NegativeArraySizeError("NegativeArraySizeError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NegativeArraySizeError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NegativeArraySizeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ArrayIndexOutOfBoundsError 测试 ==========

    it('PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayIndexOutOfBoundsError = new ArrayIndexOutOfBoundsError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayIndexOutOfBoundsError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayIndexOutOfBoundsError = new ArrayIndexOutOfBoundsError("ArrayIndexOutOfBoundsError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayIndexOutOfBoundsError("ArrayIndexOutOfBoundsError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ArrayIndexOutOfBoundsError = new ArrayIndexOutOfBoundsError("ArrayIndexOutOfBoundsError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayIndexOutOfBoundsError("ArrayIndexOutOfBoundsError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayIndexOutOfBoundsError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ArithmeticError 测试 ==========

    it('PerformanceTest_ArithmeticError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArithmeticError = new ArithmeticError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArithmeticError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArithmeticError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArithmeticError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArithmeticError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArithmeticError = new ArithmeticError("ArithmeticError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArithmeticError("ArithmeticError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArithmeticError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArithmeticError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArithmeticError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ArithmeticError = new ArithmeticError("ArithmeticError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArithmeticError("ArithmeticError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArithmeticError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArithmeticError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== OutOfMemoryError 测试 ==========

    it('PerformanceTest_OutOfMemoryError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: OutOfMemoryError = new OutOfMemoryError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new OutOfMemoryError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_OutOfMemoryError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'OutOfMemoryError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_OutOfMemoryError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: OutOfMemoryError = new OutOfMemoryError("OutOfMemoryError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new OutOfMemoryError("OutOfMemoryError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_OutOfMemoryError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'OutOfMemoryError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_OutOfMemoryError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: OutOfMemoryError = new OutOfMemoryError("OutOfMemoryError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new OutOfMemoryError("OutOfMemoryError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_OutOfMemoryError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'OutOfMemoryError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== StackOverflowError 测试 ==========

    it('PerformanceTest_StackOverflowError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: StackOverflowError = new StackOverflowError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StackOverflowError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StackOverflowError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StackOverflowError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_StackOverflowError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: StackOverflowError = new StackOverflowError("StackOverflowError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StackOverflowError("StackOverflowError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StackOverflowError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StackOverflowError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_StackOverflowError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: StackOverflowError = new StackOverflowError("StackOverflowError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StackOverflowError("StackOverflowError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StackOverflowError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StackOverflowError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== EvalError 测试 ==========

    it('PerformanceTest_EvalError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EvalError = new EvalError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EvalError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EvalError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EvalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_EvalError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EvalError = new EvalError("EvalError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EvalError("EvalError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EvalError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EvalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_EvalError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: EvalError = new EvalError("EvalError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new EvalError("EvalError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EvalError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EvalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_EvalError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: EvalError = new EvalError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = EvalError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EvalError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EvalError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): EvalError', arkTsAveragedTime);
    })

    // ========== NonIntegralIndexError 测试 ==========

    it('PerformanceTest_NonIntegralIndexError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NonIntegralIndexError = new NonIntegralIndexError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NonIntegralIndexError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NonIntegralIndexError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NonIntegralIndexError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NonIntegralIndexError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NonIntegralIndexError = new NonIntegralIndexError("NonIntegralIndexError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NonIntegralIndexError("NonIntegralIndexError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NonIntegralIndexError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NonIntegralIndexError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NonIntegralIndexError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: NonIntegralIndexError = new NonIntegralIndexError("NonIntegralIndexError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NonIntegralIndexError("NonIntegralIndexError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NonIntegralIndexError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NonIntegralIndexError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NonIntegralIndexError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NonIntegralIndexError = new NonIntegralIndexError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = NonIntegralIndexError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NonIntegralIndexError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NonIntegralIndexError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): NonIntegralIndexError', arkTsAveragedTime);
    })

    // ========== TypeError 测试 ==========

    it('PerformanceTest_TypeError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: TypeError = new TypeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TypeError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_TypeError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: TypeError = new TypeError("TypeError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TypeError("TypeError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_TypeError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: TypeError = new TypeError("TypeError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TypeError("TypeError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_TypeError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: TypeError = new TypeError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = TypeError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): TypeError', arkTsAveragedTime);
    })

    // ========== ReferenceError 测试 ==========

    it('PerformanceTest_ReferenceError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ReferenceError = new ReferenceError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ReferenceError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReferenceError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReferenceError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ReferenceError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ReferenceError = new ReferenceError("ReferenceError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ReferenceError("ReferenceError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReferenceError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReferenceError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ReferenceError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ReferenceError = new ReferenceError("ReferenceError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ReferenceError("ReferenceError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReferenceError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReferenceError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ReferenceError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ReferenceError = new ReferenceError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ReferenceError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReferenceError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReferenceError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): ReferenceError', arkTsAveragedTime);
    })

    // ========== URIError 测试 ==========

    it('PerformanceTest_URIError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: URIError = new URIError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new URIError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_URIError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'URIError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_URIError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: URIError = new URIError("URIError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new URIError("URIError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_URIError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'URIError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_URIError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: URIError = new URIError("URIError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new URIError("URIError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_URIError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'URIError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_URIError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: URIError = new URIError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = URIError.$_invoke("invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_URIError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'URIError', '$_invoke',
        'static $_invoke(message?: String, options?: ErrorOptions): URIError', arkTsAveragedTime);
    })

    // ========== AggregateError 测试 ==========

    it('PerformanceTest_AggregateError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Error[] = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Error[], message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Error[] = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors, "AggregateError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors, "AggregateError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Error[], message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Error[] = [new Error("error1"), new Error("error2")];
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: AggregateError = new AggregateError(errors, "AggregateError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors, "AggregateError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Error[], message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Iterable<Error> = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Iterable<Error>, message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Iterable<Error> = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors, "AggregateError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors, "AggregateError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Iterable<Error>, message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Iterable<Error> = [new Error("error1"), new Error("error2")];
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: AggregateError = new AggregateError(errors, "AggregateError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new AggregateError(errors, "AggregateError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', 'constructor',
        'constructor(errors: Iterable<Error>, message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Error[] = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AggregateError.$_invoke(errors);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', '$_invoke',
        'static $_invoke(errors: Error[], message?: String, options?: ErrorOptions): AggregateError', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Error[] = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AggregateError.$_invoke(errors, "invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', '$_invoke',
        'static $_invoke(errors: Error[], message?: String, options?: ErrorOptions): AggregateError', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Iterable<Error> = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AggregateError.$_invoke(errors);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', '$_invoke',
        'static $_invoke(errors: Iterable<Error>, message?: String, options?: ErrorOptions): AggregateError', arkTsAveragedTime);
    })

    it('PerformanceTest_AggregateError_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errors: Iterable<Error> = [new Error("error1"), new Error("error2")];
      let res: AggregateError = new AggregateError(errors);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AggregateError.$_invoke(errors, "invoke message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AggregateError_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AggregateError', '$_invoke',
        'static $_invoke(errors: Iterable<Error>, message?: String, options?: ErrorOptions): AggregateError', arkTsAveragedTime);
    })

    it('PerformanceTest_FormatError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: FormatError = new FormatError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new FormatError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FormatError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FormatError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_FormatError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: FormatError = new FormatError("FormatError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new FormatError("FormatError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FormatError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FormatError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_FormatError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: FormatError = new FormatError("FormatError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new FormatError("FormatError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FormatError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FormatError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InstantiationError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InstantiationError = new InstantiationError("InstantiationError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InstantiationError("InstantiationError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstantiationError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InstantiationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InstantiationError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: InstantiationError = new InstantiationError("InstantiationError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InstantiationError("InstantiationError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstantiationError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InstantiationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== InternalError 测试 ==========

    it('PerformanceTest_InternalError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InternalError = new InternalError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InternalError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InternalError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InternalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InternalError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InternalError = new InternalError("InternalError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InternalError("InternalError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InternalError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InternalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InternalError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: InternalError = new InternalError("InternalError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InternalError("InternalError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InternalError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InternalError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== IndexOutOfBoundsError 测试 ==========

    it('PerformanceTest_IndexOutOfBoundsError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IndexOutOfBoundsError = new IndexOutOfBoundsError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IndexOutOfBoundsError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IndexOutOfBoundsError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_IndexOutOfBoundsError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IndexOutOfBoundsError = new IndexOutOfBoundsError("IndexOutOfBoundsError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IndexOutOfBoundsError("IndexOutOfBoundsError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IndexOutOfBoundsError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_IndexOutOfBoundsError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: IndexOutOfBoundsError = new IndexOutOfBoundsError("IndexOutOfBoundsError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IndexOutOfBoundsError("IndexOutOfBoundsError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IndexOutOfBoundsError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== StringIndexOutOfBoundsError 测试 ==========

    it('PerformanceTest_StringIndexOutOfBoundsError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: StringIndexOutOfBoundsError = new StringIndexOutOfBoundsError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StringIndexOutOfBoundsError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringIndexOutOfBoundsError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_StringIndexOutOfBoundsError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: StringIndexOutOfBoundsError = new StringIndexOutOfBoundsError("StringIndexOutOfBoundsError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StringIndexOutOfBoundsError("StringIndexOutOfBoundsError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringIndexOutOfBoundsError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_StringIndexOutOfBoundsError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: StringIndexOutOfBoundsError = new StringIndexOutOfBoundsError("StringIndexOutOfBoundsError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new StringIndexOutOfBoundsError("StringIndexOutOfBoundsError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringIndexOutOfBoundsError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringIndexOutOfBoundsError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ClassCastError 测试 ==========

    it('PerformanceTest_ClassCastError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ClassCastError = new ClassCastError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ClassCastError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassCastError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassCastError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ClassCastError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ClassCastError = new ClassCastError("ClassCastError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ClassCastError("ClassCastError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassCastError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassCastError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ClassCastError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ClassCastError = new ClassCastError("ClassCastError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ClassCastError("ClassCastError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassCastError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassCastError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== NeverError 测试 ==========

    it('PerformanceTest_NeverError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NeverError = new NeverError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NeverError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NeverError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NeverError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NeverError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: NeverError = new NeverError("NeverError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NeverError("NeverError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NeverError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NeverError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_NeverError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: NeverError = new NeverError("NeverError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new NeverError("NeverError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NeverError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NeverError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ArrayStoreError 测试 ==========

    it('PerformanceTest_ArrayStoreError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayStoreError = new ArrayStoreError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayStoreError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayStoreError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayStoreError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayStoreError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayStoreError = new ArrayStoreError("ArrayStoreError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayStoreError("ArrayStoreError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayStoreError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayStoreError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayStoreError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ArrayStoreError = new ArrayStoreError("ArrayStoreError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayStoreError("ArrayStoreError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayStoreError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayStoreError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ExceptionInInitializerError 测试 ==========

    it('PerformanceTest_ExceptionInInitializerError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ExceptionInInitializerError = new ExceptionInInitializerError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ExceptionInInitializerError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ExceptionInInitializerError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ExceptionInInitializerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ExceptionInInitializerError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ExceptionInInitializerError = new ExceptionInInitializerError("ExceptionInInitializerError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ExceptionInInitializerError("ExceptionInInitializerError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ExceptionInInitializerError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ExceptionInInitializerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ExceptionInInitializerError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ExceptionInInitializerError = new ExceptionInInitializerError("ExceptionInInitializerError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ExceptionInInitializerError("ExceptionInInitializerError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ExceptionInInitializerError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ExceptionInInitializerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== CoroutinesLimitExceedError 测试 ==========

    it('PerformanceTest_CoroutinesLimitExceedError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: CoroutinesLimitExceedError = new CoroutinesLimitExceedError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new CoroutinesLimitExceedError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutinesLimitExceedError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CoroutinesLimitExceedError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_CoroutinesLimitExceedError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: CoroutinesLimitExceedError = new CoroutinesLimitExceedError("CoroutinesLimitExceedError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new CoroutinesLimitExceedError("CoroutinesLimitExceedError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutinesLimitExceedError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CoroutinesLimitExceedError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_CoroutinesLimitExceedError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: CoroutinesLimitExceedError = new CoroutinesLimitExceedError("CoroutinesLimitExceedError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new CoroutinesLimitExceedError("CoroutinesLimitExceedError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CoroutinesLimitExceedError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CoroutinesLimitExceedError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== IllegalLockStateError 测试 ==========

    it('PerformanceTest_IllegalLockStateError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IllegalLockStateError = new IllegalLockStateError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IllegalLockStateError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IllegalLockStateError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IllegalLockStateError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_IllegalLockStateError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IllegalLockStateError = new IllegalLockStateError("IllegalLockStateError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IllegalLockStateError("IllegalLockStateError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IllegalLockStateError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IllegalLockStateError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_IllegalLockStateError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: IllegalLockStateError = new IllegalLockStateError("IllegalLockStateError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IllegalLockStateError("IllegalLockStateError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_IllegalLockStateError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IllegalLockStateError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== InvalidJobOperationError 测试 ==========

    it('PerformanceTest_InvalidJobOperationError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidJobOperationError = new InvalidJobOperationError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidJobOperationError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidJobOperationError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidJobOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidJobOperationError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidJobOperationError = new InvalidJobOperationError("InvalidJobOperationError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidJobOperationError("InvalidJobOperationError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidJobOperationError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidJobOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidJobOperationError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: InvalidJobOperationError = new InvalidJobOperationError("InvalidJobOperationError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidJobOperationError("InvalidJobOperationError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidJobOperationError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidJobOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== InvalidAsyncOperationError 测试 ==========

    it('PerformanceTest_InvalidAsyncOperationError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidAsyncOperationError = new InvalidAsyncOperationError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidAsyncOperationError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidAsyncOperationError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidAsyncOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidAsyncOperationError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidAsyncOperationError = new InvalidAsyncOperationError("InvalidAsyncOperationError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidAsyncOperationError("InvalidAsyncOperationError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidAsyncOperationError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidAsyncOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidAsyncOperationError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: InvalidAsyncOperationError = new InvalidAsyncOperationError("InvalidAsyncOperationError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidAsyncOperationError("InvalidAsyncOperationError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidAsyncOperationError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidAsyncOperationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== ArgumentsUnderapplicationError 测试 ==========

    it('PerformanceTest_ArgumentsUnderapplicationError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArgumentsUnderapplicationError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArgumentsUnderapplicationError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArgumentsUnderapplicationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArgumentsUnderapplicationError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError("ArgumentsUnderapplicationError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArgumentsUnderapplicationError("ArgumentsUnderapplicationError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArgumentsUnderapplicationError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArgumentsUnderapplicationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArgumentsUnderapplicationError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError("ArgumentsUnderapplicationError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArgumentsUnderapplicationError("ArgumentsUnderapplicationError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArgumentsUnderapplicationError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArgumentsUnderapplicationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // ========== InvalidStoreAccessError 测试 ==========

    it('PerformanceTest_InvalidStoreAccessError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidStoreAccessError = new InvalidStoreAccessError();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidStoreAccessError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidStoreAccessError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidStoreAccessError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidStoreAccessError_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: InvalidStoreAccessError = new InvalidStoreAccessError("InvalidStoreAccessError message");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidStoreAccessError("InvalidStoreAccessError message");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidStoreAccessError_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidStoreAccessError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_InvalidStoreAccessError_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: ErrorOptions = { cause: new Error("cause") };
      let res: InvalidStoreAccessError = new InvalidStoreAccessError("InvalidStoreAccessError message", options);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new InvalidStoreAccessError("InvalidStoreAccessError message", options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvalidStoreAccessError_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvalidStoreAccessError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

  })
}
