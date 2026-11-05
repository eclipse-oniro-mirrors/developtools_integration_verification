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

export default function IntPerfTest(): void {
  describe('IntPerfTest', () => {
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

    it('PerformanceTest_Int_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
         res = new Int();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'constructor',
        'function constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'constructor',
        'function constructor(value: int)', arkTsAveragedTime);
    })

    // it('PerformanceTest_Int_Instance_toLocaleString_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let intObj = new Int(123);
    //   let res: String = new String('');
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = intObj.toLocaleString();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toLocaleString_2800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toLocaleString',
    //     'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String', arkTsAveragedTime);
    // })

    it('PerformanceTest_Int_Static_Properties_MIN_VALUE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.MIN_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_Properties_MIN_VALUE_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'MIN_VALUE',
        'static readonly MIN_VALUE: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_Properties_MAX_VALUE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.MAX_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_Properties_MAX_VALUE_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'MAX_VALUE',
        'static readonly MAX_VALUE: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_Properties_BIT_SIZE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.BIT_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_Properties_BIT_SIZE_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'BIT_SIZE',
        'static readonly BIT_SIZE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_Properties_BYTE_SIZE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.BYTE_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_Properties_BYTE_SIZE_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'BYTE_SIZE',
        'static readonly BYTE_SIZE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toByte_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0 ;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toByte(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toByte_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toByte',
        'static toByte(value: int): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toShort_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: short = 0 ;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toShort(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toShort_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toShort',
        'static toShort(value: int): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toLong_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0 ;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toLong(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toLong_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toLong',
        'static toLong(value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toFloat_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float = 1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toFloat(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toFloat_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toFloat',
        'static toFloat(value: int): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toDouble_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toDouble(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toDouble_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toDouble',
        'static toDouble(value: int): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toChar_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toChar(65);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toChar_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toChar',
        'static toChar(value: int): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toInt_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toInt(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toInt_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toInt',
        'static toInt(value: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_toString_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.toString(100);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_toString_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toString',
        'static toString(v: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Static_parseInt_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int.parseInt('100', 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Static_parseInt_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'parseInt',
        'static parseInt(s: String, r: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toByte_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toByte();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toByte_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toByte',
        'toByte(): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toShort_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: short = 0 as short;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toShort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toShort_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toShort',
        'toShort(): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toInt_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toInt();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toInt_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toInt',
        'toInt(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toLong_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: long = 0 as long;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toLong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toLong_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toLong',
        'toLong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toFloat_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: float = 1.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toFloat();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toFloat_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toFloat',
        'toFloat(): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toDouble_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toDouble();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toDouble_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toDouble',
        'toDouble(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toChar_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(65);
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toChar();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toChar_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toChar',
        'toChar(): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_compareTo_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(200);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.compareTo(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_compareTo_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'compareTo',
        'compareTo(other: Int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_equals_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(100);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.equals(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_equals_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'equals',
        'equals(other: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toString_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: String = new String('');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toString_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toString_radix_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toString(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toString_radix_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toString',
        'toString(radix: number): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_add_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(200);
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.add(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_add_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'add',
        'add(other: Int): Int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_sub_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(200);
      let intObj2 = new Int(100);
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.sub(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_sub_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'sub',
        'sub(other: Int): Int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_mul_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(10);
      let intObj2 = new Int(20);
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.mul(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_mul_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'mul',
        'mul(other: Int): Int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_div_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(200);
      let intObj2 = new Int(10);
      let res: Int = new Int();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.div(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_div_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'div',
        'div(other: Int): Int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_isLessThan_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(200);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.isLessThan(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_isLessThan_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'isLessThan',
        'isLessThan(other: Int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_isLessEqualThan_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(100);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.isLessEqualThan(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_isLessEqualThan_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'isLessEqualThan',
        'isLessEqualThan(other: Int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_isGreaterThan_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(200);
      let intObj2 = new Int(100);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.isGreaterThan(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_isGreaterThan_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'isGreaterThan',
        'isGreaterThan(other: Int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_isGreaterEqualThan_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(100);
      let intObj2 = new Int(100);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.isGreaterEqualThan(intObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_isGreaterEqualThan_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'isGreaterEqualThan',
        'isGreaterEqualThan(other: Int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toLocaleString_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(123);
      let res: String = new String('');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toLocaleString_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toLocaleString',
        'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Int_Instance_toLocaleString_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let intObj = new Int(1234567);
      let res: String = new String('');
      let options: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD'
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = intObj.toLocaleString('en-US', options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int_Instance_toLocaleString_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int', 'toLocaleString',
        'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String', arkTsAveragedTime);
    })

  })
}
