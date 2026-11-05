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

export default function ListIntPerfTest(): void {
  describe('ListIntPerfTest', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ListInt_PushFront_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let listPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          listPool[i] = new Array<number>();
        }
        let varObj: number = 0;
        let res: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = listPool[i].unshift(varObj);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_PushFront_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'unshift',
          'unshift(...items: T[]): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_PopFront_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let listPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          listPool[i] = [i];
        }
        let res: number | undefined = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = listPool[i].shift();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_PopFront_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'shift',
          'shift(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_PushBack_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let listPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          listPool[i] = new Array<number>();
        }
        let varObj: number = 0;
        let res: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = listPool[i].push(varObj);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_PushBack_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'push',
          'push(...items: T[]): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_PopBack_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let listPool: Array<number[]> = new Array<number[]>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          listPool[i] = [i];
        }
        let res: number | undefined = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = listPool[i].pop();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_PopBack_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'pop',
          'pop(): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_Size_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: number[] = [1];
        let currentSize: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          currentSize = list.length;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = currentSize;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_Size_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'length',
          'length: number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_At_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: number[] = [1];
        let res: number | undefined = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list[0];
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_At_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'indexAccess',
          'array[index]: T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_Set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: number[] = [1];
        let val: number = 2;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          list[0] = val;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = list[0];
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_Set_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'indexAssignment',
          'array[index] = value', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListInt_Has_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let val: number = 1;
        let list: number[] = [val];
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.includes(val);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListInt_Has_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'includes',
          'includes(searchElement: T, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
      })
  })
}