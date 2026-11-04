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
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest00(): void {
  describe('TypedArraysPerfTest00', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Int8Array_buffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array(100);
      let res: boolean = arr.buffer !== undefined;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.buffer !== undefined;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_buffer_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'buffer',
        'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_byteLength_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array(100);
      let res: number = arr.byteLength;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_byteLength_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'byteLength',
        'byteLength: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_byteOffset_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(200);
      let arr: Int8Array = new Int8Array(buf, 50, 100);
      let res: number = arr.byteOffset;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_byteOffset_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'byteOffset',
        'byteOffset: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_BYTES_PER_ELEMENT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: number = Int8Array.BYTES_PER_ELEMENT;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Int8Array.BYTES_PER_ELEMENT;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_BYTES_PER_ELEMENT_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'BYTES_PER_ELEMENT',
        'static BYTES_PER_ELEMENT: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_length_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array(100);
      let res: number = arr.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Int8Array_length_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'length',
        'length: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_Constructor_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: BigUint64Array = new BigUint64Array();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_Constructor_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor',
        'constructor(): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: BigUint64Array = new BigUint64Array(100);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BigUint64Array(100);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_Constructor_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'constructor_length',
        'constructor(length: number | number): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_static_of_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: BigUint64Array = BigUint64Array.of(BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5));
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.of(BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5));
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_static_of_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'static_of',
        'static of(...items: FixedArray<bigint>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_static_from_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: Array<bigint> = new Array<bigint>(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = BigInt(i);
      }

      let bigUint64ArrayCtor = BigUint64Array;
      let res: BigUint64Array = bigUint64ArrayCtor.from(srcArr);

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bigUint64ArrayCtor.from(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;

      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_static_from_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from',
        'static from(arr: Array<bigint>): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_static_from_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let srcArr: BigUint64Array = new BigUint64Array(100);
      for (let i = 0; i < 100; i++) {
        srcArr[i] = BigInt(i);
      }

      let bigUint64ArrayCtor = BigUint64Array;
      let res: BigUint64Array = bigUint64ArrayCtor.from(srcArr);

      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = bigUint64ArrayCtor.from(srcArr);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;

      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_static_from_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from',
        'static from(arr: BigUint64Array): BigUint64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_buffer_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: boolean = arr.buffer !== undefined;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.buffer !== undefined;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_buffer_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'buffer',
        'buffer: ArrayBuffer', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_byteLength_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: number = arr.byteLength;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteLength;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_byteLength_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'byteLength',
        'byteLength: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_byteOffset_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let buf: ArrayBuffer = new ArrayBuffer(1600);
      let arr: BigUint64Array = new BigUint64Array(buf, 400, 100);
      let res: number = arr.byteOffset;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.byteOffset;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_byteOffset_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'byteOffset',
        'byteOffset: number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_length_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: BigUint64Array = new BigUint64Array(100);
      let res: number = arr.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BigUint64Array_length_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'length',
        'length: number', arkTsAveragedTime);
      done();
    })
  })
}