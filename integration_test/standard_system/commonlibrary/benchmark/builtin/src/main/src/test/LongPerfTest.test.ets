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
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

const BASE_COUNT = 50000;
const UNIT_TIME = 1000000;
const BASE_COUNT_MIX = 500;

function getLong123(): long {
  return Long.parseInt("123", 10);
}

function getLong456(): long {
  return Long.parseInt("456", 10);
}

function getLong7(): long {
  return Long.parseInt("7", 10);
}

function createLong123(): Long {
  return new Long(getLong123());
}

function createLong456(): Long {
  return new Long(getLong456());
}

function createLong7(): Long {
  return new Long(getLong7());
}

export default function LongPerfTest(): void {
  describe('LongPerfTest', () => {
    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Long_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: Long = new Long();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Long();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'constructor',
          'constructor()', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: Long = new Long(value);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Long(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'constructor',
          'constructor(value: long)', arkTsAveragedTime);
      });

    // ============ Static Tests ============
    it('PerformanceTest_Long_Static_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: long = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.MIN_VALUE;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'MIN_VALUE',
          'static readonly MIN_VALUE: long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: long = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.MAX_VALUE;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2010: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'MAX_VALUE',
          'static readonly MAX_VALUE: long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: byte = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.BIT_SIZE;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2020: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'BIT_SIZE',
          'static readonly BIT_SIZE: byte', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: byte = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.BYTE_SIZE;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2030: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'BYTE_SIZE',
          'static readonly BYTE_SIZE: byte', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: string = '';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toString(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toString',
          'static toString(v: long): string', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: byte = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toByte(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toByte',
          'static toByte(value: long): byte', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: short = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toShort(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2210: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toShort',
          'static toShort(value: long): short', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toInt(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2220: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toInt',
          'static toInt(value: long): int', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: long = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toLong(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2230: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toLong',
          'static toLong(value: long): long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: float = 0.0f;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toFloat(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2240: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toFloat',
          'static toFloat(value: long): float', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toDouble(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2250: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toDouble',
          'static toDouble(value: long): double', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = getLong123();
        let res: char = c'\0';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.toChar(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2260: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toChar',
          'static toChar(value: long): char', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Static_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let s: String = "123456";
        let r: int = 10;
        let res: long = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Long.parseInt(s, r);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Static_2300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'parseInt',
          'static parseInt(s: String, r: int): long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: byte = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toByte();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toByte',
          'toByte(): byte', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: short = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toShort();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0110: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toShort',
          'toShort(): short', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toInt();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0120: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toInt',
          'toInt(): int', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: long = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toLong();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0130: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toLong',
          'toLong(): long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: float = 0.0f;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toFloat();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0140: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toFloat',
          'toFloat(): float', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toDouble();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0150: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toDouble',
          'toDouble(): double', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: char = c'\0';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toChar();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0160: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toChar',
          'toChar(): char', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let res: String = '';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toString();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toString',
          'toString(): String', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let radix: int = 16;
        let res: string = '';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.toString(radix);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0210: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toString',
          'toString(radix: int): string', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Any = createLong123();
        let res: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.equals(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'equals',
          'equals(other: Any): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Long = createLong456();
        let res: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.compareTo(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0310: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'compareTo',
          'compareTo(other: Long): int', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let options: Intl.NumberFormatOptions | undefined = undefined;
        let res: String = '';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT_MIX; i++) {
          res = value.toLocaleString(undefined, options);
        }
        let Dtime = new Date().getTime() - Stime;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MIX;
        let res1 = res;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'toLocaleString',
          'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Long = createLong456();
        let res: Long = new Long(0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.add(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'add',
          'add(other: Long): Long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong456();
        let other: Long = createLong123();
        let res: Long = new Long(0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.sub(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0510: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'sub',
          'sub(other: Long): Long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0520',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Long = createLong7();
        let res: Long = new Long(0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.mul(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0520: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'mul',
          'mul(other: Long): Long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0530',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong456();
        let other: Long = createLong7();
        let res: Long = new Long(0);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.div(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0530: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'div',
          'div(other: Long): Long', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Long = createLong456();
        let res: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.isLessThan(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'isLessThan',
          'isLessThan(other: Long): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0610',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong123();
        let other: Long = createLong456();
        let res: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.isLessEqualThan(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0610: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'isLessEqualThan',
          'isLessEqualThan(other: Long): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0620',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong456();
        let other: Long = createLong123();
        let res: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.isGreaterThan(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0620: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'isGreaterThan',
          'isGreaterThan(other: Long): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_Long_Instance_0630',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Long = createLong456();
        let other: Long = createLong123();
        let res: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = value.isGreaterEqualThan(other);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Long_Instance_0630: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Long', 'isGreaterEqualThan',
          'isGreaterEqualThan(other: Long): boolean', arkTsAveragedTime);
      });
  });
}
