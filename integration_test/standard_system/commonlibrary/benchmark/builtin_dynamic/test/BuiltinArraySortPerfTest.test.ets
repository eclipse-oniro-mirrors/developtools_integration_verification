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

export default function BuiltinArraySortPerfTest(): void {
  describe('BuiltinArraySortPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArraySortPerfTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: number[][] = new Array<number[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = [3, 1, 2];
        }
        let cmp = (lhs: number, rhs: number): number => {
          return lhs - rhs;
        };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(compareFn?: (a: number, b: number) => number): number[]',
          arkTsAveragedTime);
;
;
        done();
      })

    it('PerformanceTest_BuiltinArraySortPerfTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: boolean[][] = new Array<boolean[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = [true, false, true];
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(): boolean[]',
          arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArraySortPerfTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: boolean[] = [true, false, true];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          let temp = fixArray[0];
          fixArray[0] = fixArray[1];
          fixArray[1] = temp;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = fixArray;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'manualSwap',
          'manual swap of two elements', arkTsAveragedTime);
        done();
      })

    it('PerformanceTest_BuiltinArraySortPerfTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: boolean[][] = new Array<boolean[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = [true, false, true];
        }
        let cmp = (lhs: boolean, rhs: boolean): number => {
          return lhs === rhs ? 0 : (lhs ? 1 : -1);
        };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort(cmp);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(compareFn?: (a: boolean, b: boolean) => number): boolean[]',
          arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArraySortPerfTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: number[][] = new Array<number[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = [3, 1, 2];
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(): number[]',
          arkTsAveragedTime);
;
      done();
      })

    it('PerformanceTest_BuiltinArraySortPerfTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: string[][] = new Array<string[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = ['c', 'a', 'b'];
        }
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(): string[]',
          arkTsAveragedTime);
;
      done();
      })


    it('PerformanceTest_BuiltinArraySortPerfTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: string[][] = new Array<string[]>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pools[j] = ['c', 'a', 'b'];
        }
        let cmp = (lhs: string, rhs: string): boolean => {
          return lhs < rhs;
        };
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          pools[i].sort((a, b) => cmp(a, b) ? -1 : 1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = pools[0];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArraySortPerfTest_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
          'sort(compareFn?: (a: string, b: string) => number): string[]',
          arkTsAveragedTime);
;
      done();
      })

  })
}
