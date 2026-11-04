/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
} from "../../../hypium/index";
import performance from './Performance.util';

export default function BuiltinArrayPerfTest06(): void {
  describe('BuiltinArrayPerfTest06', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_BuiltinArrayTest03_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [ c'a', c'b', c'c' ];
        let result: Char = c'a';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = at(fixArray, 1);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
            'at(index: int): Char | undefined', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(5, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(fixArray, 0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(5, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(fixArray, 0, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(5, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(fixArray, 0, 3, 4);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(5, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = fill(fixArray, c'z');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
            'fill(value: char, start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: Char | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = find(fixArray, (value: char) => value > c'c');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'find',
            'find(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): Char | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findIndex(fixArray, (value: char) => value > c'c');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findIndex',
            'findIndex(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): int', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: Char | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLast(fixArray, (elem: char) => elem < c'e');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLast',
            'findLast(predicate: (elem: char, index: int, array: FixedArray<char>) => boolean): Char | undefined', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = every(fixArray, (value: char) => value >= c'a' && value <= c'e');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'every',
            'every(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = some(fixArray, (value: char) => value > c'd');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'some',
            'some(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): boolean', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLastIndex(fixArray, (element: char) => element < c'e');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLastIndex',
            'findLastIndex(predicate: (element: char, index: int, array: FixedArray<char>) => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(fixArray, (previousValue: string, currentValue: char) => previousValue + currentValue, "");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
            'reduce<U>(callbackfn: (previousValue: U, currentValue: char, index: int, array: FixedArray<char>) => U, initialValue: U): U', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduceRight(fixArray, (previousValue: string, currentValue: char) => previousValue + currentValue, "");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
            'reduceRight<U>(callbackfn: (previousValue: U, currentValue: char, index: int, array: FixedArray<char>) => U, initialValue: U): U', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: char = c'a';
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            forEach(fixArray, (value: char, index: int) => { if (index === 2) result = value; });
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
            'forEach(callbackfn: (value: char, index: int, array: FixedArray<char>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(fixArray, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
            'slice(start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd' , c'e'];
        let result = new FixedArray<char>(2, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(fixArray, 1, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
            'slice(start?: int, end?: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'b', c'a'];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = lastIndexOf(fixArray, c'b');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_5900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'lastIndexOf',
            'lastIndexOf(element: char, fromIndex?: int): int', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = join(fixArray, "-");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
            'join(sep?: String): string', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toString(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
            'toString(): string', arkTsAveragedTime);
    })
    //原因：locales参数不支持，options参数不支持
    // it('PerformanceTest_BuiltinArrayTest03_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
    //     let locales: Object = "en-US";
    //     let options: Object = new Object();
    //     let result: string = "";
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toLocaleString(fixArray, locales, options);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6200: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //         'toLocaleString(locales: Object, options: Object): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest03_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
    //     let locales: Object = "zh-CN";
    //     let result: string = "";
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toLocaleString(fixArray, locales);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6300: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //         'toLocaleString(locales: Object): string', arkTsAveragedTime);
    // })

    it('PerformanceTest_BuiltinArrayTest03_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a',c'b', c'c'];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toLocaleString(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
            'toLocaleString(): string', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest03_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = new FixedArray<char>(2, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSpliced(fixArray, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
            'toSpliced(start: int): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = new FixedArray<char>(4, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSpliced(fixArray, 1, 2, c'x');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
            'toSpliced(start: int, delete: int, ...items: FixedArray<char>): FixedArray<char>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSpliced(fixArray, 1, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
            'toSpliced(start?: int, delete?: int): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = includes(fixArray, c'c');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'includes',
            'includes(val: char, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = indexOf(fixArray, c'd');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_6900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'indexOf',
            'indexOf(val: char, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'c', c'a', c'b'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSorted(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSorted',
            'toSorted(): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reverse(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
            'reverse(): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toReversed(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toReversed',
            'toReversed(): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = with(fixArray, 1, c'z');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'with',
            'with(index: int, value: char): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = values(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = values(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
            'values(): Iterator<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = entries(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = entries(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'entries',
            'entries(): Iterator<[int, char]>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest03_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = filter(fixArray, (v: char) => v > c'b');
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_7900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
            'filter(predicate: (value: char, index: int, array: FixedArray<char>) => boolean): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let fixArray2: FixedArray<char> = [c'd', c'e', c'f'];
        let result = new FixedArray<char>(6, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = concat(fixArray, fixArray2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_8000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
            'concat(...items: FixedArray<char>[]): FixedArray<char>', arkTsAveragedTime);
    })

     it('PerformanceTest_BuiltinArrayTest03_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'c', c'a', c'b'];
        let result = new FixedArray<char>(3, new Char());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = sort(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_8300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
            'sort(comparator?: (a: char, b: char) => int): FixedArray<char>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
        let result = keys(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = keys(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_8400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
            'keys(): Iterator<int>', arkTsAveragedTime);
    })



    /* 与BuiltinArrayPerfTest02 Test_14200完全重复(FixedArray<int> reduce with initialValue)，已注释
    it('PerformanceTest_BuiltinArrayTest03_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray : FixedArray<int> = [100, 200, 300];
        let result: int = 0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(fixArray, (previousValue: int, currentValue: int) => previousValue + currentValue, 1000);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_8700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
            'reduce<U>(callbackfn: (previousValue: U, currentValue: int, index: int, array: FixedArray<int>) => U, initialValue: U): U', arkTsAveragedTime);
    })
    */

  })
}
