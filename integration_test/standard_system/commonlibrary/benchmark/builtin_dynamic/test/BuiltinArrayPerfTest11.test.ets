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

export default function BuiltinArrayPerfTest11(): void {
  describe('BuiltinArrayPerfTest11', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: boolean[] = [true, false, true, false, true];
      let result: boolean[] = new Array<boolean>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<boolean>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [3, 1, 4, 2, 5];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<byte>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [30, 10, 40, 20, 50];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<short>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [300, 100, 400, 200, 500];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<int>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [3000, 1000, 4000, 2000, 5000];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<long>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [3.3, 1.1, 4.4, 2.2, 5.5];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<float>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: number[] = [3.33, 1.11, 4.44, 2.22, 5.55];
      let result: number[] = new Array<number>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: number[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<double>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BuiltinArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let fixArray: string[] = ['c', 'a', 'd', 'b', 'e'];
      let result: string[] = new Array<string>(5);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = fixArray.sort();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
        'sort(): FixedArray<char>', arkTsAveragedTime);
      done();
    })

  })
}
