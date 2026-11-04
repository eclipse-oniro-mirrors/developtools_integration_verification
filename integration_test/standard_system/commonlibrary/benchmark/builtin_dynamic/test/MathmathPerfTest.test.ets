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

export default function MathmathPerfTest(): void {
  describe('MathmathPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_mathmath_abs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = -7;
        let result: number = Math.abs(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.abs(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'abs',
          'abs(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_acos_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 0.5;
        let result: number = Math.acos(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.acos(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acos_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'acos',
          'acos(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_acosh_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 2.0;
        let result: number = Math.acosh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.acosh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acosh_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'acosh',
          'acosh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_asin_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 0.5;
        let result: number = Math.asin(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.asin(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asin_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'asin',
          'asin(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_asinh_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.5;
        let result: number = Math.asinh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.asinh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asinh_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'asinh',
          'asinh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_atan_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.atan(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.atan(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atan',
          'atan(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_atan2_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let y: number = 1.0;
        let x: number = 2.0;
        let result: number = Math.atan2(y, x);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.atan2(y, x);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan2_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atan2',
          'atan2(y: number, x: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_atanh_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 0.5;
        let result: number = Math.atanh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.atanh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atanh_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'atanh',
          'atanh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_cbrt_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 27.0;
        let result: number = Math.cbrt(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.cbrt(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cbrt_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cbrt',
          'cbrt(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_ceil_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3.14;
        let result: number = Math.ceil(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.ceil(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_ceil_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'ceil',
          'ceil(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_clz64_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 255;
        let result: number = Math.clz32(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.clz32(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'clz32',
          'clz32(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_cos_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.cos(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.cos(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cos_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cos',
          'cos(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_cosh_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.cosh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.cosh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cosh_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'cosh',
          'cosh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_exp_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.exp(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.exp(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_exp_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'exp',
          'exp(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_expm1_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.expm1(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.expm1(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_expm1_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'expm1',
          'expm1(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_floor_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3.99;
        let result: number = Math.floor(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.floor(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_floor_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'floor',
          'floor(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_fround_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.337;
        let result: number = Math.fround(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.fround(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_fround_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'fround',
          'fround(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_hypot_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let u: number = 3.0;
        let v: number = 4.0;
        let result: number = Math.hypot(u, v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.hypot(u, v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_hypot_1800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'hypot',
          'hypot(u: number, v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_imul_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let a: number = 5;
        let b: number = 7;
        let result: number = Math.imul(a, b);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.imul(a, b);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_imul_1900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'imul',
          'imul(a: number, b: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_log_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 10.0;
        let result: number = Math.log(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.log(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log_2000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log',
          'log(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_log10_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 100.0;
        let result: number = Math.log10(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.log10(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log10_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log10',
          'log10(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_log1p_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.log1p(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.log1p(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log1p_2200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log1p',
          'log1p(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_log2_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 8.0;
        let result: number = Math.log2(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.log2(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log2_2300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'log2',
          'log2(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_max_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3;
        let u: number = 5;
        let result: number = Math.max(v, u);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.max(v, u);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_2400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'max',
          'max(v: number, u: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_min_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3;
        let u: number = 5;
        let result: number = Math.min(v, u);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.min(v, u);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_2500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'min',
          'min(v: number, u: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_mod_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let u: number = 7.0;
        let v: number = 3.0;
        let result: number = u % v;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = u % v;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_mod_2600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'mod',
          'mod(u: number, v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_power_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 2.0;
        let u: number = 10.0;
        let result: number = Math.pow(v, u);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.pow(v, u);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_power_2700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'pow',
          'pow(v: number, u: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_power2_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 10.0;
        let result: number = v * v;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = v * v;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_power2_2800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'power2',
          'power2(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_random_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = Math.random();
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.random();
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_random_2900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'random',
          'random(): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_round_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3.6;
        let result: number = Math.round(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.round(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_round_3100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'round',
          'round(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_scalbn_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.5;
        let n: number = 5;
        let result: number = v * Math.pow(2, n);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = v * Math.pow(2, n);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_scalbn_3200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'scalbn',
          'scalbn(v: number, n: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_sign_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = -3.6;
        let result: number = Math.sign(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.sign(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sign_3400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sign',
          'sign(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_signbit_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = -3.6;
        let result: boolean = Math.sign(v) < 0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.sign(v) < 0;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_signbit_3500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'signbit',
          'signbit(v: number): boolean', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_sin_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.sin(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.sin(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sin_3600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sin',
          'sin(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_sinh_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.sinh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.sinh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sinh_3700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sinh',
          'sinh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_sqrt_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 144.0;
        let result: number = Math.sqrt(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.sqrt(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sqrt_3800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'sqrt',
          'sqrt(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_tan_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.tan(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.tan(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tan_3900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'tan',
          'tan(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_tanh_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 1.0;
        let result: number = Math.tanh(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.tanh(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tanh_4000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'tanh',
          'tanh(v: number): number', arkTsAveragedTime);
      done();
      });


    it('PerformanceTest_mathmath_trunc_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let v: number = 3.99;
        let result: number = Math.trunc(v);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.trunc(v);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_trunc_4100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'trunc',
          'trunc(v: number): number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_PI_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.PI;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_PI_4200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'PI',
          'readonly PI: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_E_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.E;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_E_4300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'E',
          'readonly E: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_LN10_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.LN10;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LN10_4400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LN10',
          'readonly LN10: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_LN2_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.LN2;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LN2_4500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LN2',
          'readonly LN2: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_LOG2E_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.LOG2E;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LOG2E_4600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'LOG2E',
          'readonly LOG2E: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_SQRT1_2_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.SQRT1_2;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_SQRT1_2_4700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'SQRT1_2',
          'readonly SQRT1_2: number', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_mathmath_SQRT2_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: number = 0.0;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Math.SQRT2;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_SQRT2_4800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Math', 'SQRT2',
          'readonly SQRT2: number', arkTsAveragedTime);
      done();
      });
  });
}
