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

export default function BuiltinArrayPerfTest16(): void {
  describe('BuiltinArrayPerfTest16', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: number[] = [1, 2, 3, 4, 5];
        let result: number = 0;
        const reducer = (acc: number, val: number): number => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduce(reducer, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
          'reduce(callbackFn: (previousValue: number, currentValue: number) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string = 'a';
        const reducer = (acc: string, val: string): string => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduce(reducer, 'a');
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
          'reduce(callbackFn: (previousValue: string, currentValue: string) => string, initialValue: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: boolean[] = [true, false, true, false, true];
        let result: boolean = false;
        const reducer = (acc: boolean, val: boolean): boolean => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduce(reducer, false);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
          'reduce(callbackFn: (previousValue: boolean, currentValue: boolean) => boolean, initialValue: boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: number[] = [1, 2, 3, 4, 5];
        let result: number = 0;
        const reducer = (acc: number, val: number): number => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduceRight(reducer, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduceRight',
          'reduceRight(callbackFn: (previousValue: number, currentValue: number) => number, initialValue: number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string = 'a';
        const reducer = (acc: string, val: string): string => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduceRight(reducer, 'a');
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduceRight',
          'reduceRight(callbackFn: (previousValue: string, currentValue: string) => string, initialValue: string): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let array: boolean[] = [true, false, true, false, true];
        let result: boolean = false;
        const reducer = (acc: boolean, val: boolean): boolean => {
          return val;
        };
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = array.reduceRight(reducer, false);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduceRight',
          'reduceRight(callbackFn: (previousValue: boolean, currentValue: boolean) => boolean, initialValue: boolean): boolean', arkTsAveragedTime);
      done();
      })

  })
}
