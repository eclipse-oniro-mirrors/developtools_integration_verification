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

export default function DatePerfTest(): void {
  describe('DatePerfTest', () => {
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

    it('PerformanceTest_Date_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date(1234567890000 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor(value: long)', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date('2024-01-01');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor(value: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date(2024 as int, 5 as int, 15 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor(year: int, monthIndex: int, day?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date(2024 as int, 5 as int, 15 as int, 12 as int, 30 as int, 45 as int, 500 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor(year: int, monthIndex: int, day?: int, hours?: int, minutes?: int, seconds?: int, ms?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.$_invoke();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', '$_invoke',
        'static $_invoke(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.now();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'now',
        'static now(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.getLocalTimezoneOffset(0 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getLocalTimezoneOffset',
        'static getLocalTimezoneOffset(ms: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.getTimezoneName(0 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getTimezoneName',
        'static getTimezoneName(ms: long): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.parse('2024-01-01');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'parse',
        'static parse(dateStr: string): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.UTC(2024 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'UTC',
        'static UTC(year: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Static_Method_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Date.UTC(2024 as int, 5 as int, 15 as int, 12 as int, 30 as int, 45 as int, 500 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Static_Method_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'UTC',
        'static UTC(year: int, month: int, day?: int, hours?: int, minutes?: int, seconds?: int, ms?: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.isDateValid();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'isDateValid',
        'isDateValid(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'valueOf',
        'valueOf(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getDate();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getDate',
        'getDate(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getDay();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getDay',
        'getDay(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getMonth();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getMonth',
        'getMonth(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getFullYear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getFullYear',
        'getFullYear(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getHours();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getHours',
        'getHours(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getMinutes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getMinutes',
        'getMinutes(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getSeconds();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getSeconds',
        'getSeconds(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getMilliseconds();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getMilliseconds',
        'getMilliseconds(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getTime();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getTime',
        'getTime(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCDate();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCDate',
        'getUTCDate(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCDay();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCDay',
        'getUTCDay(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCMonth();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCMonth',
        'getUTCMonth(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCFullYear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCFullYear',
        'getUTCFullYear(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCHours();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCHours',
        'getUTCHours(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCMinutes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCMinutes',
        'getUTCMinutes(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCSeconds();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCSeconds',
        'getUTCSeconds(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getUTCMilliseconds();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getUTCMilliseconds',
        'getUTCMilliseconds(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.getTimezoneOffset();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'getTimezoneOffset',
        'getTimezoneOffset(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toDateString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toDateString',
        'toDateString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toTimeString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toTimeString',
        'toTimeString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toUTCString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toUTCString',
        'toUTCString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toISOString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toISOString',
        'toISOString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toLocaleTimeString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toLocaleTimeString',
        'toLocaleTimeString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toLocaleDateString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toLocaleDateString',
        'toLocaleDateString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setTime(1234567890000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setTime',
        'setTime(value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setDate(15 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setDate',
        'setDate(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setFullYear(2024);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setFullYear',
        'setFullYear(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setMonth(5 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setMonth',
        'setMonth(month: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setHours(12 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setHours',
        'setHours(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setMinutes(30 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setMinutes',
        'setMinutes(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setSeconds(45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setSeconds',
        'setSeconds(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setMilliseconds(500 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setMilliseconds',
        'setMilliseconds(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCDate(15 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCDate',
        'setUTCDate(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCFullYear(2024 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCFullYear',
        'setUTCFullYear(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCMonth(5 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCMonth',
        'setUTCMonth(month: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCHours(12 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCHours',
        'setUTCHours(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCMinutes(30 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCMinutes',
        'setUTCMinutes(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCSeconds(45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCSeconds',
        'setUTCSeconds(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCMilliseconds(500 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCMilliseconds',
        'setUTCMilliseconds(value: int): long', arkTsAveragedTime);
    })

    // ========== setHours 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setHours(12 , 30 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setHours',
        'setHours(value: int, min: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setHours(12 , 30 , 45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setHours',
        'setHours(value: int, min: int, sec: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setHours(12 , 30 , 45 , 500);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setHours',
        'setHours(value: int, min: int, sec: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setMinutes 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setMinutes(30 , 45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setMinutes',
        'setMinutes(value: int, sec: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setMinutes(30 , 45 , 500 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setMinutes',
        'setMinutes(value: int, sec: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setSeconds 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setSeconds(45 , 500 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setSeconds',
        'setSeconds(value: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setUTCHours 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCHours(12 , 30 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCHours',
        'setUTCHours(value: int, min: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCHours(12 , 30 , 45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCHours',
        'setUTCHours(value: int, min: int, sec: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCHours(12 , 30 , 45 , 500 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCHours',
        'setUTCHours(value: int, min: int, sec: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setUTCMinutes 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCMinutes(30, 45 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCMinutes',
        'setUTCMinutes(value: int, sec: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCMinutes(30 , 45 , 500);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCMinutes',
        'setUTCMinutes(value: int, sec: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setUTCSeconds 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCSeconds(45 , 500);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCSeconds',
        'setUTCSeconds(value: int, ms: int): long', arkTsAveragedTime);
    })

    // ========== setFullYear 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setFullYear(2024 , 5 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setFullYear',
        'setFullYear(value: int, month: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setFullYear(2024, 5 , 15 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setFullYear',
        'setFullYear(value: int, month: int, date: int): long', arkTsAveragedTime);
    })

    // ========== setUTCFullYear 重载方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCFullYear(2024, 5 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCFullYear',
        'setUTCFullYear(value: int, month: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Date_Instance_Method_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.setUTCFullYear(2024 as int, 5 as int, 15 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setUTCFullYear',
        'setUTCFullYear(value: int, month: int, date: int): long', arkTsAveragedTime);
    })

    // ========== setYear 方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        dateObj.setYear(2024);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = dateObj;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_5900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'setYear',
        'setYear(value: int): void', arkTsAveragedTime);
    })

    // ========== toLocaleString 方法测试 ==========

    it('PerformanceTest_Date_Instance_Method_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateObj = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = dateObj.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Instance_Method_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'toLocaleString',
        'toLocaleString(): string', arkTsAveragedTime);
    })

    // ========== Constructor Date 对象参数测试 ==========

    it('PerformanceTest_Date_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dateSource = new Date(2024, 5 , 15 );
      let res: Date = new Date();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Date(dateSource);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Date_Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Date', 'constructor',
        'function constructor(value: Date)', arkTsAveragedTime);
    })

  })
}
