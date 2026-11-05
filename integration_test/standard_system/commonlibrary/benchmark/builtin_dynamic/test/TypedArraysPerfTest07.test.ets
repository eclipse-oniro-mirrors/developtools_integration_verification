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
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest07(): void {
  describe('TypedArraysPerfTest07', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

it('PerformanceTest_Int8Array_Constructor_Iterable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcIter: number[] = [1, 2, 3, 4, 5];
      let res: Int8Array = new Int8Array(srcIter);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(srcIter);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferInt_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: Int8Array = new Int8Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferNumber_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let res: Int8Array = new Int8Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferInt_0200Int_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50 as number, 100 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50 as number, 100 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferIntInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, int, int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_Constructor_ArrayBufferNumber_0300Undef_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int8Array = new Int8Array(buf, 50 as number, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int8Array(buf, 50 as number, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayInt_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(1 as number);
      srcArr.push(2 as number);
      srcArr.push(3 as number);
      let res: Int16Array = new Int16Array(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_Constructor_Iterable_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcIter: number[] = [1, 2, 3, 4, 5];
      let res: Int16Array = new Int16Array(srcIter);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(srcIter);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayBufferNumber_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int16Array = new Int16Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_Constructor_ArrayBufferNumber_0800Undef_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let res: Int16Array = new Int16Array(buf, 50, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int16Array(buf, 50, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayInt_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(1 as number);
      srcArr.push(2 as number);
      srcArr.push(3 as number);
      let res: Int32Array = new Int32Array(srcArr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(srcArr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayInt: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(Array<int>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_Constructor_Iterable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcIter: number[] = [1, 2, 3, 4, 5];
      let res: Int32Array = new Int32Array(srcIter);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(srcIter);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayBufferNumber_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Int32Array = new Int32Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_Constructor_ArrayBufferNumber_1200Undef_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Int32Array = new Int32Array(buf, 100, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Int32Array(buf, 100, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigInt64Array_Constructor_ArrayBufferNumber_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigInt64Array = new BigInt64Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigInt64Array_Constructor_ArrayBufferNumber_1400Undef_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: BigInt64Array = new BigInt64Array(buf, 96, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigInt64Array(buf, 96, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float32Array_Constructor_Iterable_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcIter: number[] = [1, 2, 3, 4, 5];
      let res: Float32Array = new Float32Array(srcIter);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(srcIter);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float32Array_Constructor_ArrayBufferNumber_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Float32Array = new Float32Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float32Array_Constructor_ArrayBufferNumber_1700Undef_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(400);
      let res: Float32Array = new Float32Array(buf, 100, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float32Array(buf, 100, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float64Array_Constructor_Iterable_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcIter: number[] = [1, 2, 3, 4, 5];
      let res: Float64Array = new Float64Array(srcIter);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(srcIter);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_Iterable: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(Iterable<Number>): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float64Array_Constructor_ArrayBufferNumber_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: Float64Array = new Float64Array(buf, 0 as number);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 0 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_ArrayBufferNumber: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(ArrayBuffer, number): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float64Array_Constructor_ArrayBufferNumber_2000Undef_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(800);
      let res: Float64Array = new Float64Array(buf, 96, undefined);
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Float64Array(buf, 96, undefined);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array Constructor_ArrayBufferNumberUndef: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'constructor', 'constructor(ArrayBuffer, Number | undefined, Number | undefined): void', arkTsAveragedTime);
      done();
    })

    })
}