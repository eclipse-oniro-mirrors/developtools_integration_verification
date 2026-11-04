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
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function DataViewPerfTest(): void {
  describe('DataViewPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_DataView_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer)', arkTsAveragedTime);
      expect(res1.byteLength).assertEqual(16);
      done();
    })

    it('PerformanceTest_DataView_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer, 4);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer, byteOffset: number)', arkTsAveragedTime);
      expect(res1.byteOffset).assertEqual(4);
      done();
    })

    it('PerformanceTest_DataView_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let res: DataView = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new DataView(buffer, 4, 8);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'constructor',
        'function constructor(buffer: ArrayBuffer, byteOffset: number, byteLength: number)', arkTsAveragedTime);
      expect(res1.byteLength).assertEqual(8);
      done();
    })

    it('PerformanceTest_DataView_Property_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: ArrayBuffer = buffer;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.buffer;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'buffer',
        'get buffer(): ArrayBuffer', arkTsAveragedTime);
      expect(res1.byteLength).assertEqual(16);
      done();
    })

    it('PerformanceTest_DataView_Property_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'byteLength',
        'get byteLength(): number', arkTsAveragedTime);
      expect(res1).assertEqual(16);
      done();
    })

    it('PerformanceTest_DataView_Property_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Property_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'byteOffset',
        'get byteOffset(): number', arkTsAveragedTime);
      expect(res1).assertEqual(4);
      done();
    })

    it('PerformanceTest_DataView_Int8_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt8(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int8_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt8',
        'getInt8(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Int8_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt8(0, 100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int8_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt8',
        'setInt8(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getInt8(0)).assertEqual(100);
      done();
    })


    it('PerformanceTest_DataView_Uint8_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint8(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint8_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint8',
        'getUint8(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Uint8_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint8(0, 200);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint8_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint8',
        'setUint8(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getUint8(0)).assertEqual(200);
      done();
    })


    it('PerformanceTest_DataView_Int16_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt16(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt16',
        'getInt16(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Int16_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt16(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt16',
        'getInt16(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Int16_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getInt16(0)).assertEqual(1000);
      done();
    })

    it('PerformanceTest_DataView_Int16_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt16(0, 1000, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int16_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt16',
        'setInt16(byteOffset: number, value: number, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getInt16(0, true)).assertEqual(1000);
      done();
    })

    it('PerformanceTest_DataView_Uint16_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint16(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint16',
        'getUint16(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Uint16_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint16(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint16',
        'getUint16(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Uint16_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getUint16(0)).assertEqual(50000);
      done();
    })

    it('PerformanceTest_DataView_Uint16_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint16(0, 50000, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	   let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint16_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint16',
        'setUint16(byteOffset: number, value: number, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getUint16(0, true)).assertEqual(50000);
      done();
    })

    it('PerformanceTest_DataView_Int32_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt32(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt32',
        'getInt32(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Int32_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getInt32(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getInt32',
        'getInt32(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Int32_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getInt32(0)).assertEqual(100000);
      done();
    })

    it('PerformanceTest_DataView_Int32_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setInt32(0, 100000, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Int32_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setInt32',
        'setInt32(byteOffset: number, value: number, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getInt32(0, true)).assertEqual(100000);
      done();
    })

    it('PerformanceTest_DataView_Uint32_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint32(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint32',
        'getUint32(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Uint32_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getUint32(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getUint32',
        'getUint32(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Uint32_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: number, value: number): void', arkTsAveragedTime);
      expect(view.getUint32(0)).assertEqual(4000000000);
      done();
    })

    it('PerformanceTest_DataView_Uint32_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setUint32(0, 4000000000, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Uint32_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setUint32',
        'setUint32(byteOffset: number, value: number, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getUint32(0, true)).assertEqual(4000000000);
      done();
    })

    it('PerformanceTest_DataView_Float32_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat32(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat32',
        'getFloat32(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Float32_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat32(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat32',
        'getFloat32(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Float32_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: number, value: number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_DataView_Float32_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat32(0, 3.14159, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float32_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat32',
        'setFloat32(byteOffset: number, value: number, littleEndian: boolean): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_DataView_Float64_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat64(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat64',
        'getFloat64(byteOffset: number): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Float64_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getFloat64(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getFloat64',
        'getFloat64(byteOffset: number, littleEndian?: boolean): number', arkTsAveragedTime);
      expect(res1).assertEqual(0);
      done();
    })

    it('PerformanceTest_DataView_Float64_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat64(0, 2.71828182846);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat64',
        'setFloat64(byteOffset: number, value: number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_DataView_Float64_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setFloat64(0, 2.71828182846, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_Float64_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setFloat64',
        'setFloat64(byteOffset: number, value: number, littleEndian?: boolean): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_DataView_BigInt64_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigInt64(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigInt64',
        'getBigInt64(byteOffset: number): bigint', arkTsAveragedTime);
      expect(res1).assertEqual(0n);
      done();
    })

    it('PerformanceTest_DataView_BigInt64_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigInt64(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigInt64',
        'getBigInt64(byteOffset: number, littleEndian?: boolean): bigint', arkTsAveragedTime);
      expect(res1).assertEqual(0n);
      done();
    })

    it('PerformanceTest_DataView_BigInt64_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992n);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: number, value: bigint): void', arkTsAveragedTime);
      expect(view.getBigInt64(0)).assertEqual(9007199254740992n);
      done();
    })

    it('PerformanceTest_DataView_BigInt64_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigInt64(0, 9007199254740992n, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigInt64_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigInt64',
        'setBigInt64(byteOffset: number, value: bigint, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getBigInt64(0, true)).assertEqual(9007199254740992n);
      done();
    })

    it('PerformanceTest_DataView_BigUint64_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigUint64(0);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigUint64',
        'getBigUint64(byteOffset: number): bigint', arkTsAveragedTime);
      expect(res1).assertEqual(0n);
      done();
    })

    it('PerformanceTest_DataView_BigUint64_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let res: bigint = 0n;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = view.getBigUint64(0, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'getBigUint64',
        'getBigUint64(byteOffset: number, littleEndian?: boolean): bigint', arkTsAveragedTime);
      expect(res1).assertEqual(0n);
      done();
    })

    it('PerformanceTest_DataView_BigUint64_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: number, value: bigint): void', arkTsAveragedTime);
      expect(view.getBigUint64(0)).assertEqual(18000000000000000000n);
      done();
    })

    it('PerformanceTest_DataView_BigUint64_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n, true);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: number, value: bigint, littleEndian?: boolean): void', arkTsAveragedTime);
      expect(view.getBigUint64(0, true)).assertEqual(18000000000000000000n);
      done();
    })

    it('PerformanceTest_DataView_BigUint64_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        view.setBigUint64(0, 18000000000000000000n, false);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
	  let res1 = view;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DataView_BigUint64_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DataView', 'setBigUint64',
        'setBigUint64(byteOffset: number, value: bigint, littleEndian: boolean): void', arkTsAveragedTime);
      expect(view.getBigUint64(0)).assertEqual(18000000000000000000n);
      done();
    })

  })
}
