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
  describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach
} from "@ohos/hypium";
import { fastbuffer } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function FastBufferPerfTest(): void {
  describe('FastBufferPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== fastbuffer.alloc ====================

    it('PerformanceTest_FastBuffer_Alloc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: fastbuffer.FastBuffer = fastbuffer.alloc(16);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.alloc(16);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Alloc_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'alloc',
          'alloc(size: number, fill?: string | FastBuffer | number, encoding?: BufferEncoding): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.allocUninitializedFromPool ====================

    it('PerformanceTest_FastBuffer_AllocUninitializedFromPool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: fastbuffer.FastBuffer = fastbuffer.allocUninitializedFromPool(16);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.allocUninitializedFromPool(16);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_AllocUninitializedFromPool_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'allocUninitializedFromPool',
          'allocUninitializedFromPool(size: number): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.allocUninitialized ====================

    it('PerformanceTest_FastBuffer_AllocUninitialized_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: fastbuffer.FastBuffer = fastbuffer.allocUninitialized(16);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.allocUninitialized(16);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_AllocUninitialized_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'allocUninitialized',
          'allocUninitialized(size: number): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.byteLength ====================

    it('PerformanceTest_FastBuffer_ByteLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let str: string = '½ + ¼ = ¾';
        let res: number = fastbuffer.byteLength(str, 'utf-8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.byteLength(str, 'utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ByteLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'byteLength',
          'byteLength(value: string | FastBuffer | TypedArray | DataView | ArrayBuffer | SharedArrayBuffer, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.compare (static) ====================

    it('PerformanceTest_FastBuffer_StaticCompare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: fastbuffer.FastBuffer = fastbuffer.from('1234');
        let buf2: fastbuffer.FastBuffer = fastbuffer.from('0123');
        let res: number = fastbuffer.compare(buf1, buf2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.compare(buf1, buf2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_StaticCompare_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'compare',
          'compare(buf1: FastBuffer | Uint8Array, buf2: FastBuffer | Uint8Array): -1 | 0 | 1', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.concat ====================

    it('PerformanceTest_FastBuffer_Concat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: fastbuffer.FastBuffer = fastbuffer.from('1234');
        let buf2: fastbuffer.FastBuffer = fastbuffer.from('abcd');
        let list: fastbuffer.FastBuffer[] = [buf1, buf2];
        let res: fastbuffer.FastBuffer = fastbuffer.concat(list);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.concat(list);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Concat_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'concat',
          'concat(list: FastBuffer[] | Uint8Array[], totalLength?: number): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.from (4 overloads) ====================

    // from(array: number[]): FastBuffer
    it('PerformanceTest_FastBuffer_From_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x62, 0x75, 0x66, 0x66, 0x65, 0x72];
        let res: fastbuffer.FastBuffer = fastbuffer.from(arr);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_From_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'from',
          'from(array: number[]): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // from(arrayBuffer: ArrayBuffer | SharedArrayBuffer, byteOffset?: number, length?: number): FastBuffer
    it('PerformanceTest_FastBuffer_From_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let res: fastbuffer.FastBuffer = fastbuffer.from(ab, 0, 8);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.from(ab, 0, 8);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_From_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'from',
          'from(arrayBuffer: ArrayBuffer | SharedArrayBuffer, byteOffset?: number, length?: number): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // from(buffer: FastBuffer | Uint8Array): FastBuffer
    it('PerformanceTest_FastBuffer_From_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcBuf: fastbuffer.FastBuffer = fastbuffer.from('buffer');
        let res: fastbuffer.FastBuffer = fastbuffer.from(srcBuf);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.from(srcBuf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_From_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'from',
          'from(buffer: FastBuffer | Uint8Array): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // from(value: string, encoding?: BufferEncoding): FastBuffer
    it('PerformanceTest_FastBuffer_From_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: fastbuffer.FastBuffer = fastbuffer.from('this is a test');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.from('this is a test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_From_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'from',
          'from(value: string, encoding?: BufferEncoding): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.isBuffer ====================

    it('PerformanceTest_FastBuffer_IsBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.alloc(16);
        let res: boolean = fastbuffer.isBuffer(buf);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.isBuffer(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_IsBuffer_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'isBuffer',
          'isBuffer(obj: Object): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.isEncoding ====================

    it('PerformanceTest_FastBuffer_IsEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = fastbuffer.isEncoding('utf-8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.isEncoding('utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_IsEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'isEncoding',
          'isEncoding(encoding: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== fastbuffer.transcode ====================

    it('PerformanceTest_FastBuffer_Transcode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: fastbuffer.FastBuffer = fastbuffer.from('buffer');
        let res: fastbuffer.FastBuffer = fastbuffer.transcode(src, 'utf-8', 'ascii');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = fastbuffer.transcode(src, 'utf-8', 'ascii');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Transcode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'fastbuffer', 'transcode',
          'transcode(source: FastBuffer | Uint8Array, fromEnc: string, toEnc: string): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.compare (instance) ====================

    it('PerformanceTest_FastBuffer_Compare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: fastbuffer.FastBuffer = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2: fastbuffer.FastBuffer = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res: number = buf1.compare(buf2, 5, 9, 0, 4);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf1.compare(buf2, 5, 9, 0, 4);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Compare_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'compare',
          'compare(target: FastBuffer | Uint8Array, targetStart?: number, targetEnd?: number, sourceStart?: number, sourceEnd?: number): -1 | 0 | 1', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.copy ====================

    it('PerformanceTest_FastBuffer_Copy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let copies: fastbuffer.FastBuffer[][] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          copies.push([fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]), fastbuffer.alloc(16)]);
        }
        let res: number = copies[0][0].copy(copies[0][1], 0, 0, 8);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = copies[i][0].copy(copies[i][1], 0, 0, 8);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Copy_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'copy',
          'copy(target: FastBuffer | Uint8Array, targetStart?: number, sourceStart?: number, sourceEnd?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.entries ====================

    it('PerformanceTest_FastBuffer_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('buffer');
        let res = buf.entries();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Entries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'entries',
          'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.equals ====================

    it('PerformanceTest_FastBuffer_Equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: fastbuffer.FastBuffer = fastbuffer.from('ABC');
        let buf2: fastbuffer.FastBuffer = fastbuffer.from('414243', 'hex');
        let res: boolean = buf1.equals(buf2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf1.equals(buf2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Equals_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'equals',
          'equals(otherBuffer: Uint8Array | FastBuffer): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.fill ====================

    it('PerformanceTest_FastBuffer_Fill_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(50));
        }
        let res: fastbuffer.FastBuffer = bufs[0].fill(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].fill(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Fill_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'fill',
          'fill(value: string | FastBuffer | Uint8Array | number, offset?: number, end?: number, encoding?: BufferEncoding): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.includes ====================

    it('PerformanceTest_FastBuffer_Includes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('this is a buffer');
        let res: boolean = buf.includes('this');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.includes('this');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Includes_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'includes',
          'includes(value: string | number | FastBuffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.indexOf ====================

    it('PerformanceTest_FastBuffer_IndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('this is a buffer');
        let res: number = buf.indexOf('this');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.indexOf('this');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_IndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'indexOf',
          'indexOf(value: string | number | FastBuffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.keys ====================

    it('PerformanceTest_FastBuffer_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('buffer');
        let res = buf.keys();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Keys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'keys',
          'keys(): IterableIterator<number>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.values ====================

    it('PerformanceTest_FastBuffer_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('buffer');
        let res = buf.values();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Values_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'values',
          'values(): IterableIterator<number>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.lastIndexOf ====================

    it('PerformanceTest_FastBuffer_LastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('this buffer is a buffer');
        let res: number = buf.lastIndexOf('buffer');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.lastIndexOf('buffer');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_LastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'lastIndexOf',
          'lastIndexOf(value: string | number | FastBuffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readBigInt64BE ====================

    it('PerformanceTest_FastBuffer_ReadBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70]);
        let res: bigint = buf.readBigInt64BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigInt64BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readBigInt64BE',
          'readBigInt64BE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readBigInt64LE ====================

    it('PerformanceTest_FastBuffer_ReadBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70]);
        let res: bigint = buf.readBigInt64LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigInt64LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readBigInt64LE',
          'readBigInt64LE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readBigUInt64BE ====================

    it('PerformanceTest_FastBuffer_ReadBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70]);
        let res: bigint = buf.readBigUInt64BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigUInt64BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readBigUInt64BE',
          'readBigUInt64BE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readBigUInt64LE ====================

    it('PerformanceTest_FastBuffer_ReadBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70]);
        let res: bigint = buf.readBigUInt64LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigUInt64LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readBigUInt64LE',
          'readBigUInt64LE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readDoubleBE ====================

    it('PerformanceTest_FastBuffer_ReadDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let res: number = buf.readDoubleBE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readDoubleBE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readDoubleBE',
          'readDoubleBE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readDoubleLE ====================

    it('PerformanceTest_FastBuffer_ReadDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let res: number = buf.readDoubleLE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readDoubleLE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readDoubleLE',
          'readDoubleLE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readFloatBE ====================

    it('PerformanceTest_FastBuffer_ReadFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let res: number = buf.readFloatBE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readFloatBE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadFloatBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readFloatBE',
          'readFloatBE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readFloatLE ====================

    it('PerformanceTest_FastBuffer_ReadFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let res: number = buf.readFloatLE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readFloatLE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadFloatLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readFloatLE',
          'readFloatLE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readInt8 ====================

    it('PerformanceTest_FastBuffer_ReadInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([-1, 5]);
        let res: number = buf.readInt8(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt8(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readInt8',
          'readInt8(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readInt16BE ====================

    it('PerformanceTest_FastBuffer_ReadInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0, 5]);
        let res: number = buf.readInt16BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt16BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readInt16BE',
          'readInt16BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readInt16LE ====================

    it('PerformanceTest_FastBuffer_ReadInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0, 5]);
        let res: number = buf.readInt16LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt16LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readInt16LE',
          'readInt16LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readInt32BE ====================

    it('PerformanceTest_FastBuffer_ReadInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0, 0, 0, 5]);
        let res: number = buf.readInt32BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt32BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readInt32BE',
          'readInt32BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readInt32LE ====================

    it('PerformanceTest_FastBuffer_ReadInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0, 0, 0, 5]);
        let res: number = buf.readInt32LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt32LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readInt32LE',
          'readInt32LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readIntBE ====================

    it('PerformanceTest_FastBuffer_ReadIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let res: number = buf.readIntBE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readIntBE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readIntBE',
          'readIntBE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readIntLE ====================

    it('PerformanceTest_FastBuffer_ReadIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let res: number = buf.readIntLE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readIntLE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readIntLE',
          'readIntLE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUInt8 ====================

    it('PerformanceTest_FastBuffer_ReadUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([1, 254]);
        let res: number = buf.readUInt8(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt8(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUInt8',
          'readUInt8(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUInt16BE ====================

    it('PerformanceTest_FastBuffer_ReadUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56]);
        let res: number = buf.readUInt16BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt16BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUInt16BE',
          'readUInt16BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUInt16LE ====================

    it('PerformanceTest_FastBuffer_ReadUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56]);
        let res: number = buf.readUInt16LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt16LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUInt16LE',
          'readUInt16LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUInt32BE ====================

    it('PerformanceTest_FastBuffer_ReadUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78]);
        let res: number = buf.readUInt32BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt32BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUInt32BE',
          'readUInt32BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUInt32LE ====================

    it('PerformanceTest_FastBuffer_ReadUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78]);
        let res: number = buf.readUInt32LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt32LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUInt32LE',
          'readUInt32LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUIntBE ====================

    it('PerformanceTest_FastBuffer_ReadUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let res: number = buf.readUIntBE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUIntBE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUIntBE',
          'readUIntBE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.readUIntLE ====================

    it('PerformanceTest_FastBuffer_ReadUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let res: number = buf.readUIntLE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUIntLE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ReadUIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'readUIntLE',
          'readUIntLE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.subarray ====================

    it('PerformanceTest_FastBuffer_Subarray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('abcdefghijklmnopqrstuvwxyz');
        let res: fastbuffer.FastBuffer = buf.subarray(0, 3);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.subarray(0, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Subarray_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'subarray',
          'subarray(start?: number, end?: number): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.swap16 ====================

    it('PerformanceTest_FastBuffer_Swap16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.from(arr));
        }
        let res: fastbuffer.FastBuffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap16();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Swap16_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'swap16',
          'swap16(): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.swap32 ====================

    it('PerformanceTest_FastBuffer_Swap32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.from(arr));
        }
        let res: fastbuffer.FastBuffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap32();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Swap32_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'swap32',
          'swap32(): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.swap64 ====================

    it('PerformanceTest_FastBuffer_Swap64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.from(arr));
        }
        let res: fastbuffer.FastBuffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap64();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Swap64_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'swap64',
          'swap64(): FastBuffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.toJSON ====================

    it('PerformanceTest_FastBuffer_ToJSON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from([0x1, 0x2, 0x3, 0x4, 0x5]);
        let res: Object = buf.toJSON();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.toJSON();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ToJSON_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'toJSON',
          'toJSON(): Object', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.toString ====================

    it('PerformanceTest_FastBuffer_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: fastbuffer.FastBuffer = fastbuffer.from('abcdefghijklmnopqrstuvwxyz');
        let res: string = buf.toString('utf-8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.toString('utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_ToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'toString',
          'toString(encoding?: string, start?: number, end?: number): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.write ====================

    it('PerformanceTest_FastBuffer_Write_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.alloc(256));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].write('abcdef', 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_Write_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'write',
          'write(str: string, offset?: number, length?: number, encoding?: string): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeBigInt64BE ====================

    it('PerformanceTest_FastBuffer_WriteBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeBigInt64BE(v, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeBigInt64BE',
          'writeBigInt64BE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeBigInt64LE ====================

    it('PerformanceTest_FastBuffer_WriteBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeBigInt64LE(v, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeBigInt64LE',
          'writeBigInt64LE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeBigUInt64BE ====================

    it('PerformanceTest_FastBuffer_WriteBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeBigUInt64BE(v, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeBigUInt64BE',
          'writeBigUInt64BE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeBigUInt64LE ====================

    it('PerformanceTest_FastBuffer_WriteBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeBigUInt64LE(v, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeBigUInt64LE',
          'writeBigUInt64LE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeDoubleBE ====================

    it('PerformanceTest_FastBuffer_WriteDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeDoubleBE(123.456, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeDoubleBE',
          'writeDoubleBE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeDoubleLE ====================

    it('PerformanceTest_FastBuffer_WriteDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeDoubleLE(123.456, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeDoubleLE',
          'writeDoubleLE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeFloatBE ====================

    it('PerformanceTest_FastBuffer_WriteFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeFloatBE(0xcafebabe, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteFloatBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeFloatBE',
          'writeFloatBE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeFloatLE ====================

    it('PerformanceTest_FastBuffer_WriteFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(8));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeFloatLE(0xcafebabe, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteFloatLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeFloatLE',
          'writeFloatLE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeInt8 ====================

    it('PerformanceTest_FastBuffer_WriteInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(2));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt8(2, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeInt8',
          'writeInt8(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeInt16BE ====================

    it('PerformanceTest_FastBuffer_WriteInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(2));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt16BE(0x0102, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeInt16BE',
          'writeInt16BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeInt16LE ====================

    it('PerformanceTest_FastBuffer_WriteInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(2));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt16LE(0x0304, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeInt16LE',
          'writeInt16LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeInt32BE ====================

    it('PerformanceTest_FastBuffer_WriteInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt32BE(0x01020304, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeInt32BE',
          'writeInt32BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeInt32LE ====================

    it('PerformanceTest_FastBuffer_WriteInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt32LE(0x05060708, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeInt32LE',
          'writeInt32LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeIntBE ====================

    it('PerformanceTest_FastBuffer_WriteIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeIntBE(0x1234567890ab, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeIntBE',
          'writeIntBE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeIntLE ====================

    it('PerformanceTest_FastBuffer_WriteIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeIntLE(0x1234567890ab, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeIntLE',
          'writeIntLE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUInt8 ====================

    it('PerformanceTest_FastBuffer_WriteUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt8(0x42, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUInt8',
          'writeUInt8(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUInt16BE ====================

    it('PerformanceTest_FastBuffer_WriteUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt16BE(0xdead, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUInt16BE',
          'writeUInt16BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUInt16LE ====================

    it('PerformanceTest_FastBuffer_WriteUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt16LE(0xdead, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUInt16LE',
          'writeUInt16LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUInt32BE ====================

    it('PerformanceTest_FastBuffer_WriteUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt32BE(0xfeedface, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUInt32BE',
          'writeUInt32BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUInt32LE ====================

    it('PerformanceTest_FastBuffer_WriteUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt32LE(0xfeedface, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUInt32LE',
          'writeUInt32LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUIntBE ====================

    it('PerformanceTest_FastBuffer_WriteUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUIntBE(0x1234567890ab, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUIntBE',
          'writeUIntBE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== FastBuffer.writeUIntLE ====================

    it('PerformanceTest_FastBuffer_WriteUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: fastbuffer.FastBuffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(fastbuffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUIntLE(0x1234567890ab, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FastBuffer_WriteUIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'FastBuffer', 'writeUIntLE',
          'writeUIntLE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
