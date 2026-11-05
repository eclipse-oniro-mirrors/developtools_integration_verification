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


function toShortValue(value: int): short {
  return value.toShort();
}

function createShort0(): Short {
  return new Short();
}

function createShort123(): Short {
  return new Short(toShortValue(123));
}

function createShort456(): Short {
  return new Short(toShortValue(456));
}

function createShort7(): Short {
  return new Short(toShortValue(7));
}

function createShort255(): Short {
  return new Short(toShortValue(255));
}

function createString12345(): String {
  return new String("12345");
}

export default function ShortPerfTest(): void {
  describe('ShortPerfTest', () => {
    const BASE_COUNT = 50000;
    const HEAVY_COUNT = 1000;
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

    it('PerformanceTest_Short_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result = new Short();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Short();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result = new Short(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Short(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_constructor_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'constructor',
          'constructor(value: short)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toString_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort255();
        let radix: int = 16;
        let result: string = value.toString(radix);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString(radix);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toString_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toString',
          'toString(radix: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_MIN_VALUE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: short = Short.MIN_VALUE;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.MIN_VALUE;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_MIN_VALUE_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'MIN_VALUE',
          'MIN_VALUE: short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_MAX_VALUE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: short = Short.MAX_VALUE;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.MAX_VALUE;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_MAX_VALUE_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'MAX_VALUE',
          'MAX_VALUE: short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_BIT_SIZE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: byte = Short.BIT_SIZE;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.BIT_SIZE;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_BIT_SIZE_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'BIT_SIZE',
          'BIT_SIZE: byte',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_BYTE_SIZE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: byte = Short.BYTE_SIZE;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.BYTE_SIZE;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_BYTE_SIZE_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'BYTE_SIZE',
          'BYTE_SIZE: byte',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toByte_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: byte = value.toByte();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toByte();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toByte_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toByte',
          'toByte(): byte',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toShort_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: short = value.toShort();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toShort();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toShort_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toShort',
          'toShort(): short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toInt_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: int = value.toInt();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toInt();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toInt_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toInt',
          'toInt(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toLong_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: long = value.toLong();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toLong();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toLong_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toLong',
          'toLong(): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toFloat_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: float = value.toFloat();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toFloat();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toFloat_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toFloat',
          'toFloat(): float',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toDouble_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: double = value.toDouble();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toDouble();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toDouble_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toDouble',
          'toDouble(): double',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toChar_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: char = value.toChar();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toChar();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toChar_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toChar',
          'toChar(): char',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toByte_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: byte = Short.toByte(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toByte(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toByte_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toByte',
          'static toByte(value: short): byte',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toInt_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: int = Short.toInt(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toInt(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toInt_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toInt',
          'static toInt(value: short): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toLong_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: long = Short.toLong(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toLong(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toLong_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toLong',
          'static toLong(value: short): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toFloat_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: float = Short.toFloat(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toFloat(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toFloat_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toFloat',
          'static toFloat(value: short): float',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toDouble_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: double = Short.toDouble(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toDouble(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toDouble_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toDouble',
          'static toDouble(value: short): double',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toChar_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: char = Short.toChar(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toChar(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toChar_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toChar',
          'static toChar(value: short): char',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toShort_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: short = Short.toShort(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toShort(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toShort_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toShort',
          'static toShort(value: short): short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_compareTo_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Short = createShort456();
        let result: int = value.compareTo(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.compareTo(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_compareTo_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'compareTo',
          'compareTo(other: Short): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(123);
        let result: string = Short.toString(value);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.toString(value);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toString',
          'static toString(v: short): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toString_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let result: String = value.toString();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toString_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toString',
          'toString(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_equals_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Any = createShort123();
        let result: boolean = value.equals(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.equals(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_equals_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'equals',
          'equals(other: Any): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toLocaleString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let options: Intl.NumberFormatOptions | undefined = undefined;
        let result: String = value.toLocaleString(undefined, options);
        let sTime = new Date().getTime();

        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.toLocaleString(undefined, options);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toLocaleString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toLocaleString',
          'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_toLocaleString_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let options: object = {};
        let result: String = value.toLocaleString(undefined, options);
        let sTime = new Date().getTime();

        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.toLocaleString(undefined, options);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_toLocaleString_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'toLocaleString',
          'toLocaleString(locales?: Intl.LocalesArgument, options?: object): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_add_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Short = createShort456();
        let result: Short = value.add(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.add(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_add_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'add',
          'add(other: Short): Short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_sub_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort456();
        let other: Short = createShort123();
        let result: Short = value.sub(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.sub(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_sub_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'sub',
          'sub(other: Short): Short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_mul_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Short = createShort7();
        let result: Short = value.mul(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.mul(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_mul_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'mul',
          'mul(other: Short): Short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_div_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort456();
        let other: Short = createShort7();
        let result: Short = value.div(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.div(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_div_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'div',
          'div(other: Short): Short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_isLessThan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Short = createShort456();
        let result: boolean = value.isLessThan(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.isLessThan(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_isLessThan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'isLessThan',
          'isLessThan(other: Short): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_isLessEqualThan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort123();
        let other: Short = createShort456();
        let result: boolean = value.isLessEqualThan(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.isLessEqualThan(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_isLessEqualThan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'isLessEqualThan',
          'isLessEqualThan(other: Short): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_isGreaterThan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort456();
        let other: Short = createShort123();
        let result: boolean = value.isGreaterThan(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.isGreaterThan(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_isGreaterThan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'isGreaterThan',
          'isGreaterThan(other: Short): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_isGreaterEqualThan_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Short = createShort456();
        let other: Short = createShort123();
        let result: boolean = value.isGreaterEqualThan(other);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.isGreaterEqualThan(other);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_isGreaterEqualThan_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'isGreaterEqualThan',
          'isGreaterEqualThan(other: Short): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Short_parseInt_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let s: String = createString12345();
        let r: int = 10;
        let result: short = Short.parseInt(s, r);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Short.parseInt(s, r);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Short_parseInt_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Short',
          'parseInt',
          'parseInt(s: String, r: int): short',
          arkTsAveragedTime
        );
      });
  });
}