/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

export default function BigIntPerfTest(): void {
  describe('BigIntPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    const BASE_COUNT_MEDIUM = 10000;
    const BASE_COUNT_SMALL = 200;
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

    it('PerformanceTest_BigInt_constructor_default_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_byte_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let val: byte = 42;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(byte): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: byte)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_short_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let val: short = 10000;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(short): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: short)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_int_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(int): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_long_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(9999999999 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(long): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: long)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_double_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(3.14e15 as double);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(double): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: double)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_string_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = new BigInt("12345678901234567890");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(string): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: string)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_boolean_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(boolean): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: boolean)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_BigInt_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let bigNum = new BigInt("123456789012345678901234567890");
      let src = bigNum;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(src);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(BigInt): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(d: BigInt)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_FixedArray_sign_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let arr: FixedArray<int> = [1, 2, 3, 4];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(arr, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(FixedArray<int>, sign): '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(v: FixedArray<int>, sign: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_constructor_ValueArray_sign_1010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vArr: ValueArray<int> = [1, 2, 3, 4];
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt(vArr, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime constructor(ValueArray<int>, sign): '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'constructor',
        'constructor(v: ValueArray<int>, sign: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_fromULong_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let val = 4294967295 as long;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt.fromULong(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime fromULong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'fromULong',
        'static fromULong(val: long): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_asIntN_long_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = BigInt.asIntN(16 as long, bigNum);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime asIntN(long): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'asIntN',
        'static asIntN(bits: long, num: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_asIntN_Number_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = BigInt.asIntN(16, bigNum);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime asIntN(Number): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'asIntN',
        'static asIntN(bits: Number, num: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_asUintN_long_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = BigInt.asUintN(32 as long, bigNum);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime asUintN(long): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'asUintN',
        'static asUintN(bits: long, num: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_asUintN_Number_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = BigInt.asUintN(32, bigNum);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime asUintN(Number): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'asUintN',
        'static asUintN(bits: Number, num: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_invoke_BigInt_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt.$_invoke(a);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime $_invoke(BigInt): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', '$_invoke',
        'static $_invoke(value: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_invoke_long_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt.$_invoke(99999 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime $_invoke(long): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', '$_invoke',
        'static $_invoke(value: long): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_invoke_number_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt.$_invoke(12345 as number);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime $_invoke(number): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', '$_invoke',
        'static $_invoke(value: number): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_invoke_string_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = BigInt.$_invoke("987654321");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime $_invoke(string): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', '$_invoke',
        'static $_invoke(value: string): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_invoke_boolean_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigInt.$_invoke(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime $_invoke(boolean): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', '$_invoke',
        'static $_invoke(value: boolean): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_equals_BigInt_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.equals(b);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime equals(BigInt): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'equals',
        'equals(to: BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_equals_Any_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let other: Any = "not_a_bigint" as Any;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime equals(Any): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'equals',
        'equals(other: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_negative_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let negNum = new BigInt(-999999);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = negNum.negative();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime negative: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'negative',
        'negative(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_positive_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let negNum = new BigInt(-999999);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = negNum.positive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime positive: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'positive',
        'positive(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toString_noArgs_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bigNum.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime toString(): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toString_int_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = bigNum.toString(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime toString(int): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toString',
        'toString(radix: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toStringAsBinary_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = bigNum.toStringAsBinary();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime toStringAsBinary: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toStringAsBinary',
        'toStringAsBinary(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toStringAsDecimal_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = bigNum.toStringAsDecimal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime toStringAsDecimal: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toStringAsDecimal',
        'toStringAsDecimal(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toStringAsPowerOfTwoRadix_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt("123456789012345678901234567890");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = bigNum.toStringAsPowerOfTwoRadix(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime toStringAsPowerOfTwoRadix: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toStringAsPowerOfTwoRadix',
        'toStringAsPowerOfTwoRadix(radix: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toLocaleString_typed_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bigNum.toLocaleString("zh-CN");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime toLocaleString(typed): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toLocaleString',
        'toLocaleString(locales?: Intl.LocalesArgument, options?: BigIntToLocaleStringOptions): string',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_toLocaleString_options_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let bigNum = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bigNum.toLocaleString("en-US", undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime toLocaleString(object): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'toLocaleString',
        'override toLocaleString(locales?: Intl.LocalesArgument, options?: object): String',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_valueOf_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'valueOf',
        'valueOf(): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_doubleValue_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new BigInt(123456789);
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.doubleValue();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime doubleValue: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'doubleValue',
        'doubleValue(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_getLong_3410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new BigInt(123456789);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.getLong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime getLong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'getLong',
        'getLong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_getULong_3420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new BigInt(123456789);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.getULong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime getULong: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'getULong',
        'getULong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorAdd_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a + b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator+: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorAdd',
        'operatorAdd(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorSubtract_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a - b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator-: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorSubtract',
        'operatorSubtract(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorMultiply_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a * b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator*: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorMultiply',
        'operatorMultiply(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorDivide_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = b / a;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator/: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorDivide',
        'operatorDivide(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorModule_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = b % a;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator%: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorModule',
        'operatorModule(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorBitwiseAnd_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a & b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator&: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorBitwiseAnd',
        'operatorBitwiseAnd(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorBitwiseOr_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a | b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator|: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorBitwiseOr',
        'operatorBitwiseOr(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorBitwiseXor_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a ^ b;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator^: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorBitwiseXor',
        'operatorBitwiseXor(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorBitwiseNot_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = ~a;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator~: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorBitwiseNot',
        'operatorBitwiseNot(): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorLeftShift_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let shift = new BigInt(8);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a << shift;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator<<: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorLeftShift',
        'operatorLeftShift(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorRightShift_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let shift = new BigInt(4);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = a >> shift;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator>>: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorRightShift',
        'operatorRightShift(other: BigInt): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorIncrement_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let val = new BigInt(100);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ++val;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator++: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorIncrement',
        'operatorIncrement(): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorDecrement_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let val = new BigInt(200);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = --val;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator--: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorDecrement',
        'operatorDecrement(): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorGreaterThan_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = (b > a);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator>: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorGreaterThan',
        'operatorGreaterThan(other: BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorLessThan_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = (a < b);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator<: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorLessThan',
        'operatorLessThan(other: BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorGreaterThanEqual_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = (b >= a);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator>=: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorGreaterThanEqual',
        'operatorGreaterThanEqual(other: BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_operatorLessThanEqual_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let a = new BigInt(123456789);
      let b = new BigInt(987654321);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = (a <= b);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime operator<=: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'operatorLessThanEqual',
        'operatorLessThanEqual(other: BigInt): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_negate_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let a = new BigInt(123456789);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = a.negate();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime negate: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'negate',
        'negate(): BigInt', arkTsAveragedTime);
    })

    it('PerformanceTest_BigInt_pow_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BigInt = new BigInt(0);
      let base = new BigInt(2);
      let exp = new BigInt(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_SMALL; i++) {
        res = base.pow(exp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_SMALL;
      console.info('arkTsPerformanceTest arkTsAveragedTime pow: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt', 'pow',
        'pow(exponent: BigInt): BigInt', arkTsAveragedTime);
    })
  })
}
