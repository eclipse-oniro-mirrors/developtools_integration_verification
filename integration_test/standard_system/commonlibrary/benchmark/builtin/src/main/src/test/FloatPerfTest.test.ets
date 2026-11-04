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

export default function FloatPerfTest(): void {
  describe('FloatPerfTest', () => {
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

    it('PerformanceTest_Float_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res =new Float();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'constructor',
        'function constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new Float(1.0f);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'constructor',
        'function constructor(value: float)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Float = new Float(3.1415926f);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float(3.1415926f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'constructor',
        'function constructor(value: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float=0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.MIN_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'MIN_VALUE',
        'static readonly MIN_VALUE: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float=0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.MAX_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'MAX_VALUE',
        'static readonly MAX_VALUE: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float=0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.MAX_SAFE_INTEGER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'MAX_SAFE_INTEGER',
        'static readonly MAX_SAFE_INTEGER: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res=0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.BIT_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'BIT_SIZE',
        'static readonly BIT_SIZE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.BYTE_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'BYTE_SIZE',
        'static readonly BYTE_SIZE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res=1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.NaN;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'NaN',
        'static readonly NaN: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res=1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.POSITIVE_INFINITY;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'POSITIVE_INFINITY',
        'static readonly POSITIVE_INFINITY: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.NEGATIVE_INFINITY;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'NEGATIVE_INFINITY',
        'static readonly NEGATIVE_INFINITY: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res=0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.PRECISION;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'PRECISION',
        'static readonly PRECISION: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.DELTA;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'DELTA',
        'static readonly DELTA: float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.EPSILON;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'EPSILON',
        'static readonly EPSILON: float', arkTsAveragedTime);
    })

    // it('PerformanceTest_Float_StaticMethod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res = new Float(1.0f);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = Float.valueOf(1.0f);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'valueOf',
    //     'static valueOf(value: float): Float', arkTsAveragedTime);
    // })

    it('PerformanceTest_Float_StaticMethod_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 0 ;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toByte(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toByte',
        'static toByte(value: float): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 0 ;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toShort(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toShort',
        'static toShort(value: float): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toInt(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toInt',
        'static toInt(value: float): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toLong(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toLong',
        'static toLong(value: float): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = 0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toFloat(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toFloat',
        'static toFloat(value: float): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toDouble(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toDouble',
        'static toDouble(value: float): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toString(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toString',
        'static toString(f: float): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.toString(1.0f, 16 );
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toString',
        'static toString(f: float, r: int): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.compare(1.0f, 2.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'compare',
        'static compare(lhs: float, rhs: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.isNaN(Float.NaN);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isNaN',
        'static isNaN(v: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.isFinite(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isFinite',
        'static isFinite(v: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.isInteger(3.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isInteger',
        'static isInteger(v: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.isSafeInteger(3.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isSafeInteger',
        'static isSafeInteger(v: float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float = 0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.bitCastFromInt(0x3f800000);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'bitCastFromInt',
        'static bitCastFromInt(bits: int): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_StaticMethod_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Float.bitCastToInt(1.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_StaticMethod_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'bitCastToInt',
        'static bitCastToInt(val: float): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toByte();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toByte',
        'toByte(): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toShort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toShort',
        'toShort(): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toInt();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toInt',
        'toInt(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toLong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toLong',
        'toLong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: float = 0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toFloat();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toFloat',
        'toFloat(): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toDouble();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toDouble',
        'toDouble(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.compareTo(floatObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'compareTo',
        'compareTo(other: Float): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toString(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toString',
        'toString(r: int): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toLocaleString',
        'toLocaleString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.toLocaleString('en-US', { minimumFractionDigits: 2 });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2610: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'toLocaleString',
        'toLocaleString(locales: String, options?: NumberFormatOptions): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.equals(floatObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'equals',
        'equals(other: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(Float.NaN);
      let res: boolean = floatObj.isNaN();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isNaN();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isNaN',
        'isNaN(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let res: boolean = floatObj.isFinite();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isFinite();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isFinite',
        'isFinite(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(3.0f);
      let res: boolean = floatObj.isInteger();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isInteger();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isInteger',
        'isInteger(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(3.0f);
      let res: boolean = floatObj.isSafeInteger();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isSafeInteger();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isSafeInteger',
        'isSafeInteger(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: Float = floatObj.add(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.add(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'add',
        'add(other: Float): Float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: Float = floatObj.sub(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.sub(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'sub',
        'sub(other: Float): Float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: Float = floatObj.mul(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.mul(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'mul',
        'mul(other: Float): Float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: Float = floatObj.div(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.div(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'div',
        'div(other: Float): Float', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: boolean = floatObj.isLessThan(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isLessThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isLessThan',
        'isLessThan(other: Float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: boolean = floatObj.isLessEqualThan(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isLessEqualThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isLessEqualThan',
        'isLessEqualThan(other: Float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: boolean = floatObj.isGreaterThan(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isGreaterThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isGreaterThan',
        'isGreaterThan(other: Float): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Float_Instance_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let floatObj = new Float(1.0f);
      let other = new Float();
      let res: boolean = floatObj.isGreaterEqualThan(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = floatObj.isGreaterEqualThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Float_Instance_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float', 'isGreaterEqualThan',
        'isGreaterEqualThan(other: Float): boolean', arkTsAveragedTime);
    })

  })
}
