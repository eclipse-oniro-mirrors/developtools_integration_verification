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
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest06(): void {
  describe('TypedArraysPerfTest06', () => {
    const BASE_COUNT: number = 1000;

    beforeEach(() => {

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Int8Array_from_Set_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
        let res: Int8Array = Int8Array.from(set);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int8Array.from(set);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int8Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from',
          'from(Set<number>): Int8Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Int8Array_from_Array_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = [1, 2, 3, 4, 5];
        let res: Int8Array = Int8Array.from(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int8Array.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int8Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'from',
          'from(Array<number>): Int8Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Int16Array_from_Set_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
        let res: Int16Array = Int16Array.from(set);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int16Array.from(set);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int16Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from',
          'from(Set<number>): Int16Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Int16Array_from_Array_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = [1, 2, 3, 4, 5];
        let res: Int16Array = Int16Array.from(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int16Array.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int16Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'from',
          'from(Array<number>): Int16Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Int32Array_from_Set_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let set: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
        let res: Int32Array = Int32Array.from(set);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int32Array.from(set);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int32Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from',
          'from(Set<number>): Int32Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Int32Array_from_Array_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = [1, 2, 3, 4, 5];
        let res: Int32Array = Int32Array.from(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Int32Array.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Int32Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'from',
          'from(Array<number>): Int32Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Float32Array_from_Set_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let set: Set<number> = new Set<number>([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float32Array = Float32Array.from(set);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Float32Array.from(set);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from',
          'from(Set<number>): Float32Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Float32Array_from_Array_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let res: Float32Array = Float32Array.from(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Float32Array.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float32Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'from',
          'from(Array<number>): Float32Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Float64Array_from_Set_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let set: Set<number> = new Set<number>([1.0, 2.0, 3.0, 4.0, 5.0]);
        let res: Float64Array = Float64Array.from(set);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Float64Array.from(set);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float64Array from(Set<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from',
          'from(Set<number>): Float64Array', arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_Float64Array_from_Array_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let res: Float64Array = Float64Array.from(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = Float64Array.from(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Float64Array from(Array<number>): ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'from',
          'from(Array<number>): Float64Array', arkTsAveragedTime);
;
      done();
      })

  })
}