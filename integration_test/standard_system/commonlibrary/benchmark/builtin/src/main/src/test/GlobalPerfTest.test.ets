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

export default function GlobalPerfTest(): void {
  describe('GlobalPerfTest', () => {
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

    it('PerformanceTest_Global_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInt("123");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt',
        'parseInt(s: String): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInt("123", 16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt_radix',
        'parseInt(s: String, radix: int): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseFloat("3.14");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseFloat',
        'parseFloat(s: String): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isNaN(3.14);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isNaN',
        'isNaN(d: number): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isNaN(Float.NaN);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isNaN_float',
        'isNaN(f: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isFinite(3.14);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isFinite',
        'isFinite(d: number): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isFinite(3.14f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isFinite_float',
        'isFinite(f: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isInteger(42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isInteger',
        'isInteger(v: number): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInt("123", 16.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt_radix_number',
        'parseInt(s: String, radix: number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isSafeInteger(42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger',
        'isSafeInteger(v: number): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let longValue = new Long(42);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isSafeInteger(longValue);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger_long',
        'isSafeInteger(v: long): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isSafeInteger(42 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger_int',
        'isSafeInteger(v: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Global_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = isSafeInteger(42.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger_float',
        'isSafeInteger(v: float): boolean', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_Global_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let timerIdList: Array<int> = new Array<int>(BASE_COUNT);
      let func = () => { let a = 1; };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        timerIdList[i] = setTimeout(func);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      for (let i = 0; i < timerIdList.length; i++) {
        clearTimeout(timerIdList[i]);
      }
      let res1 = timerIdList.length;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'setTimeout',
        'setTimeout(func: Function): int', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_Global_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let timerIdList: Array<int> = new Array<int>();
      let func = () => { let a = 1; };
      for (let i = 0; i < BASE_COUNT; i++) {
        timerIdList.push(setTimeout(func));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        clearTimeout(timerIdList[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = timerIdList.length;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'clearTimeout',
        'clearTimeout(timerId?: int | null): void', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_Global_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let timerIdList: Array<int> = new Array<int>(BASE_COUNT);
      let func = () => { let a = 1; };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        timerIdList[i] = setInterval(func, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = timerIdList.length;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      for (let i = 0; i < timerIdList.length; i++) {
        clearInterval(timerIdList[i]);
      }
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'setInterval',
        'setInterval(func: Function, delayMs: int | null | undefined, ...args: FixedArray<Any>): int', arkTsAveragedTime);
    })

    //并发格式不规范
    it('PerformanceTest_Global_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let timerIdList: Array<int> = new Array<int>();
      let func = () => { let a = 1; };
      for (let i = 0; i < BASE_COUNT; i++) {
        timerIdList.push(setInterval(func, 0));
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        clearInterval(timerIdList[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = timerIdList.length;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'clearInterval',
        'clearInterval(timerId?: int | null): void', arkTsAveragedTime);
    })

  })
}
