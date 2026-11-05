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
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function GlobalPerfTest(): void {
  describe('GlobalPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Global_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = parseInt("123");
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt',
        'parseInt(s: String): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = parseInt("123", 16);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt_radix',
        'parseInt(s: String, radix: int): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = parseFloat("3.14");
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseFloat',
        'parseFloat(s: String): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = isNaN(3.14);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isNaN',
        'isNaN(d: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = isNaN(NaN);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isNaN_float',
        'isNaN(f: float): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = isFinite(3.14);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isFinite',
        'isFinite(d: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Number.isInteger(42);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isInteger',
        'isInteger(v: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = parseInt("123", 16.0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'parseInt_radix_number',
        'parseInt(s: String, radix: number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Number.isSafeInteger(42);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger',
        'isSafeInteger(v: number): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let longValue: number = 42;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Number.isSafeInteger(longValue);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger_long',
        'isSafeInteger(v: long): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Number.isSafeInteger(42.0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'isSafeInteger_float',
        'isSafeInteger(v: float): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let timerIdList: number[] = new Array<number>(BASE_COUNT);
      let func: () => void = () => { let a: number = 1; };
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        timerIdList[i] = setTimeout(func);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = timerIdList.length;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      for (let i: number = 0; i < timerIdList.length; i++) {
        clearTimeout(timerIdList[i]);
      }
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'setTimeout',
        'setTimeout(func: Function): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let timerIdList: number[] = new Array<number>();
      let func: () => void = () => { let a: number = 1; };
      for (let i: number = 0; i < BASE_COUNT; i++) {
        timerIdList.push(setTimeout(func));
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        clearTimeout(timerIdList[i]);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = timerIdList.length;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'clearTimeout',
        'clearTimeout(timerId?: int | null): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let timerIdList: number[] = new Array<number>(BASE_COUNT);
      let func: () => void = () => { let a: number = 1; };
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        timerIdList[i] = setInterval(func, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = timerIdList.length;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      for (let i: number = 0; i < timerIdList.length; i++) {
        clearInterval(timerIdList[i]);
      }
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'setInterval',
        'setInterval(func: Function, delayMs: int | null | undefined, ...args: FixedArray<Any>): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Global_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let timerIdList: number[] = new Array<number>();
      let func: () => void = () => { let a: number = 1; };
      for (let i: number = 0; i < BASE_COUNT; i++) {
        timerIdList.push(setInterval(func, 0));
      }
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        clearInterval(timerIdList[i]);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number = timerIdList.length;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Global_Static_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Global', 'clearInterval',
        'clearInterval(timerId?: int | null): void', arkTsAveragedTime);
      done();
    })

  })
}