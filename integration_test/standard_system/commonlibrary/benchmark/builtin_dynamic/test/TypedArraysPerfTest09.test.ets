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

export default function TypedArraysPerfTest09(): void {
  describe('TypedArraysPerfTest09', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Int8Array_of_empty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int8Array = Int8Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int8Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of', 'of(): Int8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int8Array_of_FixedInt_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int8Array = Int8Array.of(1 as number, 2 as number, 3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int8Array.of(1 as number, 2 as number, 3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int8Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'of', 'of(FixedArray<number>): Int8Array', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Int16Array_of_empty_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int16Array = Int16Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int16Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int16Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'of', 'of(): Int16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int16Array_of_FixedInt_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int16Array = Int16Array.of(1 as number, 2 as number, 3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int16Array.of(1 as number, 2 as number, 3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int16Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'of', 'of(FixedArray<number>): Int16Array', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Int16Array_from_Uint16Array_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let int16ArrayCtor = Int16Array;
        let res: Int16Array = int16ArrayCtor.from(srcArr);

        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = int16ArrayCtor.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;

        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int16Array from_Uint16Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from', 'from(Uint16Array): Int16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int32Array_of_empty_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int32Array = Int32Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int32Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int32Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'of', 'of(): Int32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Int32Array_of_FixedNumber_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Int32Array = Int32Array.of(1 as number, 2 as number, 3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Int32Array.of(1 as number, 2 as number, 3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int32Array of_FixedNumber: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'of', 'of(FixedArray<number>): Int32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigInt64Array_of_empty_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: BigInt64Array = BigInt64Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = BigInt64Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigInt64Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(): BigInt64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigInt64Array_of_FixedBigInt_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: BigInt64Array = BigInt64Array.of(BigInt(1), BigInt(2), BigInt(3));
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = BigInt64Array.of(BigInt(1), BigInt(2), BigInt(3));
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigInt64Array of_FixedBigInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'of', 'of(FixedArray<bigint>): BigInt64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigInt64Array_from_BigInt64Array_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
        let bigInt64ArrayCtor = BigInt64Array;
        let res: BigInt64Array = bigInt64ArrayCtor.from(srcArr);

        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bigInt64ArrayCtor.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;

        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigInt64Array from_BigInt64Array: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(BigInt64Array): BigInt64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigInt64Array_from_ArrayBigInt_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let srcArr: Array<bigint> = new Array<bigint>();
        srcArr.push(BigInt(1));
        srcArr.push(BigInt(2));
        srcArr.push(BigInt(3));
        let bigInt64ArrayCtor = BigInt64Array;
        let res: BigInt64Array = bigInt64ArrayCtor.from(srcArr);

        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bigInt64ArrayCtor.from(srcArr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;

        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigInt64Array from_ArrayBigInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'from', 'from(Array<bigint>): BigInt64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_of_empty_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = Float32Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'of', 'of(): Float32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float32Array_of_FixedInt_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float32Array = Float32Array.of(1 as number, 2 as number, 3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float32Array.of(1 as number, 2 as number, 3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'of', 'of(FixedArray<number>): Float32Array', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_Float64Array_of_empty_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float64Array = Float64Array.of();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float64Array.of();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float64Array of_empty: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'of', 'of(): Float64Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Float64Array_of_FixedInt_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Float64Array = Float64Array.of(1 as number, 2 as number, 3 as number);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = Float64Array.of(1 as number, 2 as number, 3 as number);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float64Array of_FixedInt: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'of', 'of(FixedArray<number>): Float64Array', arkTsAveragedTime);
      done();
      })


  })
}
