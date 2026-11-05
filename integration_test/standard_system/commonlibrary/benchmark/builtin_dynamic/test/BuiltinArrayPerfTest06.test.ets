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

export default function BuiltinArrayPerfTest06(): void {
  describe('BuiltinArrayPerfTest06', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest03_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = 'a';
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray[1];
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'indexAccess',
          'index access: fixArray[1]', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.copyWithin(0, 0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
          'copyWithin(target: int, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.fill('z');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
          'fill(value: char, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string | undefined = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.find((value: string) => value > 'c');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'find',
          'find(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): Char | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: number = -1;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.findIndex((value: string) => value > 'c');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findIndex',
          'findIndex(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.every((value: string) => value >= 'a' && value <= 'e');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'every',
          'every(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.some((value: string) => value > 'd');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'some',
          'some(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.reduce((previousValue: string, currentValue: string) => previousValue + currentValue, "");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
          'reduce<U>(callbackfn: (previousValue: U, currentValue: char, index: int, array: FixedArray<char>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.reduceRight((previousValue: string, currentValue: string) => previousValue + currentValue, "");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
          'reduceRight<U>(callbackfn: (previousValue: U, currentValue: char, index: int, array: FixedArray<char>) => U, initialValue: U): U', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = 'a';
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          fixArray.forEach((value: string, index: number) => { if (index === 2) result = value; });
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
          'forEach(callbackfn: (value: char, index: int, array: FixedArray<char>) => void): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.slice(2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
          'slice(start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);
      done();
      })


    it('PerformanceTest_BuiltinArrayTest03_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'b', 'a'];
        let result: number = -1;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.lastIndexOf('b');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'lastIndexOf',
          'lastIndexOf(element: char, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.join("-");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
          'join(sep?: String): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
          'toString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string = "";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;

        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
          'toLocaleString(): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.includes('c');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'includes',
          'includes(val: char, fromIndex?: int): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: number = -1;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.indexOf('d');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'indexOf',
          'indexOf(val: char, fromIndex?: int): int', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['c', 'a', 'b'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.sort();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
          'sort(comparator?: (a: char, b: char) => int): FixedArray<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.reverse();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
          'reverse(): FixedArray<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: IterableIterator<string> = fixArray.values();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
          'values(): Iterator<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: IterableIterator<[number, string]> = fixArray.entries();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'entries',
          'entries(): Iterator<[int, char]>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c', 'd', 'e'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.filter((v: string) => v > 'b');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
          'filter(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): FixedArray<char>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BuiltinArrayTest03_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let fixArray2: string[] = ['d', 'e', 'f'];
        let result: string[] = [];
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.concat(fixArray2);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
          'concat(...items: FixedArray<char>[]): FixedArray<char>', arkTsAveragedTime);
        expect(res1.length === 6 && result[0] === 'a' && result[1] === 'b' && result[2] === 'c' &&
          result[3] === 'd' && result[4] === 'e' && result[5] === 'f').assertTrue();
        done();
      })


    it('PerformanceTest_BuiltinArrayTest03_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let fixArray: string[] = ['a', 'b', 'c'];
        let result: IterableIterator<number> = fixArray.keys();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = fixArray.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
          'keys(): Iterator<int>', arkTsAveragedTime);
      done();
      })

  })
}
