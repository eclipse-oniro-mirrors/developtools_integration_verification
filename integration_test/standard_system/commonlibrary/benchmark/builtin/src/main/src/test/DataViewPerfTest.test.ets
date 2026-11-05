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

export default function DataViewPerfTest(): void {
  describe('DataViewPerfTest', () => {
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

    // ========== 构造函数测试 ==========
    it('PerformanceTest_DataView_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer)', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer, 4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer, byteOffset: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer, 4, 8);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer, byteOffset: int, byteLength: int)', arkTsAveragedTime);
    })

    // ========== 属性测试 ==========
    it('PerformanceTest_DataView_Property_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: ArrayBuffer = buffer;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.buffer;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'buffer',
        'get buffer(): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Property_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'byteLength',
        'get byteLength(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Property_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.byteOffset;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'byteOffset',
        'get byteOffset(): int', arkTsAveragedTime);
    })

    // ========== Int8 方法测试 ==========
    it('PerformanceTest_DataView_Int8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt8(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt8',
        'getInt8(byteOffset: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int8_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt8(0, 100);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int8_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt8',
        'setInt8(byteOffset: int, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int8_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt8(0, 100.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int8_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt8',
        'setInt8(byteOffset: int, value: number): void', arkTsAveragedTime);
    })

    // ========== Uint8 方法测试 ==========
    it('PerformanceTest_DataView_Uint8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint8(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint8',
        'getUint8(byteOffset: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint8_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint8(0, 200);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint8_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint8',
        'setUint8(byteOffset: int, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint8_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint8(0, 200.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint8_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint8',
        'setUint8(byteOffset: int, value: number): void', arkTsAveragedTime);
    })

    // ========== Int16 方法测试 ==========
    it('PerformanceTest_DataView_Int16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt16(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt16',
        'getInt16(byteOffset: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int16_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt16(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt16',
        'getInt16(byteOffset: int, littleEndian?: boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int16_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: int, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int16_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: int, value: int, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int16_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int16_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000.5, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: int, value: number, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== Uint16 方法测试 ==========
    it('PerformanceTest_DataView_Uint16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint16(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint16',
        'getUint16(byteOffset: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint16_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint16(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint16',
        'getUint16(byteOffset: int, littleEndian?: boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint16_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: int, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint16_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000, true);
      }
      let Dtime = new Date().getTime() - Stime;
	   let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: int, value: int, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint16_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint16_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000.5, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: int, value: number, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== Int32 方法测试 ==========
    it('PerformanceTest_DataView_Int32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt32(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt32',
        'getInt32(byteOffset: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int32_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt32(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt32',
        'getInt32(byteOffset: int, littleEndian?: boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int32_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: int, value: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int32_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: int, value: int, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int32_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Int32_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000.5, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: int, value: number, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== Uint32 方法测试 ==========
    it('PerformanceTest_DataView_Uint32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint32(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint32',
        'getUint32(byteOffset: int): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint32_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint32(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint32',
        'getUint32(byteOffset: int, littleEndian?: boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint32_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: int, value: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint32_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: int, value: long, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint32_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000.5);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Uint32_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000.5, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: int, value: number, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== Float32 方法测试 ==========
    it('PerformanceTest_DataView_Float32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat32(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat32',
        'getFloat32(byteOffset: int): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float32_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat32(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat32',
        'getFloat32(byteOffset: int, littleEndian?: boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float32_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159f);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: int, value: float): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float32_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159f, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: int, value: float, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float32_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float32_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: int, value: number, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== Float64 方法测试 ==========
    it('PerformanceTest_DataView_Float64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat64(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat64',
        'getFloat64(byteOffset: int): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float64_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat64(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat64',
        'getFloat64(byteOffset: int, littleEndian?: boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float64_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat64(0, 2.71828182846);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat64',
        'setFloat64(byteOffset: int, value: number): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_Float64_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat64(0, 2.71828182846, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat64',
        'setFloat64(byteOffset: int, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    // ========== BigInt64 方法测试 ==========
    it('PerformanceTest_DataView_BigInt64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigInt64(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigInt64',
        'getBigInt64(byteOffset: int): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigInt64(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigInt64',
        'getBigInt64(byteOffset: int, littleEndian?: boolean): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: int, value: long): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: int, value: long, littleEndian: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992n);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: int, value: bigint): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992n, true);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: int, value: bigint, littleEndian?: boolean): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigInt64_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992n, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: int, value: bigint, littleEndian: boolean): void', arkTsAveragedTime);
    })

    // ========== BigUint64 方法测试 ==========
    it('PerformanceTest_DataView_BigUint64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigUint64(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigUint64',
        'getBigUint64(byteOffset: int): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigUint64_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigUint64(0, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigUint64',
        'getBigUint64(byteOffset: int, littleEndian?: boolean): bigint', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigUint64_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: int, value: bigint): void', arkTsAveragedTime);
    })

    it('PerformanceTest_DataView_BigUint64_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: int, value: bigint, littleEndian?: boolean): void', arkTsAveragedTime);
    })


    it('PerformanceTest_DataView_BigUint64_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n, false);
      }
      let Dtime = new Date().getTime() - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: int, value: bigint, littleEndian: boolean): void', arkTsAveragedTime);
    })

  })
}
