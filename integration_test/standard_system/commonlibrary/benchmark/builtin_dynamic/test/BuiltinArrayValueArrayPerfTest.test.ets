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

export default function BuiltinArrayValueArrayPerfTest(): void {
    describe('BuiltinArrayValueArrayPerfTest', () => {
        const BASE_COUNT = 1000;

        beforeEach(() => {
            ArkTools.forceFullGC();
        })

        afterAll(() => {
            performance.save('apiPerformance.txt');
        })

        it('PerformanceTest_ValueArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: collections.Array<number> = collections.Array.from<number>([1, 2, 3, 4, 5]);
                let res: number | undefined = undefined;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.at(1);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0100: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'collections.Array', 'at',
                    'at(index: number): number | undefined', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let preparedValues: number[][] = [];
                for (let i = 0; i < BASE_COUNT; i++) {
                    preparedValues.push([1, 2, 3, 4, 5]);
                }
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = preparedValues[i].copyWithin(0, 0);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0200: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'copyWithin',
                    'copyWithin(target: number, start?: number, end?: number): number[]', arkTsAveragedTime);
      done();
            })


        it('PerformanceTest_ValueArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let preparedValues: number[][] = [];
                for (let i = 0; i < BASE_COUNT; i++) {
                    preparedValues.push([1, 2, 3, 4, 5]);
                }
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = preparedValues[i].fill(9);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0300: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'fill',
                    'fill(value: number, start?: number, end?: number): number[]', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let predicate: (value: number) => boolean = (value: number): boolean => value > 3;
                let res: number | undefined = undefined;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.find(predicate);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0400: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'find',
                    'find(predicate: (value: number, index: number, array: number[]) => boolean): number | undefined', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let predicate: (value: number) => boolean = (value: number): boolean => value > 3;
                let res: number = -1;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.findIndex(predicate);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0500: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'findIndex',
                    'findIndex(predicate: (value: number, index: number, array: number[]) => boolean): number', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let predicate: (value: number) => boolean = (value: number): boolean => value > 0;
                let res: boolean = false;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.every(predicate);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0600: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'every',
                    'every(predicate: (value: number, index: number, array: number[]) => boolean): boolean', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let predicate: (value: number) => boolean = (value: number): boolean => value > 4;
                let res: boolean = false;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.some(predicate);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0700: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'some',
                    'some(predicate: (value: number, index: number, array: number[]) => boolean): boolean', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let reducer: (previousValue: number, currentValue: number) => number =
                    (previousValue: number, currentValue: number): number => previousValue + currentValue;
                let res: number = 0;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.reduce(reducer);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0800: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
                    'reduce(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: number[]) => number): number', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let reducer: (previousValue: number, currentValue: number) => number =
                    (previousValue: number, currentValue: number): number => previousValue + currentValue;
                let initialValue: number = 10;
                let res: number = 0;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.reduce(reducer, initialValue);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_0900: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reduce',
                    'reduce(callbackfn: (previousValue: number, currentValue: number, currentIndex: number, array: number[]) => number, initialValue: number): number', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let callbackValue: number = 0;
                let res: void = undefined;
                let callback: (value: number, index: number) => void =
                    (value: number, index: number): void => {
                        callbackValue = value + index;
                    };
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.forEach(callback);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1: void = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1000: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'forEach',
                    'forEach(callbackfn: (value: number, index: number, array: number[]) => void): void', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.slice(2);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1100: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'slice',
                    'slice(start?: number, end?: number): number[]', arkTsAveragedTime);
      done();
            })


        it('PerformanceTest_ValueArrayTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: number = -1;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.lastIndexOf(2);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1200: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'lastIndexOf',
                    'lastIndexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: string = '';
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.join('-');
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1300: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'join',
                    'join(separator?: string): string', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: string = '';
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.toString();
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1400: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'toString',
                    'toString(): string', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: boolean = false;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.includes(3);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1500: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'includes',
                    'includes(searchElement: number, fromIndex?: number): boolean', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3, 4, 5];
                let res: number = -1;
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.indexOf(4);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1600: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'indexOf',
                    'indexOf(searchElement: number, fromIndex?: number): number', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let preparedValues: number[][] = [];
                for (let i = 0; i < BASE_COUNT; i++) {
                    preparedValues.push([3, 1, 2]);
                }
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = preparedValues[i].reverse();
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1700: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'reverse',
                    'reverse(): number[]', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3];
                let res: IterableIterator<number> = valArray.values();
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.values();
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1800: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'values',
                    'values(): IterableIterator<number>', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3];
                let res: IterableIterator<[number, number]> = valArray.entries();
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.entries();
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_1900: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'entries',
                    'entries(): IterableIterator<[number, number]>', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3];
                let callback: (value: number) => number = (value: number): number => value * 2;
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.map(callback);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2000: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'map',
                    'map(callbackfn: (value: number, index: number, array: number[]) => number): number[]', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3];
                let predicate: (value: number) => boolean = (value: number): boolean => value > 1;
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.filter(predicate);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2100: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'filter',
                    'filter(predicate: (value: number, index: number, array: number[]) => boolean): number[]', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let comparator: (a: number, b: number) => number =
                    (a: number, b: number): number => a - b;
                let preparedValues: number[][] = [];
                for (let i = 0; i < BASE_COUNT; i++) {
                    preparedValues.push([3, 1, 2]);
                }
                let res: number[] = [];
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = preparedValues[i].sort(comparator);
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2200: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'sort',
                    'sort(compareFn?: (a: number, b: number) => number): number[]', arkTsAveragedTime);
      done();
            })

        it('PerformanceTest_ValueArrayTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            (done: Function) => {
                let valArray: number[] = [1, 2, 3];
                let res: IterableIterator<number> = valArray.keys();
                let Stime = systemDateTime.getTime(true);
                for (let i = 0; i < BASE_COUNT; i++) {
                    res = valArray.keys();
                }
                let Dtime = systemDateTime.getTime(true) - Stime;
                let res1 = res;
                let arkTsAveragedTime = Dtime / BASE_COUNT;
                console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueArrayTest_2300: ' + arkTsAveragedTime + 'ns');
                performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'keys',
                    'keys(): IterableIterator<number>', arkTsAveragedTime);
      done();
            })

    })
}
