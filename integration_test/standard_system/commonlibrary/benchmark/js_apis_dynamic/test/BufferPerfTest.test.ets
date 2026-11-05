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
import { buffer } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function BufferPerfTest(): void {
  describe('BufferPerfTest', () => {
    // Buffer operations allocate memory per iteration; 500 avoids OOM on batch pre-create
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== buffer.alloc ====================

    it('PerformanceTest_buffer_Alloc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.alloc(5);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.alloc(5);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
          'alloc(size: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_Alloc_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.alloc(5, 1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.alloc(5, 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
          'alloc(size: number, fill: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_Alloc_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.alloc(5, 'a', 'utf8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.alloc(5, 'a', 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
          'alloc(size: number, fill: string, encoding: BufferEncoding): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.allocUninitializedFromPool ====================

    it('PerformanceTest_buffer_AllocUninitializedFromPool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.allocUninitializedFromPool(10);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.allocUninitializedFromPool(10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_AllocUninitializedFromPool_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'allocUninitializedFromPool',
          'allocUninitializedFromPool(size: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.allocUninitialized ====================

    it('PerformanceTest_buffer_AllocUninitialized_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.allocUninitialized(10);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.allocUninitialized(10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_AllocUninitialized_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'allocUninitialized',
          'allocUninitialized(size: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.byteLength ====================

    it('PerformanceTest_buffer_ByteLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let str = 'abcdef';
        let res: number = buffer.byteLength(str, 'utf8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.byteLength(str, 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_ByteLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'byteLength',
          'byteLength(doc: string | Buffer | TypedArray | DataView | ArrayBuffer, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.compare ====================

    it('PerformanceTest_buffer_Compare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: buffer.Buffer = buffer.from('1234');
        let buf2: buffer.Buffer = buffer.from('0123');
        let res: number = buffer.compare(buf1, buf2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.compare(buf1, buf2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Compare_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'compare',
          'compare(buf1: Buffer | Uint8Array, buf2: Buffer | Uint8Array): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.concat ====================

    it('PerformanceTest_buffer_Concat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: buffer.Buffer = buffer.from('1234');
        let buf2: buffer.Buffer = buffer.from('abcd');
        let list: buffer.Buffer[] = [buf1, buf2];
        let res: buffer.Buffer = buffer.concat(list);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.concat(list);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Concat_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'concat',
          'concat(list: Buffer[] | Uint8Array[], totalLength?: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.from ====================

    it('PerformanceTest_buffer_From_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x62, 0x75, 0x66, 0x66, 0x65, 0x72];
        let res: buffer.Buffer = buffer.from(arr);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
          'from(array: number[]): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_From_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let ab = new ArrayBuffer(10);
        let res: buffer.Buffer = buffer.from(ab, 0, 2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.from(ab, 0, 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
          'from(arrayBuffer: ArrayBuffer, byteOffset?: number, length?: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_From_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: buffer.Buffer = buffer.from('buffer');
        let res: buffer.Buffer = buffer.from(buf1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.from(buf1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
          'from(buffer: Buffer | Uint8Array): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_From_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let s = 'this is a test';
        let res: buffer.Buffer = buffer.from(s, 'utf8', 14);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.from(s, 'utf8', 14);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
          'from(object: Object, offsetOrEncoding: number | string, length: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_buffer_From_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: buffer.Buffer = buffer.from('this is a test');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.from('this is a test');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
          'from(string: String, encoding?: BufferEncoding): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.isBuffer ====================

    it('PerformanceTest_buffer_IsBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.alloc(10);
        let res: boolean = buffer.isBuffer(buf);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.isBuffer(buf);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_IsBuffer_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'isBuffer',
          'isBuffer(obj: Object): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.isEncoding ====================

    it('PerformanceTest_buffer_IsEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = buffer.isEncoding('utf-8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.isEncoding('utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_IsEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'isEncoding',
          'isEncoding(encoding: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== buffer.transcode ====================

    it('PerformanceTest_buffer_Transcode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: buffer.Buffer = buffer.from('€');
        let res: buffer.Buffer = buffer.transcode(src, 'utf-8', 'ascii');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buffer.transcode(src, 'utf-8', 'ascii');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Transcode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'transcode',
          'transcode(source: Buffer | Uint8Array, fromEnc: string, toEnc: string): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.compare ====================

    it('PerformanceTest_Buffer_Compare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr1: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        let arr2: number[] = [5, 6, 7, 8, 9, 1, 2, 3, 4];
        let buf1: buffer.Buffer = buffer.from(arr1);
        let buf2: buffer.Buffer = buffer.from(arr2);
        let res: number = buf1.compare(buf2, 5, 9, 0, 4);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf1.compare(buf2, 5, 9, 0, 4);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Compare_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'compare',
          'compare(target: Buffer | Uint8Array, targetStart?: number, targetEnd?: number, sourceStart?: number, sourceEnd?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.copy ====================

    it('PerformanceTest_Buffer_Copy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: buffer.Buffer = buffer.allocUninitializedFromPool(26);
        let buf2: buffer.Buffer = buffer.allocUninitializedFromPool(26);
        let res: number = buf1.copy(buf2, 8, 16, 20);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf1.copy(buf2, 8, 16, 20);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Copy_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'copy',
          'copy(target: Buffer | Uint8Array, targetStart?: number, sourceStart?: number, sourceEnd?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.entries ====================

    it('PerformanceTest_Buffer_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('buffer');
        let res = buf.entries();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Entries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'entries',
          'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.equals ====================

    it('PerformanceTest_Buffer_Equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf1: buffer.Buffer = buffer.from('ABC');
        let buf2: buffer.Buffer = buffer.from('414243', 'hex');
        let res: boolean = buf1.equals(buf2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf1.equals(buf2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Equals_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'equals',
          'equals(otherBuffer: Uint8Array | Buffer): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.fill ====================

    it('PerformanceTest_Buffer_Fill_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(50));
        }
        let res: buffer.Buffer = bufs[0].fill(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].fill(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Fill_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'fill',
          'fill(value: number, offset?: number, end?: number, encoding?: BufferEncoding): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.includes ====================

    it('PerformanceTest_Buffer_Includes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('this is a buffer');
        let res: boolean = buf.includes('this');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.includes('this');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Includes_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'includes',
          'includes(value: string | number | Buffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.indexOf ====================

    it('PerformanceTest_Buffer_IndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('this is a buffer');
        let res: number = buf.indexOf('this');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.indexOf('this');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_IndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'indexOf',
          'indexOf(value: string | number | Buffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.keys ====================

    it('PerformanceTest_Buffer_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('buffer');
        let res = buf.keys();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Keys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'keys',
          'keys(): IterableIterator<number>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.lastIndexOf ====================

    it('PerformanceTest_Buffer_LastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('this buffer is a buffer');
        let res: number = buf.lastIndexOf('buffer');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.lastIndexOf('buffer');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_LastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'lastIndexOf',
          'lastIndexOf(value: string | number | Buffer | Uint8Array, byteOffset?: number, encoding?: BufferEncoding): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readBigInt64BE ====================

    it('PerformanceTest_Buffer_ReadBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: bigint = buf.readBigInt64BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigInt64BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigInt64BE',
          'readBigInt64BE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readBigInt64LE ====================

    it('PerformanceTest_Buffer_ReadBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: bigint = buf.readBigInt64LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigInt64LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigInt64LE',
          'readBigInt64LE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readBigUInt64BE ====================

    it('PerformanceTest_Buffer_ReadBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: bigint = buf.readBigUInt64BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigUInt64BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigUInt64BE',
          'readBigUInt64BE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readBigUInt64LE ====================

    it('PerformanceTest_Buffer_ReadBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: bigint = buf.readBigUInt64LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readBigUInt64LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigUInt64LE',
          'readBigUInt64LE(offset?: number): bigint', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readDoubleBE ====================

    it('PerformanceTest_Buffer_ReadDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readDoubleBE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readDoubleBE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readDoubleBE',
          'readDoubleBE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readDoubleLE ====================

    it('PerformanceTest_Buffer_ReadDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readDoubleLE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readDoubleLE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readDoubleLE',
          'readDoubleLE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readFloatBE ====================

    it('PerformanceTest_Buffer_ReadFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res = buf.readFloatBE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readFloatBE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadFloatBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readFloatBE',
          'readFloatBE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readFloatLE ====================

    it('PerformanceTest_Buffer_ReadFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res = buf.readFloatLE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readFloatLE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadFloatLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readFloatLE',
          'readFloatLE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readInt8 ====================

    it('PerformanceTest_Buffer_ReadInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readInt8(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt8(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt8',
          'readInt8(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readInt16BE ====================

    it('PerformanceTest_Buffer_ReadInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readInt16BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt16BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt16BE',
          'readInt16BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readInt16LE ====================

    it('PerformanceTest_Buffer_ReadInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readInt16LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt16LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt16LE',
          'readInt16LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readInt32BE ====================

    it('PerformanceTest_Buffer_ReadInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readInt32BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt32BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt32BE',
          'readInt32BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readInt32LE ====================

    it('PerformanceTest_Buffer_ReadInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readInt32LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readInt32LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt32LE',
          'readInt32LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readIntBE ====================

    it('PerformanceTest_Buffer_ReadIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readIntBE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readIntBE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readIntBE',
          'readIntBE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readIntLE ====================

    it('PerformanceTest_Buffer_ReadIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readIntLE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readIntLE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readIntLE',
          'readIntLE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUInt8 ====================

    it('PerformanceTest_Buffer_ReadUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUInt8(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt8(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt8',
          'readUInt8(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUInt16BE ====================

    it('PerformanceTest_Buffer_ReadUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUInt16BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt16BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt16BE',
          'readUInt16BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUInt16LE ====================

    it('PerformanceTest_Buffer_ReadUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUInt16LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt16LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt16LE',
          'readUInt16LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUInt32BE ====================

    it('PerformanceTest_Buffer_ReadUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUInt32BE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt32BE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt32BE',
          'readUInt32BE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUInt32LE ====================

    it('PerformanceTest_Buffer_ReadUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUInt32LE(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUInt32LE(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt32LE',
          'readUInt32LE(offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUIntBE ====================

    it('PerformanceTest_Buffer_ReadUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUIntBE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUIntBE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUIntBE',
          'readUIntBE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.readUIntLE ====================

    it('PerformanceTest_Buffer_ReadUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [1, 2, 3, 4, 5, 6];
        let buf: buffer.Buffer = buffer.from(arr);
        let res: number = buf.readUIntLE(0, 6);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.readUIntLE(0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUIntLE',
          'readUIntLE(offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.subarray ====================

    it('PerformanceTest_Buffer_Subarray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.allocUninitializedFromPool(26);
        let res: buffer.Buffer = buf.subarray(0, 3);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.subarray(0, 3);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Subarray_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'subarray',
          'subarray(start?: number, end?: number): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.swap16 ====================

    it('PerformanceTest_Buffer_Swap16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.from(arr));
        }
        let res: buffer.Buffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap16();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap16_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap16',
          'swap16(): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.swap32 ====================

    it('PerformanceTest_Buffer_Swap32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.from(arr));
        }
        let res: buffer.Buffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap32();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap32_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap32',
          'swap32(): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.swap64 ====================

    it('PerformanceTest_Buffer_Swap64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.from(arr));
        }
        let res: buffer.Buffer = bufs[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].swap64();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap64_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap64',
          'swap64(): Buffer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.toJSON ====================

    it('PerformanceTest_Buffer_ToJSON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: number[] = [0x1, 0x2, 0x3, 0x4, 0x5];
        let buf: buffer.Buffer = buffer.from(arr);
        let res = buf.toJSON();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.toJSON();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ToJSON_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'toJSON',
          'toJSON(): jsonx.JsonElement', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.toString ====================

    it('PerformanceTest_Buffer_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('abcdef');
        let res: string = buf.toString('utf8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.toString('utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'toString',
          'toString(encoding?: BufferEncoding, start?: number, end?: number): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.values ====================

    it('PerformanceTest_Buffer_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.from('buffer');
        let res = buf.values();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Values_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'values',
          'values(): IterableIterator<number>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.write ====================

    it('PerformanceTest_Buffer_Write_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.alloc(256));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Write_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'write',
          'write(str: string, offset?: number, length?: number, encoding?: string): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeBigInt64BE ====================

    it('PerformanceTest_Buffer_WriteBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigInt64BE',
          'writeBigInt64BE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeBigInt64LE ====================

    it('PerformanceTest_Buffer_WriteBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigInt64LE',
          'writeBigInt64LE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeBigUInt64BE ====================

    it('PerformanceTest_Buffer_WriteBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigUInt64BE',
          'writeBigUInt64BE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeBigUInt64LE ====================

    it('PerformanceTest_Buffer_WriteBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let v: bigint = BigInt(0x0102030405060708);
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigUInt64LE',
          'writeBigUInt64LE(value: bigint, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeDoubleBE ====================

    it('PerformanceTest_Buffer_WriteDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeDoubleBE',
          'writeDoubleBE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeDoubleLE ====================

    it('PerformanceTest_Buffer_WriteDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(8));
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
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeDoubleLE',
          'writeDoubleLE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeFloatBE ====================

    it('PerformanceTest_Buffer_WriteFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeFloatBE(0.5, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteFloatBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeFloatBE',
          'writeFloatBE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeFloatLE ====================

    it('PerformanceTest_Buffer_WriteFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeFloatLE(0.5, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteFloatLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeFloatLE',
          'writeFloatLE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeInt8 ====================

    it('PerformanceTest_Buffer_WriteInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt8(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt8',
          'writeInt8(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeInt16BE ====================

    it('PerformanceTest_Buffer_WriteInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt16BE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt16BE',
          'writeInt16BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeInt16LE ====================

    it('PerformanceTest_Buffer_WriteInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt16LE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt16LE',
          'writeInt16LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeInt32BE ====================

    it('PerformanceTest_Buffer_WriteInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt32BE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt32BE',
          'writeInt32BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeInt32LE ====================

    it('PerformanceTest_Buffer_WriteInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeInt32LE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt32LE',
          'writeInt32LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeIntBE ====================

    it('PerformanceTest_Buffer_WriteIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeIntBE(1, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeIntBE',
          'writeIntBE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeIntLE ====================

    it('PerformanceTest_Buffer_WriteIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeIntLE(1, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeIntLE',
          'writeIntLE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUInt8 ====================

    it('PerformanceTest_Buffer_WriteUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt8(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt8_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt8',
          'writeUInt8(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUInt16BE ====================

    it('PerformanceTest_Buffer_WriteUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt16BE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt16BE',
          'writeUInt16BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUInt16LE ====================

    it('PerformanceTest_Buffer_WriteUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt16LE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt16LE',
          'writeUInt16LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUInt32BE ====================

    it('PerformanceTest_Buffer_WriteUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt32BE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt32BE',
          'writeUInt32BE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUInt32LE ====================

    it('PerformanceTest_Buffer_WriteUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(4));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUInt32LE(1, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt32LE',
          'writeUInt32LE(value: number, offset?: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUIntBE ====================

    it('PerformanceTest_Buffer_WriteUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUIntBE(1, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUIntBE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUIntBE',
          'writeUIntBE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.writeUIntLE ====================

    it('PerformanceTest_Buffer_WriteUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let bufs: buffer.Buffer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          bufs.push(buffer.allocUninitializedFromPool(6));
        }
        let res: number = 0;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bufs[i].writeUIntLE(1, 0, 6);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUIntLE_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUIntLE',
          'writeUIntLE(value: number, offset: number, byteLength: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Buffer.[index] ====================

    it('PerformanceTest_Buffer_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let buf: buffer.Buffer = buffer.alloc(4);
        buf[1] = 100;
        let res: number = buf[1];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = buf[1];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', '[index]',
          '[index: number]: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Blob.constructor ====================

    it('PerformanceTest_Blob_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: string[] = ['a', 'b', 'c'];
        let res: buffer.Blob = new buffer.Blob(src);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new buffer.Blob(src);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'constructor',
          'constructor(sources: ArrayUnionType, options?: BlobOptions)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Blob.arrayBuffer ====================
    // Note: measures synchronous Promise creation, not async conversion

    it('PerformanceTest_Blob_ArrayBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: string[] = ['a', 'b', 'c'];
        let blob: buffer.Blob = new buffer.Blob(src);
        let res = blob.arrayBuffer();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = blob.arrayBuffer();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_ArrayBuffer_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'arrayBuffer',
          'arrayBuffer(): Promise<ArrayBuffer>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Blob.slice ====================

    it('PerformanceTest_Blob_Slice_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: string[] = ['a', 'b', 'c'];
        let blob: buffer.Blob = new buffer.Blob(src);
        let res: buffer.Blob = blob.slice(0, 2);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = blob.slice(0, 2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Slice_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'slice',
          'slice(start?: number, end?: number, type?: string): Blob', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== Blob.text ====================
    // Note: measures synchronous Promise creation, not async conversion

    it('PerformanceTest_Blob_Text_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let src: string[] = ['a', 'b', 'c'];
        let blob: buffer.Blob = new buffer.Blob(src);
        let res = blob.text();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = blob.text();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Text_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'text',
          'text(): Promise<string>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
