'use static'
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
import { Decimal } from '@kit.ArkTS';
import performance from './Performance.util';

export default function DecimalPerfTest(): void {
  describe('DecimalPerfTest', () => {
    // ms * 1000 = us, ms * 1000000 = ns
    const BASE_COUNT = 100;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 50000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterEach(() => {
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21 });
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== constructor ====================

    it('PerformanceTest_Decimal_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = new Decimal(5.0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Decimal(5.0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'constructor',
        'constructor(n: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = new Decimal('5');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Decimal('5');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'constructor',
        'constructor(n: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: Decimal = new Decimal(5);
      let res: Decimal = new Decimal(base);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Decimal(base);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'constructor',
        'constructor(n: Decimal)', arkTsAveragedTime);
    })

    // ==================== abs ====================

    it('PerformanceTest_Decimal_Abs_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(-0.5);
      let res: Decimal = decimalObj.abs();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.abs();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Abs_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'abs',
        'abs(): Decimal', arkTsAveragedTime);
    })

    // ==================== floor ====================

    it('PerformanceTest_Decimal_Floor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.8);
      let res: Decimal = decimalObj.floor();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.floor();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Floor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'floor',
        'floor(): Decimal', arkTsAveragedTime);
    })

    // ==================== ceil ====================

    it('PerformanceTest_Decimal_Ceil_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.8);
      let res: Decimal = decimalObj.ceil();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.ceil();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Ceil_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'ceil',
        'ceil(): Decimal', arkTsAveragedTime);
    })

    // ==================== trunc ====================

    it('PerformanceTest_Decimal_Trunc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(2.5);
      let res: Decimal = decimalObj.trunc();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.trunc();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Trunc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'trunc',
        'trunc(): Decimal', arkTsAveragedTime);
    })

    // ==================== clamp ====================

    it('PerformanceTest_Decimal_Clamp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(10.1);
      let res: Decimal = decimalObj.clamp(0, 10);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.clamp(0, 10);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Clamp_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'clamp',
        'clamp(min: Value, max: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== add ====================

    it('PerformanceTest_Decimal_Add_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.5);
      let res: Decimal = decimalObj.add(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.add(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Add_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'add',
        'add(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== sub ====================

    it('PerformanceTest_Decimal_Sub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1);
      let res: Decimal = decimalObj.sub(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.sub(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Sub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sub',
        'sub(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== mul ====================

    it('PerformanceTest_Decimal_Mul_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1);
      let res: Decimal = decimalObj.mul(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.mul(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Mul_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'mul',
        'mul(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== div ====================

    it('PerformanceTest_Decimal_Div_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1);
      let res: Decimal = decimalObj.div(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.div(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Div_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'div',
        'div(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== mod ====================

    it('PerformanceTest_Decimal_Mod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(2);
      let res: Decimal = decimalObj.mod(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.mod(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Mod_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'mod',
        'mod(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== sqrt ====================

    it('PerformanceTest_Decimal_Sqrt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3);
      let res: Decimal = decimalObj.sqrt();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.sqrt();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Sqrt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sqrt',
        'sqrt(): Decimal', arkTsAveragedTime);
    })

    // ==================== cbrt ====================

    it('PerformanceTest_Decimal_Cbrt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3);
      let res: Decimal = decimalObj.cbrt();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.cbrt();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Cbrt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cbrt',
        'cbrt(): Decimal', arkTsAveragedTime);
    })

    // ==================== pow ====================

    it('PerformanceTest_Decimal_Pow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3);
      let res: Decimal = decimalObj.pow(-2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.pow(-2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Pow_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'pow',
        'pow(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== exp ====================

    it('PerformanceTest_Decimal_Exp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(2);
      let res: Decimal = decimalObj.exp();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.exp();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Exp_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'exp',
        'exp(): Decimal', arkTsAveragedTime);
    })

    // ==================== log ====================

    it('PerformanceTest_Decimal_Log_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(2);
      let res: Decimal = decimalObj.log(256);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.log(256);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Log_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'log',
        'log(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== ln ====================

    it('PerformanceTest_Decimal_Ln_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.23e+30);
      let res: Decimal = decimalObj.ln();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.ln();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Ln_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'ln',
        'ln(): Decimal', arkTsAveragedTime);
    })

    // ==================== cos ====================

    it('PerformanceTest_Decimal_Cos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(-0.25);
      let res: Decimal = decimalObj.cos();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.cos();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Cos_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cos',
        'cos(): Decimal', arkTsAveragedTime);
    })

    // ==================== sin ====================

    it('PerformanceTest_Decimal_Sin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.75);
      let res: Decimal = decimalObj.sin();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.sin();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Sin_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sin',
        'sin(): Decimal', arkTsAveragedTime);
    })

    // ==================== tan ====================

    it('PerformanceTest_Decimal_Tan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.75);
      let res: Decimal = decimalObj.tan();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.tan();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Tan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'tan',
        'tan(): Decimal', arkTsAveragedTime);
    })

    // ==================== cosh ====================

    it('PerformanceTest_Decimal_Cosh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.5);
      let res: Decimal = decimalObj.cosh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.cosh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Cosh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cosh',
        'cosh(): Decimal', arkTsAveragedTime);
    })

    // ==================== sinh ====================

    it('PerformanceTest_Decimal_Sinh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.5);
      let res: Decimal = decimalObj.sinh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.sinh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Sinh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sinh',
        'sinh(): Decimal', arkTsAveragedTime);
    })

    // ==================== tanh ====================

    it('PerformanceTest_Decimal_Tanh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.5);
      let res: Decimal = decimalObj.tanh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.tanh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Tanh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'tanh',
        'tanh(): Decimal', arkTsAveragedTime);
    })

    // ==================== acos ====================

    it('PerformanceTest_Decimal_Acos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.5);
      let res: Decimal = decimalObj.acos();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.acos();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Acos_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'acos',
        'acos(): Decimal', arkTsAveragedTime);
    })

    // ==================== asin ====================

    it('PerformanceTest_Decimal_Asin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.75);
      let res: Decimal = decimalObj.asin();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.asin();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Asin_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'asin',
        'asin(): Decimal', arkTsAveragedTime);
    })

    // ==================== atan ====================

    it('PerformanceTest_Decimal_Atan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.75);
      let res: Decimal = decimalObj.atan();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.atan();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Atan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'atan',
        'atan(): Decimal', arkTsAveragedTime);
    })

    // ==================== acosh ====================

    it('PerformanceTest_Decimal_Acosh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(50);
      let res: Decimal = decimalObj.acosh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.acosh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Acosh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'acosh',
        'acosh(): Decimal', arkTsAveragedTime);
    })

    // ==================== asinh ====================

    it('PerformanceTest_Decimal_Asinh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(50);
      let res: Decimal = decimalObj.asinh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.asinh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Asinh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'asinh',
        'asinh(): Decimal', arkTsAveragedTime);
    })

    // ==================== atanh ====================

    it('PerformanceTest_Decimal_Atanh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.75);
      let res: Decimal = decimalObj.atanh();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.atanh();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Atanh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'atanh',
        'atanh(): Decimal', arkTsAveragedTime);
    })

    // ==================== comparedTo ====================

    it('PerformanceTest_Decimal_ComparedTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(Infinity);
      let decimalObj2: Decimal = new Decimal(5);
      let res: double = decimalObj.comparedTo(decimalObj2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.comparedTo(decimalObj2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ComparedTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'comparedTo',
        'comparedTo(n: Value): double', arkTsAveragedTime);
    })

    // ==================== equals ====================

    it('PerformanceTest_Decimal_Equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0);
      let res: boolean = decimalObj.equals('1e-324');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.equals('1e-324');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'equals',
        'equals(n: Value): boolean', arkTsAveragedTime);
    })

    // ==================== greaterThan ====================

    it('PerformanceTest_Decimal_GreaterThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.1);
      let res: boolean = decimalObj.greaterThan(new Decimal(0.3).sub(0.2));
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.greaterThan(new Decimal(0.3).sub(0.2));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_GreaterThan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'greaterThan',
        'greaterThan(n: Value): boolean', arkTsAveragedTime);
    })

    // ==================== greaterThanOrEqualTo ====================

    it('PerformanceTest_Decimal_GreaterThanOrEqualTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.3).sub(0.2);
      let res: boolean = decimalObj.greaterThanOrEqualTo(0.1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.greaterThanOrEqualTo(0.1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_GreaterThanOrEqualTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'greaterThanOrEqualTo',
        'greaterThanOrEqualTo(n: Value): boolean', arkTsAveragedTime);
    })

    // ==================== lessThan ====================

    it('PerformanceTest_Decimal_LessThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.3).sub(0.2);
      let res: boolean = decimalObj.lessThan(0.1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.lessThan(0.1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_LessThan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'lessThan',
        'lessThan(n: Value): boolean', arkTsAveragedTime);
    })

    // ==================== lessThanOrEqualTo ====================

    it('PerformanceTest_Decimal_LessThanOrEqualTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0.1);
      let res: boolean = decimalObj.lessThanOrEqualTo(new Decimal(0.3).sub(0.2));
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.lessThanOrEqualTo(new Decimal(0.3).sub(0.2));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_LessThanOrEqualTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'lessThanOrEqualTo',
        'lessThanOrEqualTo(n: Value): boolean', arkTsAveragedTime);
    })

    // ==================== isFinite ====================

    it('PerformanceTest_Decimal_IsFinite_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1);
      let res: boolean = decimalObj.isFinite();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG ; i++) {
        res = decimalObj.isFinite();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsFinite_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isFinite',
        'isFinite(): boolean', arkTsAveragedTime);
    })

    // ==================== isInteger ====================

    it('PerformanceTest_Decimal_IsInteger_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(123.456);
      let res: boolean = decimalObj.isInteger();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG; i++) {
        res = decimalObj.isInteger();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsInteger_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isInteger',
        'isInteger(): boolean', arkTsAveragedTime);
    })

    // ==================== isNaN ====================

    it('PerformanceTest_Decimal_IsNaN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(NaN);
      let res: boolean = decimalObj.isNaN();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG; i++) {
        res = decimalObj.isNaN();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsNaN_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isNaN',
        'isNaN(): boolean', arkTsAveragedTime);
    })

    // ==================== isNegative ====================

    it('PerformanceTest_Decimal_IsNegative_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(-5);
      let res: boolean = decimalObj.isNegative();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG; i++) {
        res = decimalObj.isNegative();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsNegative_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isNegative',
        'isNegative(): boolean', arkTsAveragedTime);
    })

    // ==================== isPositive ====================

    it('PerformanceTest_Decimal_IsPositive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(5);
      let res: boolean = decimalObj.isPositive();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG; i++) {
        res = decimalObj.isPositive();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsPositive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isPositive',
        'isPositive(): boolean', arkTsAveragedTime);
    })

    // ==================== isZero ====================

    it('PerformanceTest_Decimal_IsZero_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(0);
      let res: boolean = decimalObj.isZero();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT_BIG; i++) {
        res = decimalObj.isZero();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_IsZero_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'isZero',
        'isZero(): boolean', arkTsAveragedTime);
    })

    // ==================== dividedToIntegerBy ====================

    it('PerformanceTest_Decimal_DividedToIntegerBy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(5);
      let decimalObj2: Decimal = new Decimal(3);
      let res: Decimal = decimalObj.dividedToIntegerBy(decimalObj2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.dividedToIntegerBy(decimalObj2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_DividedToIntegerBy_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'dividedToIntegerBy',
        'dividedToIntegerBy(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== negate ====================

    it('PerformanceTest_Decimal_Negate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.8);
      let res: Decimal = decimalObj.negate();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.negate();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Negate_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'negate',
        'negate(): Decimal', arkTsAveragedTime);
    })

    // ==================== toBinary ====================

    it('PerformanceTest_Decimal_ToBinary_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toBinary();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toBinary();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToBinary_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toBinary',
        'toBinary(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToBinary_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toBinary(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toBinary(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToBinary_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toBinary',
        'toBinary(significantDigits: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToBinary_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toBinary(1, Decimal.ROUND_HALF_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toBinary(1, Decimal.ROUND_HALF_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToBinary_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toBinary',
        'toBinary(significantDigits: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toOctal ====================

    it('PerformanceTest_Decimal_ToOctal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toOctal();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toOctal();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToOctal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toOctal',
        'toOctal(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToOctal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toOctal(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toOctal(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToOctal_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toOctal',
        'toOctal(significantDigits: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToOctal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toOctal(1, Decimal.ROUND_HALF_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toOctal(1, Decimal.ROUND_HALF_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToOctal_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toOctal',
        'toOctal(significantDigits: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toHexadecimal ====================

    it('PerformanceTest_Decimal_ToHexadecimal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toHexadecimal();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toHexadecimal();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToHexadecimal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toHexadecimal',
        'toHexadecimal(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToHexadecimal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toHexadecimal(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toHexadecimal(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToHexadecimal_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toHexadecimal',
        'toHexadecimal(significantDigits: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToHexadecimal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(256);
      let res: string = decimalObj.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToHexadecimal_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toHexadecimal',
        'toHexadecimal(significantDigits: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toDecimalPlaces ====================

    it('PerformanceTest_Decimal_ToDecimalPlaces_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(12.34567);
      let res: Decimal = decimalObj.toDecimalPlaces();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toDecimalPlaces();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToDecimalPlaces_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toDecimalPlaces',
        'toDecimalPlaces(): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToDecimalPlaces_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(9876.54321);
      let res: Decimal = decimalObj.toDecimalPlaces(3);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toDecimalPlaces(3);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToDecimalPlaces_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toDecimalPlaces',
        'toDecimalPlaces(decimalPlaces: double): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToDecimalPlaces_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(9876.54321);
      let res: Decimal = decimalObj.toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toDecimalPlaces(1, Decimal.ROUND_DOWN);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToDecimalPlaces_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toDecimalPlaces',
        'toDecimalPlaces(decimalPlaces: double, rounding: Rounding): Decimal', arkTsAveragedTime);
    })

    // ==================== toExponential ====================

    it('PerformanceTest_Decimal_ToExponential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toExponential();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toExponential();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToExponential_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toExponential',
        'toExponential(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToExponential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toExponential(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toExponential(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToExponential_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toExponential',
        'toExponential(decimalPlaces: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToExponential_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toExponential(1, Decimal.ROUND_DOWN);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toExponential(1, Decimal.ROUND_DOWN);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToExponential_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toExponential',
        'toExponential(decimalPlaces: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toFixed ====================

    it('PerformanceTest_Decimal_ToFixed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3.456);
      let res: string = decimalObj.toFixed();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toFixed();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToFixed_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toFixed',
        'toFixed(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToFixed_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3.456);
      let res: string = decimalObj.toFixed(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toFixed(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToFixed_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toFixed',
        'toFixed(decimalPlaces: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToFixed_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(3.456);
      let res: string = decimalObj.toFixed(2, Decimal.ROUND_DOWN);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toFixed(2, Decimal.ROUND_DOWN);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToFixed_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toFixed',
        'toFixed(decimalPlaces: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toFraction ====================

    it('PerformanceTest_Decimal_ToFraction_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.75);
      let res: Decimal[] = decimalObj.toFraction();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toFraction();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToFraction_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toFraction',
        'toFraction(): Decimal[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToFraction_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal('3.14159265358');
      let res: Decimal[] = decimalObj.toFraction(100);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toFraction(100);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToFraction_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toFraction',
        'toFraction(maxDenominator: Value): Decimal[]', arkTsAveragedTime);
    })

    // ==================== toNearest ====================

    it('PerformanceTest_Decimal_ToNearest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.39);
      let res: Decimal = decimalObj.toNearest(0.25);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toNearest(0.25);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToNearest_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toNearest',
        'toNearest(n: Value): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToNearest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(9.499);
      let res: Decimal = decimalObj.toNearest(0.5, Decimal.ROUND_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toNearest(0.5, Decimal.ROUND_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToNearest_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toNearest',
        'toNearest(n: Value, rounding: Rounding): Decimal', arkTsAveragedTime);
    })

    // ==================== toPrecision ====================

    it('PerformanceTest_Decimal_ToPrecision_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toPrecision();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toPrecision();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToPrecision_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toPrecision',
        'toPrecision(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToPrecision_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toPrecision(5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toPrecision(5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToPrecision_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toPrecision',
        'toPrecision(significantDigits: double): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToPrecision_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(45.6);
      let res: string = decimalObj.toPrecision(2, Decimal.ROUND_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toPrecision(2, Decimal.ROUND_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToPrecision_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toPrecision',
        'toPrecision(significantDigits: double, rounding: Rounding): string', arkTsAveragedTime);
    })

    // ==================== toSignificantDigits ====================

    it('PerformanceTest_Decimal_ToSignificantDigits_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(987.654321);
      let res: Decimal = decimalObj.toSignificantDigits();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toSignificantDigits();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToSignificantDigits_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toSignificantDigits',
        'toSignificantDigits(): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToSignificantDigits_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(987.654321);
      let res: Decimal = decimalObj.toSignificantDigits(6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toSignificantDigits(6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToSignificantDigits_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toSignificantDigits',
        'toSignificantDigits(significantDigits: double): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_ToSignificantDigits_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(987.654321);
      let res: Decimal = decimalObj.toSignificantDigits(6, Decimal.ROUND_UP);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toSignificantDigits(6, Decimal.ROUND_UP);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToSignificantDigits_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toSignificantDigits',
        'toSignificantDigits(significantDigits: double, rounding: Rounding): Decimal', arkTsAveragedTime);
    })

    // ==================== toNumber ====================

    it('PerformanceTest_Decimal_ToNumber_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(456.789);
      let res: double = decimalObj.toNumber();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toNumber();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToNumber_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toNumber',
        'toNumber(): double', arkTsAveragedTime);
    })

    // ==================== toString ====================

    it('PerformanceTest_Decimal_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(750000);
      let res: string = decimalObj.toString();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.toString();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ToString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    // ==================== valueOf ====================

    it('PerformanceTest_Decimal_ValueOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(-0);
      let res: string = decimalObj.valueOf();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.valueOf();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_ValueOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'valueOf',
        'valueOf(): string', arkTsAveragedTime);
    })

    // ==================== decimalPlaces ====================

    it('PerformanceTest_Decimal_DecimalPlaces_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.234);
      let res: double = decimalObj.decimalPlaces();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.decimalPlaces();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_DecimalPlaces_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'decimalPlaces',
        'decimalPlaces(): double', arkTsAveragedTime);
    })

    // ==================== precision ====================

    it('PerformanceTest_Decimal_Precision_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(1.234);
      let res: double = decimalObj.precision();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.precision();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Precision_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'precision',
        'precision(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_Precision_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decimalObj: Decimal = new Decimal(987000);
      let res: double = decimalObj.precision(true);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = decimalObj.precision(true);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_Precision_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'precision',
        'precision(includeZeros: boolean | int): double', arkTsAveragedTime);
    })

    // ==================== static abs ====================

    it('PerformanceTest_Decimal_StaticAbs_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.abs(-0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.abs(-0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAbs_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'abs',
        'static abs(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static floor ====================

    it('PerformanceTest_Decimal_StaticFloor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.floor(1.8);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.floor(1.8);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticFloor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'floor',
        'static floor(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static ceil ====================

    it('PerformanceTest_Decimal_StaticCeil_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.ceil(1.8);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.ceil(1.8);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticCeil_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'ceil',
        'static ceil(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static trunc ====================

    it('PerformanceTest_Decimal_StaticTrunc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.trunc(2.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.trunc(2.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticTrunc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'trunc',
        'static trunc(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static clamp ====================

    it('PerformanceTest_Decimal_StaticClamp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.clamp(10.1, 0, 10);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.clamp(10.1, 0, 10);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticClamp_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'clamp',
        'static clamp(n: Value, min: Value, max: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static add ====================

    it('PerformanceTest_Decimal_StaticAdd_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.add(0.5, 0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.add(0.5, 0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAdd_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'add',
        'static add(x: Value, y: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static sum ====================

    it('PerformanceTest_Decimal_StaticSum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.sum(0.5, 0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sum(0.5, 0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sum',
        'static sum(...n: Value[]): Decimal', arkTsAveragedTime);
    })

    // ==================== static sub ====================

    it('PerformanceTest_Decimal_StaticSub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.sub(1, 0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sub(1, 0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sub',
        'static sub(x: Value, y: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static mul ====================

    it('PerformanceTest_Decimal_StaticMul_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.mul(1, 0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.mul(1, 0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticMul_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'mul',
        'static mul(x: Value, y: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static div ====================

    it('PerformanceTest_Decimal_StaticDiv_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.div(1, 0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.div(1, 0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticDiv_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'div',
        'static div(x: Value, y: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static mod ====================

    it('PerformanceTest_Decimal_StaticMod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.mod(2, 1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.mod(2, 1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticMod_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'mod',
        'static mod(x: Value, y: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static sqrt ====================

    it('PerformanceTest_Decimal_StaticSqrt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.sqrt(3);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sqrt(3);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSqrt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sqrt',
        'static sqrt(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static cbrt ====================

    it('PerformanceTest_Decimal_StaticCbrt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.cbrt(3);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.cbrt(3);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticCbrt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cbrt',
        'static cbrt(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static pow ====================

    it('PerformanceTest_Decimal_StaticPow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.pow(3, -2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.pow(3, -2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticPow_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'pow',
        'static pow(base: Value, exponent: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static exp ====================

    it('PerformanceTest_Decimal_StaticExp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.exp(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.exp(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticExp_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'exp',
        'static exp(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static log ====================

    it('PerformanceTest_Decimal_StaticLog_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.log(2, 256);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.log(2, 256);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticLog_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'log',
        'static log(n: Value, base: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static ln ====================

    it('PerformanceTest_Decimal_StaticLn_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.ln(1.23e+30);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.ln(1.23e+30);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticLn_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'ln',
        'static ln(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static log2 ====================

    it('PerformanceTest_Decimal_StaticLog2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.log2(4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.log2(4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticLog2_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'log2',
        'static log2(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static log10 ====================

    it('PerformanceTest_Decimal_StaticLog10_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.log10(10000);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.log10(10000);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticLog10_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'log10',
        'static log10(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static cos ====================

    it('PerformanceTest_Decimal_StaticCos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.cos(-0.25);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.cos(-0.25);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticCos_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cos',
        'static cos(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static sin ====================

    it('PerformanceTest_Decimal_StaticSin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.sin(0.75);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sin(0.75);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSin_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sin',
        'static sin(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static tan ====================

    it('PerformanceTest_Decimal_StaticTan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.tan(0.75);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.tan(0.75);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticTan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'tan',
        'static tan(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static cosh ====================

    it('PerformanceTest_Decimal_StaticCosh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.cosh(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.cosh(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticCosh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'cosh',
        'static cosh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static sinh ====================

    it('PerformanceTest_Decimal_StaticSinh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.sinh(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sinh(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSinh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sinh',
        'static sinh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static tanh ====================

    it('PerformanceTest_Decimal_StaticTanh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.tanh(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.tanh(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticTanh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'tanh',
        'static tanh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static acos ====================

    it('PerformanceTest_Decimal_StaticAcos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.acos(0.5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.acos(0.5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAcos_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'acos',
        'static acos(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static asin ====================

    it('PerformanceTest_Decimal_StaticAsin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.asin(0.75);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.asin(0.75);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAsin_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'asin',
        'static asin(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static atan ====================

    it('PerformanceTest_Decimal_StaticAtan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.atan(0.75);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.atan(0.75);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAtan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'atan',
        'static atan(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static acosh ====================

    it('PerformanceTest_Decimal_StaticAcosh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.acosh(50);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.acosh(50);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAcosh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'acosh',
        'static acosh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static asinh ====================

    it('PerformanceTest_Decimal_StaticAsinh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.asinh(50);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.asinh(50);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAsinh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'asinh',
        'static asinh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static atanh ====================

    it('PerformanceTest_Decimal_StaticAtanh_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.atanh(0.75);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.atanh(0.75);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAtanh_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'atanh',
        'static atanh(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static atan2 ====================

    it('PerformanceTest_Decimal_StaticAtan2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.atan2(2, 3);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.atan2(2, 3);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticAtan2_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'atan2',
        'static atan2(y: Value, x: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static hypot ====================

    it('PerformanceTest_Decimal_StaticHypot_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.hypot(2, 3, 4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.hypot(2, 3, 4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticHypot_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'hypot',
        'static hypot(...n: Value[]): Decimal', arkTsAveragedTime);
    })

    // ==================== static max ====================

    it('PerformanceTest_Decimal_StaticMax_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.max(2, 3, 4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.max(2, 3, 4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticMax_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'max',
        'static max(...n: Value[]): Decimal', arkTsAveragedTime);
    })

    // ==================== static min ====================

    it('PerformanceTest_Decimal_StaticMin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.min(2, 3, 4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.min(2, 3, 4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticMin_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'min',
        'static min(...n: Value[]): Decimal', arkTsAveragedTime);
    })

    // ==================== static random ====================

    it('PerformanceTest_Decimal_StaticRandom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.random();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.random();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticRandom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'random',
        'static random(): Decimal', arkTsAveragedTime);
    })

    it('PerformanceTest_Decimal_StaticRandom_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.random(20);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.random(20);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticRandom_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'random',
        'static random(significantDigits: double): Decimal', arkTsAveragedTime);
    })

    // ==================== static sign ====================

    it('PerformanceTest_Decimal_StaticSign_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = Decimal.sign(2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.sign(2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSign_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'sign',
        'static sign(n: Value): double', arkTsAveragedTime);
    })

    // ==================== static round ====================

    it('PerformanceTest_Decimal_StaticRound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Decimal = Decimal.round(3.3333333333333);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Decimal.round(3.3333333333333);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticRound_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'round',
        'static round(n: Value): Decimal', arkTsAveragedTime);
    })

    // ==================== static set ====================

    it('PerformanceTest_Decimal_StaticSet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({ precision: 5, rounding: 4 });
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        Decimal.set({ precision: 5, rounding: 4 });
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Decimal_StaticSet_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Decimal', 'set',
        'static set(config: DecimalConfig): void', arkTsAveragedTime);
    })

  })
}
