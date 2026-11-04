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

export default function TypedUArraysPerfTest05(): void {
  describe('TypedUArraysPerfTest05', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8Array_from_Set_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
      let res: Uint8Array = Uint8Array.from(set);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint8Array.from(set);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint8Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(Set<number>): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8Array_from_Array_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let res: Uint8Array = Uint8Array.from(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint8Array.from(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint8Array from(number[]): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'from', 'from(number[]): Uint8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_from_Set_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
      let res: Uint16Array = Uint16Array.from(set);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint16Array.from(set);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint16Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(Set<number>): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint16Array_from_Array_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let res: Uint16Array = Uint16Array.from(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint16Array.from(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint16Array from(number[]): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'from', 'from(number[]): Uint16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint32Array_from_Set_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
      let res: Uint32Array = Uint32Array.from(set);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(set);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint32Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'from(Set<number>): Uint32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint32Array_from_Array_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let res: Uint32Array = Uint32Array.from(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint32Array.from(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint32Array from(number[]): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'from', 'from(number[]): Uint32Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_from_Set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
      let res: Uint8ClampedArray = Uint8ClampedArray.from(set);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint8ClampedArray.from(set);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint8ClampedArray from(Set<number>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(Set<number>): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Uint8ClampedArray_from_Array_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let res: Uint8ClampedArray = Uint8ClampedArray.from(arr);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = Uint8ClampedArray.from(arr);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest Uint8ClampedArray from(number[]): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'from', 'from(number[]): Uint8ClampedArray', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigUint64Array_from_Set_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let set: Set<bigint> = new Set<bigint>([1n, 2n, 3n, 4n, 5n]);
      let res: BigUint64Array = BigUint64Array.from(Array.from(set));
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = BigUint64Array.from(Array.from(set));
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest BigUint64Array from(Set<bigint>): ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'from', 'from(bigint[]): BigUint64Array', arkTsAveragedTime);
      done();
    });

  })
}
