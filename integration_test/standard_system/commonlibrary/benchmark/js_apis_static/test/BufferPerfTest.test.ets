'use static'
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
} from "../../../hypium/index";
import { buffer } from '@kit.ArkTS';
import performance from './Performance.util';

export default function BufferPerfTest(): void {
  describe('BufferPerfTest', (): void => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== buffer.alloc ====================

    it('PerformanceTest_buffer_Alloc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.alloc(5);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.alloc(5);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
        'alloc(size: int): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_Alloc_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.alloc(5, 1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.alloc(5, 1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
        'alloc(size: int, fill: int): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_Alloc_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.alloc(5, 'a', 'utf8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.alloc(5, 'a', 'utf8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Alloc_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'alloc',
        'alloc(size: int, fill: string, encoding: BufferEncoding): Buffer', arkTsAveragedTime);
    })

    // ==================== buffer.allocUninitializedFromPool ====================

    it('PerformanceTest_buffer_AllocUninitializedFromPool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.allocUninitializedFromPool(10);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.allocUninitializedFromPool(10);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_AllocUninitializedFromPool_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'allocUninitializedFromPool',
        'allocUninitializedFromPool(size: int): Buffer', arkTsAveragedTime);
    })

    // ==================== buffer.allocUninitialized ====================

    it('PerformanceTest_buffer_AllocUninitialized_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.allocUninitialized(10);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.allocUninitialized(10);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_AllocUninitialized_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'allocUninitialized',
        'allocUninitialized(size: int): Buffer', arkTsAveragedTime);
    })

    // ==================== buffer.byteLength ====================

    it('PerformanceTest_buffer_ByteLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let str = 'abcdef';
      let res: int = buffer.byteLength(str, 'utf8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.byteLength(str, 'utf8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_ByteLength_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'byteLength',
        'byteLength(doc: string | Buffer | TypedArray | DataView | ArrayBuffer, encoding?: BufferEncoding): int', arkTsAveragedTime);
    })

    // ==================== buffer.compare ====================

    it('PerformanceTest_buffer_Compare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1: buffer.Buffer = buffer.from('1234');
      let buf2: buffer.Buffer = buffer.from('0123');
      let res: int = buffer.compare(buf1, buf2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.compare(buf1, buf2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Compare_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'compare',
        'compare(buf1: Buffer | Uint8Array, buf2: Buffer | Uint8Array): int', arkTsAveragedTime);
    })

    // ==================== buffer.concat ====================

    it('PerformanceTest_buffer_Concat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1: buffer.Buffer = buffer.from('1234');
      let buf2: buffer.Buffer = buffer.from('abcd');
      let list: buffer.Buffer[] = [buf1, buf2];
      let res: buffer.Buffer = buffer.concat(list);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.concat(list);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Concat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'concat',
        'concat(list: Buffer[] | Uint8Array[], totalLength?: int): Buffer', arkTsAveragedTime);
    })

    // ==================== buffer.from ====================

    it('PerformanceTest_buffer_From_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x62, 0x75, 0x66, 0x66, 0x65, 0x72];
      let res: buffer.Buffer = buffer.from(arr);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.from(arr);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
        'from(array: double[]): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_From_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let ab = new ArrayBuffer(10);
      let res: buffer.Buffer = buffer.from(ab, 0, 2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.from(ab, 0, 2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
        'from(arrayBuffer: ArrayBuffer, byteOffset?: int, length?: int): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_From_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1: buffer.Buffer = buffer.from('buffer');
      let res: buffer.Buffer = buffer.from(buf1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.from(buf1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
        'from(buffer: Buffer | Uint8Array): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_From_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let s = new String('this is a test');
      let res: buffer.Buffer = buffer.from(s, 'utf8', 14);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.from(s, 'utf8', 14);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
        'from(object: Object, offsetOrEncoding: int | string, length: int): Buffer', arkTsAveragedTime);
    })

    it('PerformanceTest_buffer_From_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: buffer.Buffer = buffer.from('this is a test');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.from('this is a test');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_From_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'from',
        'from(string: String, encoding?: BufferEncoding): Buffer', arkTsAveragedTime);
    })

    // ==================== buffer.isBuffer ====================

    it('PerformanceTest_buffer_IsBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.alloc(10);
      let res: boolean = buffer.isBuffer(buf);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.isBuffer(buf);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_IsBuffer_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'isBuffer',
        'isBuffer(obj: Object): boolean', arkTsAveragedTime);
    })

    // ==================== buffer.isEncoding ====================

    it('PerformanceTest_buffer_IsEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: boolean = buffer.isEncoding('utf-8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.isEncoding('utf-8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_IsEncoding_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'isEncoding',
        'isEncoding(encoding: string): boolean', arkTsAveragedTime);
    })

    // ==================== buffer.transcode ====================

    it('PerformanceTest_buffer_Transcode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let src: buffer.Buffer = buffer.from('€');
      let res: buffer.Buffer = buffer.transcode(src, 'utf-8', 'ascii');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buffer.transcode(src, 'utf-8', 'ascii');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_buffer_Transcode_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'buffer', 'transcode',
        'transcode(source: Buffer | Uint8Array, fromEnc: string, toEnc: string): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.compare ====================

    it('PerformanceTest_Buffer_Compare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: double[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      let arr2: double[] = [5, 6, 7, 8, 9, 1, 2, 3, 4];
      let buf1: buffer.Buffer = buffer.from(arr1);
      let buf2: buffer.Buffer = buffer.from(arr2);
      let res: int = buf1.compare(buf2, 5, 9, 0, 4);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf1.compare(buf2, 5, 9, 0, 4);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Compare_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'compare',
        'compare(target: Buffer | Uint8Array, targetStart?: int, targetEnd?: int, sourceStart?: int, sourceEnd?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.copy ====================

    it('PerformanceTest_Buffer_Copy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pairs: buffer.Buffer[][] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        pairs.push([buffer.allocUninitializedFromPool(26), buffer.allocUninitializedFromPool(26)]);
      }
      let res: int = pairs[0][0].copy(pairs[0][1], 8, 16, 20);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pairs[i][0].copy(pairs[i][1], 8, 16, 20);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Copy_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'copy',
        'copy(target: Buffer | Uint8Array, targetStart?: int, sourceStart?: int, sourceEnd?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.entries ====================

    it('PerformanceTest_Buffer_Entries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('buffer');
      let res = buf.entries();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.entries();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Entries_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'entries',
        'entries(): IterableIterator<[int, long]>', arkTsAveragedTime);
    })

    // ==================== Buffer.equals ====================

    it('PerformanceTest_Buffer_Equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1: buffer.Buffer = buffer.from('ABC');
      let buf2: buffer.Buffer = buffer.from('414243', 'hex');
      let res: boolean = buf1.equals(buf2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf1.equals(buf2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'equals',
        'equals(otherBuffer: Uint8Array | Buffer): boolean', arkTsAveragedTime);
    })

    // ==================== Buffer.fill ====================

    it('PerformanceTest_Buffer_Fill_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(50));
      }
      let res: buffer.Buffer = bufs[0].fill(1);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].fill(1);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Fill_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'fill',
        'fill(value: int, offset?: int, end?: int, encoding?: BufferEncoding): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.includes ====================

    it('PerformanceTest_Buffer_Includes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('this is a buffer');
      let res: boolean = buf.includes('this');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.includes('this');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Includes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'includes',
        'includes(value: string | int | double | long | Buffer | Uint8Array, byteOffset?: int, encoding?: BufferEncoding): boolean', arkTsAveragedTime);
    })

    // ==================== Buffer.indexOf ====================

    it('PerformanceTest_Buffer_IndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('this is a buffer');
      let res: int = buf.indexOf('this');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.indexOf('this');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_IndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'indexOf',
        'indexOf(value: string | int | double | long | Buffer | Uint8Array, byteOffset?: int, encoding?: BufferEncoding): int', arkTsAveragedTime);
    })

    // ==================== Buffer.keys ====================

    it('PerformanceTest_Buffer_Keys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('buffer');
      let res = buf.keys();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.keys();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Keys_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
    })

    // ==================== Buffer.lastIndexOf ====================

    it('PerformanceTest_Buffer_LastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('this buffer is a buffer');
      let res: int = buf.lastIndexOf('buffer');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.lastIndexOf('buffer');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_LastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'lastIndexOf',
        'lastIndexOf(value: string | int | double | long | Buffer | Uint8Array, byteOffset?: int, encoding?: BufferEncoding): int', arkTsAveragedTime);
    })

    // ==================== Buffer.readBigInt64BE ====================

    it('PerformanceTest_Buffer_ReadBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: bigint = buf.readBigInt64BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readBigInt64BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigInt64BE',
        'readBigInt64BE(offset?: int): bigint', arkTsAveragedTime);
    })

    // ==================== Buffer.readBigInt64LE ====================

    it('PerformanceTest_Buffer_ReadBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: bigint = buf.readBigInt64LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readBigInt64LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigInt64LE',
        'readBigInt64LE(offset?: int): bigint', arkTsAveragedTime);
    })

    // ==================== Buffer.readBigUInt64BE ====================

    it('PerformanceTest_Buffer_ReadBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: bigint = buf.readBigUInt64BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readBigUInt64BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigUInt64BE',
        'readBigUInt64BE(offset?: int): bigint', arkTsAveragedTime);
    })

    // ==================== Buffer.readBigUInt64LE ====================

    it('PerformanceTest_Buffer_ReadBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: bigint = buf.readBigUInt64LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readBigUInt64LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readBigUInt64LE',
        'readBigUInt64LE(offset?: int): bigint', arkTsAveragedTime);
    })

    // ==================== Buffer.readDoubleBE ====================

    it('PerformanceTest_Buffer_ReadDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6, 7, 8];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: double = buf.readDoubleBE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readDoubleBE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readDoubleBE',
        'readDoubleBE(offset?: int): double', arkTsAveragedTime);
    })

    // ==================== Buffer.readDoubleLE ====================

    it('PerformanceTest_Buffer_ReadDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6, 7, 8];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: double = buf.readDoubleLE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readDoubleLE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readDoubleLE',
        'readDoubleLE(offset?: int): double', arkTsAveragedTime);
    })

    // ==================== Buffer.readFloatBE ====================

    it('PerformanceTest_Buffer_ReadFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res = buf.readFloatBE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readFloatBE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadFloatBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readFloatBE',
        'readFloatBE(offset?: int): float', arkTsAveragedTime);
    })

    // ==================== Buffer.readFloatLE ====================

    it('PerformanceTest_Buffer_ReadFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res = buf.readFloatLE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readFloatLE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadFloatLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readFloatLE',
        'readFloatLE(offset?: int): float', arkTsAveragedTime);
    })

    // ==================== Buffer.readInt8 ====================

    it('PerformanceTest_Buffer_ReadInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readInt8(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readInt8(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt8',
        'readInt8(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readInt16BE ====================

    it('PerformanceTest_Buffer_ReadInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readInt16BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readInt16BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt16BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt16BE',
        'readInt16BE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readInt16LE ====================

    it('PerformanceTest_Buffer_ReadInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readInt16LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readInt16LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt16LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt16LE',
        'readInt16LE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readInt32BE ====================

    it('PerformanceTest_Buffer_ReadInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readInt32BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readInt32BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt32BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt32BE',
        'readInt32BE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readInt32LE ====================

    it('PerformanceTest_Buffer_ReadInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readInt32LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readInt32LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadInt32LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readInt32LE',
        'readInt32LE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readIntBE ====================

    it('PerformanceTest_Buffer_ReadIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readIntBE(0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readIntBE(0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadIntBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readIntBE',
        'readIntBE(offset: int, byteLength: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readIntLE ====================

    it('PerformanceTest_Buffer_ReadIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readIntLE(0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readIntLE(0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadIntLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readIntLE',
        'readIntLE(offset: int, byteLength: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUInt8 ====================

    it('PerformanceTest_Buffer_ReadUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUInt8(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUInt8(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt8',
        'readUInt8(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUInt16BE ====================

    it('PerformanceTest_Buffer_ReadUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUInt16BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUInt16BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt16BE',
        'readUInt16BE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUInt16LE ====================

    it('PerformanceTest_Buffer_ReadUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUInt16LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUInt16LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt16LE',
        'readUInt16LE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUInt32BE ====================

    it('PerformanceTest_Buffer_ReadUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUInt32BE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUInt32BE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt32BE',
        'readUInt32BE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUInt32LE ====================

    it('PerformanceTest_Buffer_ReadUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUInt32LE(0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUInt32LE(0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUInt32LE',
        'readUInt32LE(offset?: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUIntBE ====================

    it('PerformanceTest_Buffer_ReadUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUIntBE(0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUIntBE(0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUIntBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUIntBE',
        'readUIntBE(offset: int, byteLength: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.readUIntLE ====================

    it('PerformanceTest_Buffer_ReadUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [1, 2, 3, 4, 5, 6];
      let buf: buffer.Buffer = buffer.from(arr);
      let res: long = buf.readUIntLE(0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.readUIntLE(0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ReadUIntLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'readUIntLE',
        'readUIntLE(offset: int, byteLength: int): long', arkTsAveragedTime);
    })

    // ==================== Buffer.subarray ====================

    it('PerformanceTest_Buffer_Subarray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: buffer.Buffer = bufs[0].subarray(0, 3);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].subarray(0, 3);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Subarray_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'subarray',
        'subarray(start?: int, end?: int): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.swap16 ====================

    it('PerformanceTest_Buffer_Swap16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.from(arr));
      }
      let res: buffer.Buffer = bufs[0].swap16();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].swap16();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap16_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap16',
        'swap16(): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.swap32 ====================

    it('PerformanceTest_Buffer_Swap32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.from(arr));
      }
      let res: buffer.Buffer = bufs[0].swap32();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].swap32();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap32_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap32',
        'swap32(): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.swap64 ====================

    it('PerformanceTest_Buffer_Swap64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.from(arr));
      }
      let res: buffer.Buffer = bufs[0].swap64();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].swap64();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Swap64_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'swap64',
        'swap64(): Buffer', arkTsAveragedTime);
    })

    // ==================== Buffer.toJSON ====================

    it('PerformanceTest_Buffer_ToJSON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: double[] = [0x1, 0x2, 0x3, 0x4, 0x5];
      let buf: buffer.Buffer = buffer.from(arr);
      let res = buf.toJSON();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.toJSON();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ToJSON_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'toJSON',
        'toJSON(): jsonx.JsonElement', arkTsAveragedTime);
    })

    // ==================== Buffer.toString ====================

    it('PerformanceTest_Buffer_ToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('abcdef');
      let res: string = buf.toString('utf8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.toString('utf8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_ToString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'toString',
        'toString(encoding?: BufferEncoding, start?: int, end?: int): string', arkTsAveragedTime);
    })

    // ==================== Buffer.values ====================

    it('PerformanceTest_Buffer_Values_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.from('buffer');
      let res = buf.values();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.values();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Values_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'values',
        'values(): IterableIterator<long>', arkTsAveragedTime);
    })

    // ==================== Buffer.write ====================

    it('PerformanceTest_Buffer_Write_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.alloc(256);
      let res: int = buf.write('abcdef', 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf.write('abcdef', 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_Write_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'write',
        'write(str: string, offset?: int, length?: int, encoding?: string): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeBigInt64BE ====================

    it('PerformanceTest_Buffer_WriteBigInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let v: bigint = BigInt(0x0102030405060708);
      let res: int = bufs[0].writeBigInt64BE(v, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeBigInt64BE(v, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigInt64BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigInt64BE',
        'writeBigInt64BE(value: bigint, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeBigInt64LE ====================

    it('PerformanceTest_Buffer_WriteBigInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let v: bigint = BigInt(0x0102030405060708);
      let res: int = bufs[0].writeBigInt64LE(v, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeBigInt64LE(v, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigInt64LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigInt64LE',
        'writeBigInt64LE(value: bigint, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeBigUInt64BE ====================

    it('PerformanceTest_Buffer_WriteBigUInt64BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let v: bigint = BigInt(0x0102030405060708);
      let res: int = bufs[0].writeBigUInt64BE(v, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeBigUInt64BE(v, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigUInt64BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigUInt64BE',
        'writeBigUInt64BE(value: bigint, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeBigUInt64LE ====================

    it('PerformanceTest_Buffer_WriteBigUInt64LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let v: bigint = BigInt(0x0102030405060708);
      let res: int = bufs[0].writeBigUInt64LE(v, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeBigUInt64LE(v, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteBigUInt64LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeBigUInt64LE',
        'writeBigUInt64LE(value: bigint, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeDoubleBE ====================

    it('PerformanceTest_Buffer_WriteDoubleBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeDoubleBE(123.456, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeDoubleBE(123.456, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteDoubleBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeDoubleBE',
        'writeDoubleBE(value: double, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeDoubleLE ====================

    it('PerformanceTest_Buffer_WriteDoubleLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeDoubleLE(123.456, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeDoubleLE(123.456, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteDoubleLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeDoubleLE',
        'writeDoubleLE(value: double, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeFloatBE ====================

    it('PerformanceTest_Buffer_WriteFloatBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeFloatBE(0.5, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeFloatBE(0.5, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteFloatBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeFloatBE',
        'writeFloatBE(value: float, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeFloatLE ====================

    it('PerformanceTest_Buffer_WriteFloatLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeFloatLE(0.5, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeFloatLE(0.5, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteFloatLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeFloatLE',
        'writeFloatLE(value: float, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeInt8 ====================

    it('PerformanceTest_Buffer_WriteInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeInt8(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeInt8(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt8',
        'writeInt8(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeInt16BE ====================

    it('PerformanceTest_Buffer_WriteInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeInt16BE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeInt16BE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt16BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt16BE',
        'writeInt16BE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeInt16LE ====================

    it('PerformanceTest_Buffer_WriteInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeInt16LE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeInt16LE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt16LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt16LE',
        'writeInt16LE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeInt32BE ====================

    it('PerformanceTest_Buffer_WriteInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeInt32BE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeInt32BE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt32BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt32BE',
        'writeInt32BE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeInt32LE ====================

    it('PerformanceTest_Buffer_WriteInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeInt32LE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeInt32LE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteInt32LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeInt32LE',
        'writeInt32LE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeIntBE ====================

    it('PerformanceTest_Buffer_WriteIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeIntBE(1, 0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeIntBE(1, 0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteIntBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeIntBE',
        'writeIntBE(value: int, offset: int, byteLength: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeIntLE ====================

    it('PerformanceTest_Buffer_WriteIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeIntLE(1, 0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeIntLE(1, 0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteIntLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeIntLE',
        'writeIntLE(value: int, offset: int, byteLength: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUInt8 ====================

    it('PerformanceTest_Buffer_WriteUInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUInt8(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUInt8(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt8',
        'writeUInt8(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUInt16BE ====================

    it('PerformanceTest_Buffer_WriteUInt16BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUInt16BE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUInt16BE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt16BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt16BE',
        'writeUInt16BE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUInt16LE ====================

    it('PerformanceTest_Buffer_WriteUInt16LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUInt16LE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUInt16LE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt16LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt16LE',
        'writeUInt16LE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUInt32BE ====================

    it('PerformanceTest_Buffer_WriteUInt32BE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUInt32BE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUInt32BE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt32BE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt32BE',
        'writeUInt32BE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUInt32LE ====================

    it('PerformanceTest_Buffer_WriteUInt32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUInt32LE(1, 0);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUInt32LE(1, 0);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUInt32LE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUInt32LE',
        'writeUInt32LE(value: int, offset?: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUIntBE ====================

    it('PerformanceTest_Buffer_WriteUIntBE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUIntBE(1, 0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUIntBE(1, 0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUIntBE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUIntBE',
        'writeUIntBE(value: int, offset: int, byteLength: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.writeUIntLE ====================

    it('PerformanceTest_Buffer_WriteUIntLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bufs: buffer.Buffer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        bufs.push(buffer.allocUninitializedFromPool(10));
      }
      let res: int = bufs[0].writeUIntLE(1, 0, 6);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bufs[i].writeUIntLE(1, 0, 6);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_WriteUIntLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', 'writeUIntLE',
        'writeUIntLE(value: int, offset: int, byteLength: int): int', arkTsAveragedTime);
    })

    // ==================== Buffer.[index] ====================

    it('PerformanceTest_Buffer_IndexAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf: buffer.Buffer = buffer.alloc(4);
      buf[1] = 100;
      let res: long = buf[1];
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = buf[1];
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Buffer_IndexAccess_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Buffer', '[index]',
        '[index: int]: long', arkTsAveragedTime);
    })

    // ==================== Blob.constructor ====================

    it('PerformanceTest_Blob_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let src: string[] = ['a', 'b', 'c'];
      let res: buffer.Blob = new buffer.Blob(src);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new buffer.Blob(src);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'constructor',
        'constructor(sources: ArrayUnionType, options?: BlobOptions)', arkTsAveragedTime);
    })

    // ==================== Blob.arrayBuffer ====================

    it('PerformanceTest_Blob_ArrayBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let src: string[] = ['a', 'b', 'c'];
      let blob: buffer.Blob = new buffer.Blob(src);
      let res = blob.arrayBuffer();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = blob.arrayBuffer();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_ArrayBuffer_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'arrayBuffer',
        'arrayBuffer(): Promise<ArrayBuffer>', arkTsAveragedTime);
    })

    // ==================== Blob.slice ====================

    it('PerformanceTest_Blob_Slice_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let src: string[] = ['a', 'b', 'c'];
      let blob: buffer.Blob = new buffer.Blob(src);
      let res: buffer.Blob = blob.slice(0, 2);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = blob.slice(0, 2);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Slice_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'slice',
        'slice(start?: int, end?: int, type?: string): Blob', arkTsAveragedTime);
    })

    // ==================== Blob.text ====================

    it('PerformanceTest_Blob_Text_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let src: string[] = ['a', 'b', 'c'];
      let blob: buffer.Blob = new buffer.Blob(src);
      let res = blob.text();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = blob.text();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Blob_Text_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Blob', 'text',
        'text(): Promise<string>', arkTsAveragedTime);
    })

  })
}
