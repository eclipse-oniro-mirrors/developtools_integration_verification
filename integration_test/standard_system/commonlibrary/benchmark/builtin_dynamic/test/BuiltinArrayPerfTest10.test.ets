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

 export default function BuiltinArrayPerfTest10(): void {
  describe('BuiltinArrayPerfTest10', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Uint8Array = new Uint8Array([1, 2, 3]);
      let result = new Uint8Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int16Array = new Int16Array([10, 20, 30]);
      let result = new Int16Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): Int16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int32Array = new Int32Array([100, 200, 300]);
      let result = new Int32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): Int32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: BigInt64Array = new BigInt64Array([1000n, 2000n, 3000n]);
      let result = new BigInt64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): BigInt64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      let result = new Float32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): Float32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float64Array = new Float64Array([1.11, 2.22, 3.33]);
      let result = new Float64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'slice().reverse(): Float64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Uint8Array = new Uint8Array([1, 2, 3]);
      let result = new Uint8Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int16Array = new Int16Array([10, 20, 30]);
      let result = new Int16Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): Int16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int32Array = new Int32Array([100, 200, 300]);
      let result = new Int32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): Int32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: BigInt64Array = new BigInt64Array([1000n, 2000n, 3000n]);
      let result = new BigInt64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): BigInt64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      let result = new Float32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): Float32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float64Array = new Float64Array([1.11, 2.22, 3.33]);
      let result = new Float64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.reverse();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): Float64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Uint8Array = new Uint8Array([3, 1, 2]);
      let result = new Uint8Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int16Array = new Int16Array([30, 10, 20]);
      let result = new Int16Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): Int16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int32Array = new Int32Array([300, 100, 200]);
      let result = new Int32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): Int32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: BigInt64Array = new BigInt64Array([3000n, 1000n, 2000n]);
      let result = new BigInt64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => Number(a - b));
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): BigInt64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float32Array = new Float32Array([3.3, 1.1, 2.2]);
      let result = new Float32Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): Float32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float64Array = new Float64Array([3.33, 1.11, 2.22]);
      let result = new Float64Array(3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort((a, b) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'slice().sort(): Float64Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Uint8Array = new Uint8Array([1, 2, 3]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<byte>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int16Array = new Int16Array([10, 20, 30]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<short>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Int32Array = new Int32Array([100, 200, 300]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<number>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: BigInt64Array = new BigInt64Array([1000n, 2000n, 3000n]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<long>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<float>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: Float64Array = new Float64Array([1.11, 2.22, 3.33]);
      let result = fixArray.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fixArray.values();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<double>', arkTsAveragedTime);
      done();
    })

  })
}
