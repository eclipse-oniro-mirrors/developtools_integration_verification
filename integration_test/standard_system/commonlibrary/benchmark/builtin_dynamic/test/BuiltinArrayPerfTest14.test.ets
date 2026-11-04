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

export default function BuiltinArrayPerfTest14(): void {
  describe('BuiltinArrayPerfTest14', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: number[] = [1, 2, 3, 4, 5];
        let result: number = 2;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray[1];
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'at',
          'at(number[], number): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let va: boolean[] = [true, false, true, false, true];
        let result: boolean = true;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = va[1];
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'at',
          'at(boolean[], number): Boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let va: number[] = [10, 20, 30, 40, 50];
        let result: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = va[1];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'at',
          'at(index: number): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: boolean[] = [true, false, true, false, true];
        let fixArray2: boolean[] = [false, true, false, true, false];
        let result: boolean[] = new Array<boolean>();
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.concat(fixArray2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'concat',
          'concat(boolean[], boolean[], FixedArray<boolean[]>): boolean[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: number[] = [1, 2, 3, 4, 5];
        let fixArray2: number[] = [6, 7, 8, 9, 10];
        let result: number[] = new Array<number>();
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.concat(fixArray2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'concat',
          'concat(number[], number[], FixedArray<number[]>): number[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let va: boolean[] = [true, false, true, false, true];
        let va2: boolean[] = [false, true, false, true, false];
        let result: boolean[] = [true, false, true, false, true];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = va.concat(va2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'concat',
          'concat(boolean[], boolean[], FixedArray<boolean[]>): boolean[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let va: number[] = [1, 2, 3, 4, 5];
        let va2: number[] = [6, 7, 8, 9, 10];
        let result: number[] = [1, 2, 3, 4, 5];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = va.concat(va2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'concat',
          'concat(number[], number[], FixedArray<number[]>): number[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: number[] = [1, 2, 3, 4, 5];
        let arrayPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: number[] = new Array<number>();
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].copyWithin(0, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
          'copyWithin(number[], number): number[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: boolean[] = [true, false, true, false, true];
        let arrayPool: Array<boolean[]> = new Array<boolean[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: boolean[] = [true, false, true, false, true];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].copyWithin(0, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
          'copyWithin(boolean[], number): boolean[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: number[] = [1, 2, 3, 4, 5];
        let arrayPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: number[] = [1, 2, 3, 4, 5];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].copyWithin(0, 0);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
          'copyWithin(number[], number): number[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: number[] = [1, 2, 3, 4, 5];
        let arrayPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: number[] = new Array<number>();
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].fill(99);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'fill',
          'fill(number[], number, number, number): number[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: boolean[] = [true, false, true, false, true];
        let arrayPool: Array<boolean[]> = new Array<boolean[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: boolean[] = [true, false, true, false, true];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].fill(false);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'fill',
          'fill(boolean[], boolean, number, number): boolean[]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let sourceArray: number[] = [1, 2, 3, 4, 5];
        let arrayPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          arrayPool[i] = sourceArray.slice();
        }
        let result: number[] = [1, 2, 3, 4, 5];
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = arrayPool[i].fill(99);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'fill',
          'fill(number[], number, number, number): number[]', arkTsAveragedTime);
      done();
      })

  })
}
