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

export default function BytePerfTest(): void {
  describe('BytePerfTest', () => {
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

    it('PerformanceTest_Byte_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Byte(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'constructor',
        'function constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Byte(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'constructor',
        'function constructor(value: byte)', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.MIN_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'MIN_VALUE',
        'static MIN_VALUE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.MAX_VALUE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'MAX_VALUE',
        'static MAX_VALUE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.BIT_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'BIT_SIZE',
        'static BIT_SIZE: byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.BYTE_SIZE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'BYTE_SIZE',
        'static BYTE_SIZE: byte', arkTsAveragedTime);
    })


    it('PerformanceTest_Byte_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toByte(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toByte',
        'static toByte(value: byte): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toShort(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toShort',
        'static toShort(value: byte): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toInt(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toInt',
        'static toInt(value: byte): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toLong(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toLong',
        'static toLong(value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: float = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toFloat(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toFloat',
        'static toFloat(value: byte): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: double = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toDouble(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toDouble',
        'static toDouble(value: byte): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toChar(65);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toChar',
        'static toChar(value: byte): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Byte.toString(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Static_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toString',
        'static toString(v: byte): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toByte();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toByte',
        'toByte(): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: short = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toShort();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toShort',
        'toShort(): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toInt();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toInt',
        'toInt(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toLong();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toLong',
        'toLong(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: float = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toFloat();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toFloat',
        'toFloat(): float', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: double = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toDouble();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toDouble',
        'toDouble(): double', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(65);
      let res: char = c'\u0000';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toChar();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toChar',
        'toChar(): char', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toString',
        'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toString(16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toString',
        'toString(radix: number): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.equals(byteObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'equals',
        'equals(other: Any): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.compareTo(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'compareTo',
        'compareTo(other: Byte): int', arkTsAveragedTime);
    })

    // 算术运算方法测试
    it('PerformanceTest_Byte_Instance_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.add(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'add',
        'add(other: Byte): Byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.sub(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'sub',
        'sub(other: Byte): Byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.mul(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'mul',
        'mul(other: Byte): Byte', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(2);
      let res: Byte = new Byte(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.div(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'div',
        'div(other: Byte): Byte', arkTsAveragedTime);
    })

    // 比较方法测试
    it('PerformanceTest_Byte_Instance_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.isLessThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'isLessThan',
        'isLessThan(other: Byte): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.isLessEqualThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'isLessEqualThan',
        'isLessEqualThan(other: Byte): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(5);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.isGreaterThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'isGreaterThan',
        'isGreaterThan(other: Byte): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(10);
      let other = new Byte(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.isGreaterEqualThan(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'isGreaterEqualThan',
        'isGreaterEqualThan(other: Byte): boolean', arkTsAveragedTime);
    })

    // toLocaleString方法测试
    // it('PerformanceTest_Byte_Instance_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let byteObj = new Byte(123);
    //   let res: String = new String();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = byteObj.toLocaleString();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_2000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toLocaleString',
    //     'toLocaleString(): String', arkTsAveragedTime);
    // })

    // toLocaleString 方法测试
    it('PerformanceTest_Byte_Instance_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(123);
      let res: String = new String();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toLocaleString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toLocaleString',
        'toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String', arkTsAveragedTime);
    })

    it('PerformanceTest_Byte_Instance_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byteObj = new Byte(123);
      let res: String = new String();
      let options: Intl.NumberFormatOptions = {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = byteObj.toLocaleString('zh-CN', options);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Byte_Instance_3010: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Byte', 'toLocaleString',
        'toLocaleString(locales?: Intl.LocalesArgument, options?: object): String', arkTsAveragedTime);
    })

  })
}
