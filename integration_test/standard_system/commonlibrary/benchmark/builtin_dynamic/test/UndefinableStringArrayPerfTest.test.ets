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
} from '@ohos/hypium';
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import { collections } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function UndefinableStringArrayPerfTest(): void {
  describe('UndefinableStringArrayPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_UndefinableStringArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<string | undefined> = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<string | undefined>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: Array<string | undefined> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: Array<string | undefined> = new Array<string | undefined>(10);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<string | undefined>(10);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: Array<string | undefined> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor',
          'constructor(length: number)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let val: string = 'test';
        let res: Array<string | undefined> = new Array<string | undefined>(10).fill(val);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new Array<string | undefined>(10).fill(val);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: Array<string | undefined> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'constructor + fill',
          'constructor(length: number) + fill(value: string): Array<string | undefined>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_ToArray_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<string | undefined> = [];
        arr.push('test');
        let res: Array<string | undefined> = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.slice();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: Array<string | undefined> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_ToArray_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'slice',
          'slice(): Array<string | undefined>', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_UndefinableStringArray_PushBack_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pushArrays: Array<Array<string | undefined>> = [];
        let val: string = 'test';
        for (let i = 0; i < BASE_COUNT; i++) {
          pushArrays.push(new Array<string | undefined>());
        }
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pushArrays[i].push(val);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_PushBack_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'push',
          'push(...items: (string | undefined)[]): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_PopBack_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let popArrays: Array<Array<string | undefined>> = [];
        let val: string = 'test';
        for (let i = 0; i < BASE_COUNT; i++) {
          popArrays.push([val]);
        }
        let res: string | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = popArrays[i].pop();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: string | undefined = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_PopBack_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'pop',
          'pop(): string | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_Size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<string | undefined> = [];
        arr.push('test');
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_Size_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'length',
          'get length(): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_At_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: collections.Array<string | undefined> = collections.Array.from<string | undefined>(['test']);
        let res: string | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.at(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: string | undefined = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_At_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'collections.Array', 'at',
          'at(index: number): string | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_UndefinableStringArray_At_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Array<string | undefined> = ['old'];
        let val: string = 'test';
        arr[0] = val;
        let res: string | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr[0];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: string | undefined = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableStringArray_At_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'operator[]',
          'operator[](index: number): string | undefined', arkTsAveragedTime);
      done();
      })

  })
}
