/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from '@ohos/hypium';
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ConsolePerfTest(): void {
  describe('ConsolePerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Console_print_boolean_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.info('true');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_print_boolean_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'info',
          'public info(...vals: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_log_string_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.log('test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_log_string_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'log',
          'public log(i: String): void', arkTsAveragedTime);
        done();
      })


    it('PerformanceTest_Console_debug_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.debug('debug message');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_debug_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'debug',
          'public debug(...vals: Any[]): void', arkTsAveragedTime);
        done();
      })


    it('PerformanceTest_Console_warn_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.warn('warn message');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_warn_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'warn',
          'public warn(...vals: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_error_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.error('error message');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_error_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'error',
          'public error(...vals: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_assert_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.assert('true', 'assert');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_assert_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'assert',
          'public assert(...vals: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_count_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.count('test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        res = console.countReset('test');
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_count_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'count',
          'public count(label?: string): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_countReset_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.count('test' + i);
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.countReset('test' + i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_countReset_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'countReset',
          'public countReset(label?: string): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_time_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.time('timer');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        res = console.timeEnd('timer');
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_time_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'time',
          'public time(label?: string): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_timeEnd_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.time('timer' + i);
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.timeEnd('timer' + i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_timeEnd_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'timeEnd',
          'public timeEnd(label?: string): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_group_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.group('group');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.groupEnd();
        }
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_group_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'group',
          'public group(...objs: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_trace_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.trace('trace message');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_trace_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'trace',
          'public trace(...data: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_dir_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.dir('test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_dir_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'dir',
          'public dir(obj?: Any): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_dirxml_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.dirxml('xml data');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_dirxml_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'dirxml',
          'public dirxml(...obj: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_groupEnd_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.group('groupEnd');
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.groupEnd();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_groupEnd_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'groupEnd',
          'public groupEnd(): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_groupCollapsed_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.groupCollapsed('collapsed group');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.groupEnd();
        }
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_groupCollapsed_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'groupCollapsed',
          'public groupCollapsed(...objs: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_table_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        let data: Array<string> = ['Alice', 'Bob'];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.table(data);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_table_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'table',
          'public table(...data: Any[]): void', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_Console_timeLog_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: void = undefined;
        res = console.time('testTimer');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = console.timeLog('testTimer');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        res = console.timeEnd('testTimer');
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Console_timeLog_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Console', 'timeLog',
          'public timeLog(label?: string, ...arguments: Object[]): void', arkTsAveragedTime);
        done();
      })

  })
}
