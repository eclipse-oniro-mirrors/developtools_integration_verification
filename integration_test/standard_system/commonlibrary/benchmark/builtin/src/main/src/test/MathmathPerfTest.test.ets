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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';
import {
  abs,
  acos,
  acosh,
  asin,
  asinh,
  atan,
  atan2,
  atanh,
  cbrt,
  ceil,
  clz64,
  clz32,
  clz32Double,
  cos,
  cosh,
  exp,
  expm1,
  floor,
  fround,
  hypot,
  imul,
  log,
  log10,
  log1p,
  log2,
  max,
  min,
  mod,
  power,
  power2,
  random,
  rem,
  round,
  scalbn,
  sign,
  signbit,
  sin,
  sinh,
  sqrt,
  tan,
  tanh,
  trunc,
  seedRandom,
  PI,
  E,
  LN10,
  LN2,
  LOG2E,
  SQRT1_2,
  SQRT2
} from "std/math";

function toByteValue(value: int): byte {
  return value.toByte();
}

function toShortValue(value: int): short {
  return value.toShort();
}

function toLongValue(value: int): long {
  return value.toLong();
}

function toFloatValue(value: double): float {
  return value.toFloat();
}

function toCharValue(value: int): char {
  return value.toChar();
}

export default function MathmathPerfTest(): void {
  describe('MathmathPerfTest', () => {
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
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_mathmath_abs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: byte = toByteValue(-7);
        let result: byte = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: byte): byte', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_abs_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: short = toShortValue(-7);
        let result: short = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: short): short', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_abs_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: int = -7;
        let result: int = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: int): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_abs_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: long = toLongValue(-7);
        let result: long = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: long): long', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_abs_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(-7.25);
        let result: float = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_abs_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = -7.25;
        let result: double = abs(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = abs(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_abs_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'abs',
          'abs(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_acos_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(0.5);
        let result: float = acos(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = acos(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acos_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'acos',
          'acos(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_acos_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 0.5;
        let result: double = acos(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = acos(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acos_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'acos',
          'acos(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_acosh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(2.0);
        let result: float = acosh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = acosh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acosh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'acosh',
          'acosh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_acosh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 2.0;
        let result: double = acosh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = acosh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_acosh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'acosh',
          'acosh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_asin_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(0.5);
        let result: float = asin(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = asin(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asin_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'asin',
          'asin(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_asin_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 0.5;
        let result: double = asin(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = asin(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asin_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'asin',
          'asin(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_asinh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.5);
        let result: float = asinh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = asinh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asinh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'asinh',
          'asinh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_asinh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.5;
        let result: double = asinh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = asinh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_asinh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'asinh',
          'asinh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = atan(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atan(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atan',
          'atan(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atan_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = atan(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atan(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atan',
          'atan(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atan2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let y: float = toFloatValue(1.0);
        let x: float = toFloatValue(2.0);
        let result: float = atan2(y, x);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atan2(y, x);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atan2',
          'atan2(y: float, x: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atan2_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let y: double = 1.0;
        let x: double = 2.0;
        let result: double = atan2(y, x);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atan2(y, x);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atan2_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atan2',
          'atan2(y: double, x: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atanh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(0.5);
        let result: float = atanh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atanh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atanh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atanh',
          'atanh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_atanh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 0.5;
        let result: double = atanh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = atanh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_atanh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'atanh',
          'atanh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_cbrt_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(27.0);
        let result: float = cbrt(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = cbrt(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cbrt_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'cbrt',
          'cbrt(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_cbrt_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 27.0;
        let result: double = cbrt(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = cbrt(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cbrt_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'cbrt',
          'cbrt(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_ceil_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.14;
        let result: double = ceil(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = ceil(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_ceil_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'ceil',
          'ceil(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz64_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: byte = toByteValue(255);
        let result: int = clz64(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz64(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz64',
          'clz64(v: byte): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz64_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: char = toCharValue(65535);
        let result: int = clz64(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz64(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz64',
          'clz64(v: char): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz64_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: short = toShortValue(-1);
        let result: int = clz64(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz64(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz64',
          'clz64(v: short): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz64_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: int = 65535;
        let result: int = clz64(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz64(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz64',
          'clz64(v: int): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz64_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: long = toLongValue(65535);
        let result: int = clz64(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz64(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz64_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz64',
          'clz64(v: long): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz32_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: int = 65535;
        let result: int = clz32(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz32(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz32_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz32',
          'clz32(v: int): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_clz32Double_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 65535.0;
        let result: double = clz32Double(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = clz32Double(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_clz32Double_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'clz32Double',
          'clz32Double(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_cos_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = cos(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = cos(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cos_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'cos',
          'cos(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_cosh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = cosh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = cosh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cosh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'cosh',
          'cosh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_cosh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = cosh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = cosh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_cosh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'cosh',
          'cosh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_exp_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = exp(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = exp(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_exp_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'exp',
          'exp(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_exp_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = exp(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = exp(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_exp_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'exp',
          'exp(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_expm1_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = expm1(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = expm1(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_expm1_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'expm1',
          'expm1(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_expm1_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = expm1(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = expm1(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_expm1_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'expm1',
          'expm1(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_floor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.99;
        let result: double = floor(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = floor(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_floor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'floor',
          'floor(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_fround_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.337;
        let result: double = fround(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = fround(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_fround_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'fround',
          'fround(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_hypot_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let u: float = toFloatValue(3.0);
        let v: float = toFloatValue(4.0);
        let result: float = hypot(u, v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = hypot(u, v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_hypot_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'hypot',
          'hypot(u: float, v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_hypot_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let u: double = 3.0;
        let v: double = 4.0;
        let result: double = hypot(u, v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = hypot(u, v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_hypot_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'hypot',
          'hypot(u: double, v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_imul_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let a: double = 5.0;
        let b: double = 7.0;
        let result: int = imul(a, b);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = imul(a, b);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_imul_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'imul',
          'imul(a: double, b: double): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(10.0);
        let result: float = log(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log',
          'log(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 10.0;
        let result: double = log(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log',
          'log(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log10_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(100.0);
        let result: float = log10(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log10(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log10_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log10',
          'log10(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log10_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 100.0;
        let result: double = log10(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log10(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log10_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log10',
          'log10(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log1p_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = log1p(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log1p(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log1p_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log1p',
          'log1p(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log1p_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = log1p(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log1p(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log1p_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log1p',
          'log1p(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(8.0);
        let result: float = log2(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log2(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log2',
          'log2(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_log2_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 8.0;
        let result: double = log2(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = log2(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_log2_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'log2',
          'log2(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: byte = toByteValue(3);
        let u: byte = toByteValue(5);
        let result: byte = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: byte, u: byte): byte', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: char = toCharValue(3);
        let u: char = toCharValue(5);
        let result: char = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: char, u: char): char', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: short = toShortValue(3);
        let u: short = toShortValue(5);
        let result: short = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: short, u: short): short', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: int = 3;
        let u: int = 5;
        let result: int = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: int, u: int): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: long = toLongValue(3);
        let u: long = toLongValue(5);
        let result: long = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: long, u: long): long', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(3.0);
        let u: float = toFloatValue(5.0);
        let result: float = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: float, u: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_max_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.0;
        let u: double = 5.0;
        let result: double = max(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = max(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_max_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'max',
          'max(v: double, u: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: byte = toByteValue(3);
        let u: byte = toByteValue(5);
        let result: byte = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: byte, u: byte): byte', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: char = toCharValue(3);
        let u: char = toCharValue(5);
        let result: char = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: char, u: char): char', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: short = toShortValue(3);
        let u: short = toShortValue(5);
        let result: short = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: short, u: short): short', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: int = 3;
        let u: int = 5;
        let result: int = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: int, u: int): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: long = toLongValue(3);
        let u: long = toLongValue(5);
        let result: long = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: long, u: long): long', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(3.0);
        let u: float = toFloatValue(5.0);
        let result: float = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: float, u: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_min_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.0;
        let u: double = 5.0;
        let result: double = min(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = min(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_min_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'min',
          'min(v: double, u: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_mod_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let u: double = 7.0;
        let v: double = 3.0;
        let result: double = mod(u, v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = mod(u, v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_mod_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'mod',
          'mod(u: double, v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_power_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 2.0;
        let u: double = 10.0;
        let result: double = power(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = power(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_power_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'power',
          'power(v: double, u: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_power2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 10.0;
        let result: double = power2(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = power2(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_power2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'power2',
          'power2(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_random_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = random();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = random();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_random_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'random',
          'random(): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_rem_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 7.0;
        let u: double = 3.0;
        let result: double = rem(v, u);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = rem(v, u);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_rem_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'rem',
          'rem(v: double, u: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_round_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.6;
        let result: double = round(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = round(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_round_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'round',
          'round(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_scalbn_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.5;
        let n: int = 5;
        let result: double = scalbn(v, n);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = scalbn(v, n);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_scalbn_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'scalbn',
          'scalbn(v: double, n: int): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_seedRandom_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = toLongValue(42);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          seedRandom(value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = value;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_seedRandom_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'seedRandom',
          'seedRandom(value: long): void', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_sign_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = -3.6;
        let result: int = sign(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = sign(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sign_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'sign',
          'sign(v: double): int', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_signbit_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = -3.6;
        let result: boolean = signbit(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = signbit(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_signbit_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'signbit',
          'signbit(v: double): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_sin_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = sin(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = sin(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sin_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'sin',
          'sin(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_sinh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = sinh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = sinh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sinh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'sinh',
          'sinh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_sinh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = sinh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = sinh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sinh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'sinh',
          'sinh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_sqrt_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 144.0;
        let result: double = sqrt(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = sqrt(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_sqrt_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'sqrt',
          'sqrt(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_tan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = tan(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = tan(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'tan',
          'tan(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_tan_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = tan(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = tan(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tan_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'tan',
          'tan(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_tanh_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: float = toFloatValue(1.0);
        let result: float = tanh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = tanh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tanh_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'tanh',
          'tanh(v: float): float', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_tanh_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 1.0;
        let result: double = tanh(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = tanh(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_tanh_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'tanh',
          'tanh(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_trunc_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let v: double = 3.99;
        let result: double = trunc(v);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = trunc(v);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_trunc_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'trunc',
          'trunc(v: double): double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_PI_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = PI;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_PI_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'PI',
          'readonly PI: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_E_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = E;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_E_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'E',
          'readonly E: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_LN10_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = LN10;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LN10_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'LN10',
          'readonly LN10: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_LN2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = LN2;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LN2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'LN2',
          'readonly LN2: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_LOG2E_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = LOG2E;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_LOG2E_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'LOG2E',
          'readonly LOG2E: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_SQRT1_2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = SQRT1_2;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_SQRT1_2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'SQRT1_2',
          'readonly SQRT1_2: double', arkTsAveragedTime);
      });

    it('PerformanceTest_mathmath_SQRT2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: double = 0.0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = SQRT2;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_mathmath_SQRT2_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.math', 'math', 'SQRT2',
          'readonly SQRT2: double', arkTsAveragedTime);
      });
  });
}
