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
import { stream } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

// Subclass declarations at root level
class PerfWritable extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback();
  }
  doInitialize(callback: Function): void {
    super.doInitialize(callback);
  }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    callback();
  }
}

class PerfReadable extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: number): void {}
  doInitialize(callback: Function): void {
    super.doInitialize(callback);
  }
}

class PerfDuplex extends stream.Duplex {
  constructor() {
    super();
  }
  doRead(size: number): void {}
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback();
  }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    callback();
  }
}

class PerfTransform extends stream.Transform {
  constructor() {
    super();
  }
  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback();
  }
  doFlush(callback: Function): void {
    callback('test');
  }
}

export default function StreamPerfTest(): void {
  describe('StreamPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. Writable base class properties and methods ====================

    it('PerformanceTest_Stream_Writable_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: stream.Writable = new stream.Writable();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new stream.Writable();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableObjectMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: boolean = writableStream.writableObjectMode;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableObjectMode;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableObjectMode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableObjectMode',
          'get writableObjectMode(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableHighWatermark_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: number = writableStream.writableHighWatermark;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableHighWatermark;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableHighWatermark_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableHighWatermark',
          'get writableHighWatermark(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_Writable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: boolean = writableStream.writable;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writable;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Writable_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writable',
          'get writable(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: number = writableStream.writableLength;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableLength',
          'get writableLength(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableCorked_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: number = writableStream.writableCorked;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableCorked;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableCorked_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableCorked',
          'get writableCorked(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableEnded_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: boolean = writableStream.writableEnded;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableEnded;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableEnded_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableEnded',
          'get writableEnded(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_WritableFinished_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: boolean = writableStream.writableFinished;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.writableFinished;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_WritableFinished_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.writableFinished',
          'get writableFinished(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_Write_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        for (let j = 0; j < 100; j++) {
          writables.push(new PerfWritable());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = writables[i].write('test', 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Write_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.write',
          'write(chunk?: string | Uint8Array, encoding?: string, callback?: Function): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_End_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        for (let j = 0; j < 100; j++) {
          writables.push(new PerfWritable());
        }
        let res: stream.Writable = writables[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = writables[i].end('finish', 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_End_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.end',
          'end(chunk?: string | Uint8Array, encoding?: string, callback?: Function): Writable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_SetDefaultEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writableStream = new PerfWritable();
        let res: boolean = writableStream.setDefaultEncoding('utf8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writableStream.setDefaultEncoding('utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_SetDefaultEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.setDefaultEncoding',
          'setDefaultEncoding(encoding?: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_Cork_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          writables.push(new PerfWritable());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writables[i].cork();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Cork_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.cork',
          'cork(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_Uncork_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let w = new PerfWritable();
          w.cork();
          writables.push(w);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = writables[i].uncork();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Uncork_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.uncork',
          'uncork(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          writables.push(new PerfWritable());
        }
        let callback = (): void => {};
        let res: PerfWritable = writables[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          writables[i].on('finish', callback);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_On_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.on',
          'on(event: string, callback: Function): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Writable_Off_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let writables: PerfWritable[] = [];
        let callback = (): void => {};
        for (let j = 0; j < BASE_COUNT; j++) {
          let w = new PerfWritable();
          w.on('finish', callback);
          writables.push(w);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          writables[i].off('finish');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = writables[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Writable_Off_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Writable.off',
          'off(event: string, callback?: Function): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. ReadableOptions & Readable base class properties and methods ====================

    it('PerformanceTest_Stream_Readable_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: stream.Readable = new stream.Readable();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new stream.Readable();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_ReadableOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let option: stream.ReadableOptions = { encoding: 'utf-8' };
        let res: stream.Readable = new stream.Readable(option);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new stream.Readable(option);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_ReadableOptions_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.options_constructor',
          'constructor(options: ReadableOptions)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableObjectMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean = readableStream.readableObjectMode;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableObjectMode;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableObjectMode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableObjectMode',
          'get readableObjectMode(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Readable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean = readableStream.readable;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readable;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Readable_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readable',
          'get readable(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableHighWatermark_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: number = readableStream.readableHighWatermark;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableHighWatermark;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableHighWatermark_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableHighWatermark',
          'get readableHighWatermark(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableFlowing_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean | null = readableStream.readableFlowing;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableFlowing;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableFlowing_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableFlowing',
          'get readableFlowing(): boolean | null', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: number = readableStream.readableLength;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableLength',
          'get readableLength(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: string | null = readableStream.readableEncoding;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableEncoding;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableEncoding',
          'get readableEncoding(): string | null', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_ReadableEnded_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean = readableStream.readableEnded;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.readableEnded;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_ReadableEnded_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.readableEnded',
          'get readableEnded(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Read_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        for (let j = 0; j < 100; j++) {
          let r = new PerfReadable();
          r.push('test');
          r.pause();
          readables.push(r);
        }
        let res: Object | null = null;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = readables[i].read(4);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Read_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.read',
          'read(size?: number): buffer.Buffer | string | null', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Resume_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: stream.Readable = readableStream;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.resume();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Resume_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.resume',
          'resume(): Readable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Pause_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: stream.Readable = readableStream;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.pause();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Pause_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.pause',
          'pause(): Readable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_SetEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.setEncoding('utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_SetEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.setEncoding',
          'setEncoding(encoding?: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_IsPaused_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readableStream = new PerfReadable();
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readableStream.isPaused();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_IsPaused_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.isPaused',
          'isPaused(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Pipe_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        for (let j = 0; j < 100; j++) {
          readables.push(new PerfReadable());
        }
        let writable = new PerfWritable();
        let res: stream.Writable = writable;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = readables[i].pipe(writable);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Pipe_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.pipe',
          'pipe(destination: Writable, options?: Object): Writable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Unpipe_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        let writable = new PerfWritable();
        for (let j = 0; j < 100; j++) {
          let r = new PerfReadable();
          r.pipe(writable);
          readables.push(r);
        }
        let res: stream.Readable = readables[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = readables[i].unpipe(writable);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Unpipe_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.unpipe',
          'unpipe(destination?: Writable): Readable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Push_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          readables.push(new PerfReadable());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = readables[i].push('test_data');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Push_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.push',
          'push(chunk: Uint8Array | string | undefined | null, encoding?: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          readables.push(new PerfReadable());
        }
        let cb = (data: Object): void => {};
        let res: PerfReadable = readables[0];
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          readables[i].on('data', cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_On_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.on',
          'on(event: string, callback: Function): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Readable_Off_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let readables: PerfReadable[] = [];
        let cb = (data: Object): void => {};
        for (let j = 0; j < 100; j++) {
          let r = new PerfReadable();
          r.on('data', cb);
          readables.push(r);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          readables[i].off('data', cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = readables[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Readable_Off_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Readable.off',
          'off(event: string, callback?: Function): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. Duplex base class methods and properties ====================

    it('PerformanceTest_Stream_Duplex_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: stream.Duplex = new stream.Duplex();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new stream.Duplex();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableObjectMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: boolean = duplexStream.writableObjectMode;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableObjectMode;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableObjectMode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableObjectMode',
          'get writableObjectMode(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableHighWatermark_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: number = duplexStream.writableHighWatermark;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableHighWatermark;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableHighWatermark_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableHighWatermark',
          'get writableHighWatermark(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_Writable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: boolean = duplexStream.writable;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writable;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_Writable_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writable',
          'get writable(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: number = duplexStream.writableLength;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableLength;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableLength',
          'get writableLength(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableCorked_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: number = duplexStream.writableCorked;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableCorked;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableCorked_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableCorked',
          'get writableCorked(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableEnded_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: boolean = duplexStream.writableEnded;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableEnded;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableEnded_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableEnded',
          'get writableEnded(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_WritableFinished_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: boolean = duplexStream.writableFinished;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.writableFinished;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_WritableFinished_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.writableFinished',
          'get writableFinished(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_Write_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexes: PerfDuplex[] = [];
        for (let j = 0; j < 100; j++) {
          duplexes.push(new PerfDuplex());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = duplexes[i].write('test', 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_Write_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.write',
          'write(chunk?: string | Uint8Array, encoding?: string, callback?: Function): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_End_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexes: PerfDuplex[] = [];
        for (let j = 0; j < 100; j++) {
          duplexes.push(new PerfDuplex());
        }
        let res: stream.Writable = new stream.Writable();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 100; i++) {
          res = duplexes[i].end('finish', 'utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_End_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.end',
          'end(chunk?: string | Uint8Array, encoding?: string, callback?: Function): Writable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_SetDefaultEncoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexStream = new PerfDuplex();
        let res: boolean = duplexStream.setDefaultEncoding('utf8');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexStream.setDefaultEncoding('utf8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_SetDefaultEncoding_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.setDefaultEncoding',
          'setDefaultEncoding(encoding?: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_Cork_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexes: PerfDuplex[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          duplexes.push(new PerfDuplex());
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexes[i].cork();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_Cork_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.cork',
          'cork(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('PerformanceTest_Stream_Duplex_Uncork_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let duplexes: PerfDuplex[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let d = new PerfDuplex();
          d.cork();
          duplexes.push(d);
        }
        let res: boolean = false;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = duplexes[i].uncork();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Duplex_Uncork_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Duplex.uncork',
          'uncork(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. Transform base class and constructor ====================

    it('PerformanceTest_Stream_Transform_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: stream.Transform = new stream.Transform();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < 5000; i++) {
          res = new stream.Transform();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stream_Transform_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'stream', 'Transform.constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
