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

export default function ReadonlyArrayPerfTest(): void {
  describe('ReadonlyArrayPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

it('PerformanceTest_ReadonlyArray_FindIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.findIndex((value: number, index: number, obj: ReadonlyArray<number>) => { return value === 3; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_FindIndex_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'findIndex',
        'findIndex(predicate: (value: T, index: int, obj: ReadonlyArray<T>) => boolean): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_ForEach_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((value: number, index: number, array: ReadonlyArray<number>) => { res = value; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ForEach_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'forEach',
        'forEach(action: (value: T, index: int, array: ReadonlyArray<T>) => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Join_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.join(',');
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Join_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'join',
        'join(separator?: string): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Includes_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.includes(3);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Includes_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'includes',
        'includes(searchElement: T, fromIndex?: int): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_IndexOf_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.indexOf(3);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_IndexOf_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'indexOf',
        'indexOf(searchElement: T, fromIndex?: int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Keys_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: IterableIterator<number> = arr.keys();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.keys();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Keys_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'keys',
        'keys(): IterableIterator<int>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_LastIndexOf_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 2, 1] as number[];
      let res: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_LastIndexOf_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'lastIndexOf',
        'lastIndexOf(searchElement: T): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_LastIndexOfFromIndex_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 2, 1] as number[];
      let res: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.lastIndexOf(2, 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_LastIndexOfFromIndex_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'lastIndexOf',
        'lastIndexOf(searchElement: T, fromIndex?: int): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Map_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.map((value: number, index: number, array: ReadonlyArray<number>) => { return value * 2; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Map_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'map',
        'map<U>(mapper: (value: T, index: int, array: ReadonlyArray<T>) => U): Array<U>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Reduce_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: ReadonlyArray<number>) => { return previousValue + currentValue; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Reduce_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduce',
        'reduce(reducer: (previousValue: T, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => T): T', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_ReduceWithInitial_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduce((previousValue: number, currentValue: number, currentIndex: number, array: ReadonlyArray<number>) => { return previousValue + currentValue; }, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceWithInitial_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduce',
        'reduce<U>(reducer: (previousValue: U, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_ReduceRight_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: ReadonlyArray<number>) => { return previousValue + currentValue; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceRight_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduceRight',
        'reduceRight(reducer: (previousValue: T, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => T): T', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_ReduceRightWithInitial_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.reduceRight((previousValue: number, currentValue: number, currentIndex: number, array: ReadonlyArray<number>) => { return previousValue + currentValue; }, 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_ReduceRightWithInitial_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'reduceRight',
        'reduceRight<U>(reducer: (previousValue: U, currentValue: T, currentIndex: int, array: ReadonlyArray<T>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Slice_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: number[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice(1, 3);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Slice_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'slice',
        'slice(start?: int, end?: int): Array<T>', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Some_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.some((value: number, index: number, array: ReadonlyArray<number>) => { return value > 3; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Some_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'some',
        'some(predicate: (value: T, index: int, array: ReadonlyArray<T>) => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ReadonlyArray_Values_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5] as number[];
      let res: IterableIterator<number> = arr.values();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.values();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReadonlyArray_Values_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ReadonlyArray', 'values', 'values(): IterableIterator<T>', arkTsAveragedTime);
      done();
    })

  })
}