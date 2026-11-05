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

function toByteValue(value: number): number {
  return value;
}

function toShortValue(value: number): number {
  return value;
}

function toLongValue(value: number): number {
  return value;
}

function toFloatValue(value: number): number {
  return value;
}

function createIntObject(value: number): number {
  return value;
}

export default function MathPerfTest(): void {
  describe('MathPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Math_abs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = toByteValue(-7);
        let result: number = Math.abs(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.abs(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_abs_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'abs',
          'abs(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_acos_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 0.5;
        let result: number = Math.acos(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.acos(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_acos_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'acos',
          'acos(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_acosh_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 2.0;
        let result: number = Math.acosh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.acosh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_acosh_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'acosh',
          'acosh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_asin_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 0.5;
        let result: number = Math.asin(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.asin(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_asin_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'asin',
          'asin(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_asinh_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.5;
        let result: number = Math.asinh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.asinh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_asinh_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'asinh',
          'asinh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_atan_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.atan(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.atan(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_atan_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atan',
          'atan(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_atan2_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let y: number = 1.0;
        let x: number = 2.0;
        let result: number = Math.atan2(y, x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.atan2(y, x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_atan2_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atan2',
          'atan2(y: number, x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_atanh_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 0.5;
        let result: number = Math.atanh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.atanh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_atanh_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atanh',
          'atanh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_cbrt_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 27.0;
        let result: number = Math.cbrt(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.cbrt(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_cbrt_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cbrt',
          'cbrt(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_ceil_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 3.14;
        let result: number = Math.ceil(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.ceil(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_ceil_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'ceil',
          'ceil(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_clz32_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = createIntObject(65535);
        let result: number = Math.clz32(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.clz32(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_clz32_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'clz32',
          'clz32(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_cos_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.cos(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.cos(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_cos_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cos',
          'cos(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_cosh_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.cosh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.cosh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_cosh_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cosh',
          'cosh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_exp_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = toFloatValue(1.0);
        let result: number = Math.exp(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.exp(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_exp_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'exp',
          'exp(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_expm1_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = toFloatValue(1.0);
        let result: number = Math.expm1(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.expm1(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_expm1_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'expm1',
          'expm1(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_floor_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 3.99;
        let result: number = Math.floor(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.floor(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_floor_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'floor',
          'floor(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_fround_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.337;
        let result: number = Math.fround(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.fround(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_fround_1800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'fround',
          'fround(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_hypot_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.hypot(3.0, 4.0, 12.0);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.hypot(3.0, 4.0, 12.0);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_hypot_1900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'hypot',
          'hypot(...values: number[]): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_imul_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let a: number = 5.0;
        let b: number = 7.0;
        let result: number = Math.imul(a, b);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.imul(a, b);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_imul_2000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'imul',
          'imul(a: number, b: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_log_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = toFloatValue(10.0);
        let result: number = Math.log(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.log(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_log_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log',
          'log(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_log10_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 100.0;
        let result: number = Math.log10(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.log10(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_log10_2200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log10',
          'log10(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_log1p_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.log1p(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.log1p(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_log1p_2300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log1p',
          'log1p(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_log2_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 8.0;
        let result: number = Math.log2(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.log2(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_log2_2400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log2',
          'log2(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_max_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.max();
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.max();
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_max_2500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'max',
          'max(): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_max_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let val: number = 3.0;
        let result: number = Math.max(val);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.max(val);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_max_2600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'max',
          'max(val: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_max_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let val1: number = 3.0;
        let val2: number = 5.0;
        let result: number = Math.max(val1, val2);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.max(val1, val2);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_max_2700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'max',
          'max(val1: number, val2: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_max_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.max(1.0, 5.0, 3.0);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.max(1.0, 5.0, 3.0);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_max_2800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'max',
          'max(...values: number[]): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_min_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.min();
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.min();
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_min_2900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'min',
          'min(): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_min_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let val: number = 3.0;
        let result: number = Math.min(val);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.min(val);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_min_3000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'min',
          'min(val: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_min_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let val1: number = 3.0;
        let val2: number = 5.0;
        let result: number = Math.min(val1, val2);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.min(val1, val2);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_min_3100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'min',
          'min(val1: number, val2: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_min_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.min(1.0, 5.0, 3.0);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.min(1.0, 5.0, 3.0);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_min_3200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'min',
          'min(...values: number[]): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_pow_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let u: number = 2.0;
        let v: number = 10.0;
        let result: number = Math.pow(u, v);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.pow(u, v);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_pow_3300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'pow',
          'pow(u: number, v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_random_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.random();
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.random();
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_random_3400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'random',
          'random(): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_round_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 3.6;
        let result: number = Math.round(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.round(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_round_3500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'round',
          'round(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_sign_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = -3.6;
        let result: number = Math.sign(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.sign(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_sign_3600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sign',
          'sign(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_sin_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.sin(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.sin(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_sin_3700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sin',
          'sin(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_sinh_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.sinh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.sinh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_sinh_3800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sinh',
          'sinh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_sqrt_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 144.0;
        let result: number = Math.sqrt(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.sqrt(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_sqrt_3900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sqrt',
          'sqrt(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_tan_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.tan(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.tan(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_tan_4000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'tan',
          'tan(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_tanh_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 1.0;
        let result: number = Math.tanh(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.tanh(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_tanh_4100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'tanh',
          'tanh(x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_Math_trunc_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let x: number = 3.99;
        let result: number = Math.trunc(x);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.trunc(x);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_trunc_4200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'trunc',
          'trunc(x: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_PI_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.PI;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_PI_4300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'PI',
          'static readonly PI: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_E_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.E;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_E_4400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'E',
          'static readonly E: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_LN10_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.LN10;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_LN10_4500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LN10',
          'static readonly LN10: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_LN2_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.LN2;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_LN2_4600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LN2',
          'static readonly LN2: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_LOG2E_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.LOG2E;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_LOG2E_4700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LOG2E',
          'static readonly LOG2E: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_LOG10E_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.LOG10E;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_LOG10E_4800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LOG10E',
          'static readonly LOG10E: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_SQRT1_2_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.SQRT1_2;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_SQRT1_2_4900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'SQRT1_2',
          'static readonly SQRT1_2: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Math_SQRT2_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = Math.SQRT2;
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Math_SQRT2_5000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'SQRT2',
          'static readonly SQRT2: number', arkTsAveragedTime);
      done();
      });
  });
}
