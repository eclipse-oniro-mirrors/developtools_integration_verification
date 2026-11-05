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

class TestData {
  name: string = 'test';
  value: int = 123;
}

class Person {
  name: string = '';
  age: int = 0;
}

export default function ConsolePerfTest(): void {
  describe('ConsolePerfTest', () => {
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


    it('PerformanceTest_Console_getInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Console.getInstance();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_getInstance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'getInstance',
        'public static getInstance(): Console', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_print_boolean_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_boolean_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_print_int_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(123);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_int_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_print_string_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print('test');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_string_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: String): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_println_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println('test');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_int_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(123);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_int_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: int): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_log_string_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log('test');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_string_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: String): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_int_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log(123);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_int_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: int): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_debug_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.debug('debug message');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_debug_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'debug',
        'public debug(...vals: Any[]): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_info_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.info('info message');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_info_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'info',
        'public info(...vals: Any[]): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_warn_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.warn('warn message');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_warn_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'warn',
        'public warn(...vals: Any[]): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_error_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.error('error message');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_error_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'error',
        'public error(...vals: Any[]): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_assert_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.assert(true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_assert_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'assert',
        'public assert(...vals: Any[]): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_count_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.count('test');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_count_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'count',
        'public count(label?: string): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_countReset_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.countReset('test');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_countReset_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'countReset',
        'public countReset(label?: string): void', arkTsAveragedTime);
    })


    it('PerformanceTest_Console_time_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.time('timer');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_time_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'time',
        'public time(label?: string): void', arkTsAveragedTime);
    })


    //格式不规范
    // it('PerformanceTest_Console_timeEnd_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arrcon = new Array<Console>();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arrcon.push(Console.getInstance());
    //   }
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arrcon[i].time('timer');
    //   }
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arrcon[i].timeEnd('timer');
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
	  // let res1 = arrcon;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_timeEnd_1700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'timeEnd',
    //     'public timeEnd(label?: string): void', arkTsAveragedTime);
    // })


    it('PerformanceTest_Console_group_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.group('group');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_group_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'group',
        'public group(...objs: Any[]): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_trace_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.trace('trace message');
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_trace_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'trace',
        'public trace(...data: Any[]): void', arkTsAveragedTime);
    })

    // ========== print() 方法补充测试 ==========
    it('PerformanceTest_Console_print_long_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let longVar = new Long(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_long_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_print_float_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(3.14f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_float_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: float): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_print_double_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(2.71828);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_double_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: double): void', arkTsAveragedTime);
    })

    // ========== println() 方法补充测试 ==========
    it('PerformanceTest_Console_println_void_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_void_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_boolean_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_boolean_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_long_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let longVar = new Long(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_long_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_double_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(3.14159);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_double_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: double): void', arkTsAveragedTime);
    })

    // ========== log() 方法补充测试 ==========
    it('PerformanceTest_Console_log_void_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_void_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_boolean_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_boolean_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_long_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let longVar = new Long(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log(longVar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_long_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_variadic_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log('msg', 123, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_variadic_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(...vals: Any[]): void', arkTsAveragedTime);
    })

    // ========== dir/dirxml 方法测试 ==========
    it('PerformanceTest_Console_dir_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let obj: TestData = new TestData();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.dir(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_dir_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'dir',
        'public dir(obj?: Any): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_dirxml_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.dirxml('xml data');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_dirxml_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'dirxml',
        'public dirxml(...obj: Any[]): void', arkTsAveragedTime);
    })

    // ========== groupEnd/groupCollapsed 方法测试 ==========
    it('PerformanceTest_Console_groupEnd_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.groupEnd();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_groupEnd_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'groupEnd',
        'public groupEnd(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_groupCollapsed_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.groupCollapsed('collapsed group');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_groupCollapsed_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'groupCollapsed',
        'public groupCollapsed(...objs: Any[]): void', arkTsAveragedTime);
    })

    // ========== table 方法测试 ==========
    it('PerformanceTest_Console_table_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let person1: Person = new Person();
      person1.name = 'Alice';
      person1.age = 30;
      let person2: Person = new Person();
      person2.name = 'Bob';
      person2.age = 25;
      let data: Person[] = [person1, person2];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.table(data);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_table_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'table',
        'public table(...data: Any[]): void', arkTsAveragedTime);
    })

    // ========== timeLog 方法测试 ==========
    it('PerformanceTest_Console_timeLog_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      con.time('testTimer');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.timeLog('testTimer');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_timeLog_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'timeLog',
        'public timeLog(label?: string, ...arguments: Object[]): void', arkTsAveragedTime);
    })

    // ========== byte 类型测试 ==========
    it('PerformanceTest_Console_print_byte_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(127 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_byte_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_byte_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(100 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_byte_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_byte_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log(65 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_byte_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: byte): void', arkTsAveragedTime);
    })

    // ========== short 类型测试 ==========
    it('PerformanceTest_Console_print_short_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print(32767 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_short_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: short): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_short_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println(12345 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_short_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: short): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_short_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log(9999 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_short_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: short): void', arkTsAveragedTime);
    })

    // ========== char 类型测试 ==========
    it('PerformanceTest_Console_print_char_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.print('A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_char_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'print',
        'public print(i: char): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_println_char_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.println('Z');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_println_char_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'println',
        'public println(i: char): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Console_log_char_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let con: Console = Console.getInstance();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        con.log('M');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = con;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_char_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
        'public log(i: char): void', arkTsAveragedTime);
    })

  })
}
