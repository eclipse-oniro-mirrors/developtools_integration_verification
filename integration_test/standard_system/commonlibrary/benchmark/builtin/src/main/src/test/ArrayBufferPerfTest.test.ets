/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

export default function ArrayBufferPerfTest(): void {
  describe('ArrayBufferPerfTest', () => {

    const BASE_COUNT = 50000;
    // const BASE_COUNT = 1000;
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

    it('PerformanceTest_ArrayBuffer_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayBuffer(1024);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'constructor',
      'constructor(length: int, maxByteLength?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ArrayBuffer(1024,2048);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'constructor',
      'constructor(length: number, maxByteLength?: number)', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_toString_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: String = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_toString_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'toString',
      'toString(): String', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_isView_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let u8arr: Uint8Array = new Uint8Array(10);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.isView(u8arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_isView_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'isView',
      'static isView(obj: Object): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_slice_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.slice(0, 50);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_slice_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'slice',
      'slice(begin: int, end?: int): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_getByteLength_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.getByteLength();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_getByteLength_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'getByteLength',
      'getByteLength(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_byteLength_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.byteLength;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_byteLength_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'byteLength',
      'get byteLength(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_detached_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.detached;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_detached_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'detached',
      'get detached(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_resizable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.resizable;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_resizable_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'resizable',
      'get resizable(): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_resize_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(2048, 4096);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        buf.resize(1024);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = buf;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_resize_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'resize',
        'resize(newLen: int): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_FixedArray_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: FixedArray<byte> = [65, 66, 67, 68, 69];
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_FixedArray_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
      'static from(arr: FixedArray<byte>): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_Uint8Array_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let u8arr: Uint8Array = new Uint8Array([65, 66, 67, 68, 69]);
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.from(u8arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_Uint8Array_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
      'static from(u8arr: Uint8Array): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_array_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: double[] = [1.0, 2.0, 3.0, 4.0, 5.0];
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_array_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
      'static from(array: double[]): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_string_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: ArrayBuffer = ArrayBuffer.from('Hello World', 'utf8');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.from('Hello World', 'utf8');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_string_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
        'static native from(str: string, encoding: string): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_buffer_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: ArrayBuffer = new ArrayBuffer(10);
      let res: ArrayBuffer = ArrayBuffer.from(src, 2, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
          res = ArrayBuffer.from(src, 2, 5);
        }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_buffer_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
        'static from(buffer: ArrayBuffer, byteOffset?: number, length?: number): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_bytesLength_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: int = 0;
      let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArrayBuffer.bytesLength('Hello World', 'utf8');
        }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_bytesLength_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'bytesLength',
        'static native bytesLength(text: string, encoding: string): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_stringify_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.stringify(buf, 'utf8', 0, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_stringify_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'stringify',
        'static native stringify(buffer: ArrayBuffer, encoding: string, start: int, end: int): string', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicLoadI32_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadI32(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadI32_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadI32',
        'public native atomicLoadI32(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreI32_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreI32(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreI32_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreI32',
        'public native atomicStoreI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddI32_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddI32(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddI32_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddI32',
        'public native atomicAddI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeI32_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeI32(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeI32_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeI32',
        'public native atomicCompareExchangeI32(index: int, byteOffset: int, expectedValue: int, replacementValue: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeI32_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeI32(0, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeI32_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeI32',
        'public native atomicExchangeI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubI32_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubI32(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubI32_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubI32',
        'public native atomicSubI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndI32_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndI32(0, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndI32_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndI32',
        'public native atomicAndI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrI32_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrI32(0, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrI32_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrI32',
        'public native atomicOrI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorI32_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorI32(0, 0, 0xFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorI32_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorI32',
        'public native atomicXorI32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    // ========== 实例方法测试 ==========
    it('PerformanceTest_ArrayBuffer_at_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let res: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.at(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_at_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'at',
        'at(pos: int): byte', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_set_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        buf.set(0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = buf;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_set_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'set',
        'set(pos: int, val: byte): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_from_ValueArray_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: ValueArray<byte> = new ValueArray<byte>(5, 0);
      arr[0] = 65;
      arr[1] = 66;
      arr[2] = 67;
      arr[3] = 68;
      arr[4] = 69;
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.from(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_from_ValueArray_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'from',
        'static from(arr: ValueArray<byte>): ArrayBuffer', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_fromObject_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src: ArrayBuffer = new ArrayBuffer(10);
      let res: ArrayBuffer = new ArrayBuffer(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = ArrayBuffer.fromObject(src, 0, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_fromObject_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'fromObject',
        'static fromObject(obj: Object, byteOffsetOrEncoding: int | string, length: int): ArrayBuffer', arkTsAveragedTime);
    })

    // ========== 原子操作 I8 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadI8_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadI8(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadI8_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadI8',
        'atomicLoadI8(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreI8_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreI8(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreI8_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreI8',
        'atomicStoreI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddI8_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddI8(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddI8_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddI8',
        'atomicAddI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubI8_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubI8(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubI8_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubI8',
        'atomicSubI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndI8_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndI8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndI8_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndI8',
        'atomicAndI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrI8_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrI8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrI8_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrI8',
        'atomicOrI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorI8_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorI8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorI8_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorI8',
        'atomicXorI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeI8_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeI8(0, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeI8_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeI8',
        'atomicExchangeI8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeI8_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeI8(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeI8_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeI8',
        'atomicCompareExchangeI8(index: int, byteOffset: int, expectedValue: byte, replacementValue: byte): long', arkTsAveragedTime);
    })

    // ========== 原子操作 I16 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadI16_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadI16(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadI16_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadI16',
        'atomicLoadI16(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreI16_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreI16(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreI16_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreI16',
        'atomicStoreI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddI16_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddI16(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddI16_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddI16',
        'atomicAddI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubI16_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubI16(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubI16_4600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubI16',
        'atomicSubI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndI16_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndI16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndI16_4700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndI16',
        'atomicAndI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrI16_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrI16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrI16_4800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrI16',
        'atomicOrI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorI16_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorI16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorI16_4900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorI16',
        'atomicXorI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeI16_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeI16(0, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeI16_5000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeI16',
        'atomicExchangeI16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeI16_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeI16(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeI16_5100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeI16',
        'atomicCompareExchangeI16(index: int, byteOffset: int, expectedValue: short, replacementValue: short): long', arkTsAveragedTime);
    })

    // ========== 原子操作 I64 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadI64_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadI64(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadI64_5200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadI64',
        'atomicLoadI64(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreI64_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreI64(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreI64_5300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreI64',
        'atomicStoreI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddI64_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddI64(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddI64_5400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddI64',
        'atomicAddI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubI64_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubI64(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubI64_5500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubI64',
        'atomicSubI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndI64_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndI64(0, 0, 0xFFFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndI64_5600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndI64',
        'atomicAndI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrI64_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrI64(0, 0, 0xFFFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrI64_5700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrI64',
        'atomicOrI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorI64_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorI64(0, 0, 0xFFFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorI64_5800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorI64',
        'atomicXorI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeI64_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeI64(0, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeI64_5900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeI64',
        'atomicExchangeI64(index: int, byteOffset: int, value: long): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeI64_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeI64(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeI64_6000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeI64',
        'atomicCompareExchangeI64(index: int, byteOffset: int, expectedValue: long, replacementValue: long): long', arkTsAveragedTime);
    })

    // ========== 原子操作 U8 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadU8_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadU8(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadU8_6100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadU8',
        'atomicLoadU8(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreU8_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreU8(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreU8_6200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreU8',
        'atomicStoreU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddU8_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddU8(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddU8_6300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddU8',
        'atomicAddU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubU8_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubU8(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubU8_6400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubU8',
        'atomicSubU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndU8_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndU8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndU8_6500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndU8',
        'atomicAndU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrU8_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrU8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrU8_6600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrU8',
        'atomicOrU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorU8_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorU8(0, 0, 127);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorU8_6700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorU8',
        'atomicXorU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeU8_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeU8(0, 0, 99);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeU8_6800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeU8',
        'atomicExchangeU8(index: int, byteOffset: int, value: byte): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeU8_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeU8(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeU8_6900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeU8',
        'atomicCompareExchangeU8(index: int, byteOffset: int, expectedValue: byte, replacementValue: byte): long', arkTsAveragedTime);
    })

    // ========== 原子操作 U16 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadU16_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadU16(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadU16_7000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadU16',
        'atomicLoadU16(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreU16_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreU16(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreU16_7100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreU16',
        'atomicStoreU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddU16_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddU16(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddU16_7200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddU16',
        'atomicAddU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubU16_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubU16(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubU16_7300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubU16',
        'atomicSubU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndU16_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndU16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndU16_7400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndU16',
        'atomicAndU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrU16_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrU16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrU16_7500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrU16',
        'atomicOrU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorU16_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorU16(0, 0, 255);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorU16_7600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorU16',
        'atomicXorU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeU16_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeU16(0, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeU16_7700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeU16',
        'atomicExchangeU16(index: int, byteOffset: int, value: short): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeU16_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeU16(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeU16_7800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeU16',
        'atomicCompareExchangeU16(index: int, byteOffset: int, expectedValue: short, replacementValue: short): long', arkTsAveragedTime);
    })

    // ========== 原子操作 U32 ==========
    it('PerformanceTest_ArrayBuffer_atomicLoadU32_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicLoadU32(0, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicLoadU32_7900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicLoadU32',
        'atomicLoadU32(index: int, byteOffset: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicStoreU32_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicStoreU32(0, 0, 42);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicStoreU32_8000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicStoreU32',
        'atomicStoreU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAddU32_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAddU32(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAddU32_8100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAddU32',
        'atomicAddU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicSubU32_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicSubU32(0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicSubU32_8200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicSubU32',
        'atomicSubU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicAndU32_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicAndU32(0, 0, 0x7FFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicAndU32_8300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicAndU32',
        'atomicAndU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicOrU32_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicOrU32(0, 0, 0x7FFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicOrU32_8400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicOrU32',
        'atomicOrU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicXorU32_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicXorU32(0, 0, 0x7FFFFFFF);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicXorU32_8500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicXorU32',
        'atomicXorU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicExchangeU32_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicExchangeU32(0, 0, 999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicExchangeU32_8600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicExchangeU32',
        'atomicExchangeU32(index: int, byteOffset: int, value: int): long', arkTsAveragedTime);
    })

    it('PerformanceTest_ArrayBuffer_atomicCompareExchangeU32_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf: ArrayBuffer = new ArrayBuffer(128);
      let res: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.atomicCompareExchangeU32(0, 0, 0, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayBuffer_atomicCompareExchangeU32_8700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayBuffer', 'atomicCompareExchangeU32',
        'atomicCompareExchangeU32(index: int, byteOffset: int, expectedValue: int, replacementValue: int): long', arkTsAveragedTime);
    })

  })
}
