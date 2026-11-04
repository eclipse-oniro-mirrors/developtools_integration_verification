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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

export default function CharPerfTest(): void {
  describe('CharPerfTest', () => {
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

    it('PerformanceTest_Char_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Char = new Char();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
         res = new Char();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'constructor',
        'function constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Char = new Char();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Char(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'constructor',
        'function constructor(value: char)', arkTsAveragedTime);
    })


    it('PerformanceTest_Char_Static_compare_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let char1 = new Char(c'A');
      let char2 = new Char(c'B');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.compare(char1, char2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_compare_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'compare',
        'static compare(lhs: Char, rhs: Char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toByte_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0 as byte;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toByte(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toByte_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toByte',
        'static toByte(value: char): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toShort_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: short = 0 as short;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toShort(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toShort_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toShort',
        'static toShort(value: char): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toInt_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toInt(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toInt_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toInt',
        'static toInt(value: char): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toLong_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0 as long;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toLong(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toLong_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toLong',
        'static toLong(value: char): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toFloat_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float = 0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toFloat(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toFloat_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toFloat',
        'static toFloat(value: char): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toDouble_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toDouble(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toDouble_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toDouble',
        'static toDouble(value: char): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toString_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toString(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toString_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toString',
        'static toString(value: char): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toChar_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toChar(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toChar_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toChar',
        'static toChar(value: char): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isInBasicMultilingualPlane_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isInBasicMultilingualPlane(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isInBasicMultilingualPlane_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isInBasicMultilingualPlane',
        'static isInBasicMultilingualPlane(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isInBasicMultilingualPlane_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let codePoint: int = 65;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isInBasicMultilingualPlane(codePoint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isInBasicMultilingualPlane_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isInBasicMultilingualPlane',
        'static isInBasicMultilingualPlane(value: UTF_16_CodePoint): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isValidCodePoint_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let codePoint: int = 65;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isValidCodePoint(codePoint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isValidCodePoint_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isValidCodePoint',
        'static isValidCodePoint(codePoint: UTF_16_CodePoint): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_codeUnitsToEncode_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let codePoint: int = 65;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.codeUnitsToEncode(codePoint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_codeUnitsToEncode_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'codeUnitsToEncode',
        'static codeUnitsToEncode(value: UTF_16_CodePoint): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isHighSurrogate_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isHighSurrogate(c'\uD800');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isHighSurrogate_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isHighSurrogate',
        'static isHighSurrogate(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isLowSurrogate_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isLowSurrogate(c'\uDC00');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isLowSurrogate_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isLowSurrogate',
        'static isLowSurrogate(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_getHighSurrogate_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let codePoint: int = 65536;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.getHighSurrogate(codePoint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_getHighSurrogate_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'getHighSurrogate',
        'static getHighSurrogate(value: UTF_16_CodePoint): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_getLowSurrogate_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let codePoint: int = 65536;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.getLowSurrogate(codePoint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_getLowSurrogate_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'getLowSurrogate',
        'static getLowSurrogate(value: UTF_16_CodePoint): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isPartOfSurrogatePair_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isPartOfSurrogatePair(c'\uD800');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isPartOfSurrogatePair_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isPartOfSurrogatePair',
        'static isPartOfSurrogatePair(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_charsToCodePoint_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.charsToCodePoint(c'\uD800', c'\uDC00');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_charsToCodePoint_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'charsToCodePoint',
        'static charsToCodePoint(highValue: char, lowValue: char): UTF_16_CodePoint', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isBinDigit_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isBinDigit(c'0');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isBinDigit_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isBinDigit',
        'static isBinDigit(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isDecDigit_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isDecDigit(c'5');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isDecDigit_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isDecDigit',
        'static isDecDigit(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isHexDigit_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isHexDigit(c'F');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isHexDigit_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isHexDigit',
        'static isHexDigit(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isLetter_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isLetter(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isLetter_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isLetter',
        'static isLetter(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isUpperCase_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isUpperCase(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isUpperCase_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isUpperCase',
        'static isUpperCase(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isLowerCase_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isLowerCase(c'a');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isLowerCase_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isLowerCase',
        'static isLowerCase(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toUpperCase_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toUpperCase(c'a');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toUpperCase_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toUpperCase',
        'static toUpperCase(value: char): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_toLowerCase_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.toLowerCase(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_toLowerCase_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toLowerCase',
        'static toLowerCase(value: char): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_isWhiteSpace_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.isWhiteSpace(c' ');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_isWhiteSpace_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isWhiteSpace',
        'static isWhiteSpace(value: char): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.CHAR_BIT_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'CHAR_BIT_SIZE',
        'static readonly CHAR_BIT_SIZE: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.MAX_CODE_POINT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'MAX_CODE_POINT',
        'static readonly MAX_CODE_POINT: int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.MIN_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'MIN_VALUE',
        'static readonly MIN_VALUE: char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.MAX_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'MAX_VALUE',
        'static readonly MAX_VALUE: char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toByte_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: byte = 0 as byte;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toByte();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toByte_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toByte',
        'toByte(): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toShort_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: short = 0 as short;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toShort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toShort_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toShort',
        'toShort(): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toInt_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toInt();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toInt_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toInt',
        'toInt(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toLong_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: long = 0 as long;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toLong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toLong_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toLong',
        'toLong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toFloat_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: float = 0.0f;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toFloat();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toFloat_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toFloat',
        'toFloat(): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toDouble_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: double = 0.0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toDouble();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toDouble_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toDouble',
        'toDouble(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toChar_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toChar();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toChar_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toChar',
        'toChar(): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toString_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toString_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_equals_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.equals(charObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_equals_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'equals',
        'equals(other: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_compareTo_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let charObj2 = new Char(c'B');
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.compareTo(charObj2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_compareTo_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'compareTo',
        'compareTo(other: Char): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isInBasicMultilingualPlane_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isInBasicMultilingualPlane();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isInBasicMultilingualPlane_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isInBasicMultilingualPlane',
        'isInBasicMultilingualPlane(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isPartOfSurrogatePair_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'\uD800');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isPartOfSurrogatePair();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isPartOfSurrogatePair_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isPartOfSurrogatePair',
        'isPartOfSurrogatePair(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isBinDigit_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'0');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isBinDigit();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isBinDigit_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isBinDigit',
        'isBinDigit(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isDecDigit_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'5');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isDecDigit();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isDecDigit_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isDecDigit',
        'isDecDigit(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isHexDigit_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'F');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isHexDigit();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isHexDigit_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isHexDigit',
        'isHexDigit(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isLetter_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isLetter();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isLetter_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isLetter',
        'isLetter(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isUpperCase_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isUpperCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isUpperCase_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isUpperCase',
        'isUpperCase(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isLowerCase_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'a');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isLowerCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isLowerCase_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isLowerCase',
        'isLowerCase(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toUpperCase_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'a');
      let res: Char = new Char();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toUpperCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toUpperCase_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toUpperCase',
        'toUpperCase(): Char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toLowerCase_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: Char = new Char();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toLowerCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toLowerCase_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toLowerCase',
        'toLowerCase(): Char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_isWhiteSpace_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c' ');
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.isWhiteSpace();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_isWhiteSpace_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'isWhiteSpace',
        'isWhiteSpace(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Instance_toStringWithRadix_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let charObj = new Char(c'A');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = charObj.toString(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Instance_toStringWithRadix_5700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'toString',
        'toString(radix: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.HIGH_SURROGATE_MIN;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_5800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'HIGH_SURROGATE_MIN',
        'static readonly HIGH_SURROGATE_MIN: char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.HIGH_SURROGATE_MAX;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_5900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'HIGH_SURROGATE_MAX',
        'static readonly HIGH_SURROGATE_MAX: char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.LOW_SURROGATE_MIN;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'LOW_SURROGATE_MIN',
        'static readonly LOW_SURROGATE_MIN: char', arkTsAveragedTime);
    })

    it('PerformanceTest_Char_Static_Properties_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Char.LOW_SURROGATE_MAX;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Char_Static_Properties_6100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Char', 'LOW_SURROGATE_MAX',
        'static readonly LOW_SURROGATE_MAX: char', arkTsAveragedTime);
    })

  })
}
