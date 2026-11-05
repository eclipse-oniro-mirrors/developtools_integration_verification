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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

class MyClass {
    num: int = 1;
    name: string = "test";
}

export default function BuiltinArrayPerfTest05(): void {
  describe('BuiltinArrayPerfTest05', () => {
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

    // MISPLACED: Field.getType 属于Type反射API,不应放在BuiltinArray测试文件中,应移至TypePerfTest
    // it('PerformanceTest_Field_getType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let classType: ClassType = Type.of(new MyClass()) as ClassType;
    //     let fieldNum: Field = classType.getField(0); 
    //     let res: Type = fieldNum.getType();
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         res = fieldNum.getType()
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = res;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getType_0100: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getType',
    //         'getType(): Type', arkTsAveragedTime);
    // })

it('PerformanceTest_BuiltinArrayTest03_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(5, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(fixArray, 0, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): FixedArray<double>', arkTsAveragedTime);

    })


    it('PerformanceTest_BuiltinArrayTest03_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(5, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = copyWithin(fixArray, 0, 3, 4);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
            'copyWithin(target: int, start?: int, end?: int): FixedArray<double>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(5, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = fill(fixArray, 9.99);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
            'fill(value: double, start?: int, end?: int): FixedArray<double>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: Double | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = find(fixArray, (value: double) => value > 3.33);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'find',
            'find(predicate: (value: double, index: int, array: FixedArray<double>) => boolean): Double | undefined', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findIndex(fixArray, (value: double) => value > 3.33);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findIndex',
            'findIndex(predicate: (value: double, index: int, array: FixedArray<double>) => boolean): int', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: Double | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLast(fixArray, (elem: double) => elem < 5.55);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLast',
            'findLast(predicate: (elem: double, index: int, array: FixedArray<double>) => boolean): Double | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = every(fixArray, (value: double) => value > 1.0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'every',
            'every(predicate: (value: double, index: int, array: FixedArray<double>) => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = some(fixArray, (value: double) => value > 5.0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'some',
            'some(predicate: (value: double, index: int, array: FixedArray<double>) => boolean): boolean', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = findLastIndex(fixArray, (element: double) => element < 5.55);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLastIndex',
            'findLastIndex(predicate: (element: double, index: int, array: FixedArray<double>) => boolean): int', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(fixArray, (previousValue: double, currentValue: double) => previousValue + currentValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
            'reduce(callbackfn: (previousValue: double, currentValue: double, index: int, array: FixedArray<double>) => double): double', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduce(fixArray, (previousValue: double, currentValue: double) => previousValue + currentValue, 10.0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
            'reduce<U>(callbackfn: (previousValue: U, currentValue: double, index: int, array: FixedArray<double>) => U, initialValue: U): U', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduceRight(fixArray, (previousValue: string, currentValue: double) => previousValue + currentValue, "");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
            'reduceRight<U>(callbackfn: (previousValue: U, currentValue: double, index: int, array: FixedArray<double>) => U, initialValue: U): U', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest03_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            forEach(fixArray, (value: double, index: int) => { if (index === 2) result = value; });
        }
        let Dtime = new Date().getTime() - Stime;
		let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
            'forEach(callbackfn: (value: double, index: int, array: FixedArray<double>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(fixArray, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
            'slice(start?: int, end?: int): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(2, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = slice(fixArray, 1, 3);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
            'slice(start?: int, end?: int): FixedArray<double>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 2.22, 1.11];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = lastIndexOf(fixArray, 2.22);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'lastIndexOf',
            'lastIndexOf(element: double, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = join(fixArray, "-");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
            'join(sep?: String): string', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toString(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
            'toString(): string', arkTsAveragedTime);

    })
    // 原因：=Error in PerformanceTest_BuiltinArrayTest03_1900, Array.toLocaleString: not implemented
    // it('PerformanceTest_BuiltinArrayTest03_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
    //     let locales: Object = "en-US";
    //     let options: Object = {};
    //     let result = toLocaleString(fixArray, locales, options);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toLocaleString(fixArray, locales, options);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_1900: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //         'toLocaleString(locales: Object, options: Object): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest03_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
    //     let locales: Object = "zh-CN";
    //     let result = toLocaleString(fixArray, locales);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toLocaleString(fixArray, locales);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2000: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //         'toLocaleString(locales: Object): string', arkTsAveragedTime);
    // })

    it('PerformanceTest_BuiltinArrayTest03_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: string = "";
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toLocaleString(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
            'toLocaleString(): string', arkTsAveragedTime);
    })

    // it('PerformanceTest_BuiltinArrayTest03_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
    //     let result = new FixedArray<double>(2);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toSpliced(fixArray, 3);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2200: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
    //         'toSpliced(start: int): FixedArray<double>', arkTsAveragedTime);
    //
    // })
  
    // 5.14 集中运行时出现  TestFinished-ResultMsg: App died

    // it('PerformanceTest_BuiltinArrayTest03_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
    //     let result = new FixedArray<double>(4);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = toSpliced(fixArray, 1, 2, 8.88);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2300: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
    //         'toSpliced(start: int, delete: int, ...items: FixedArray<double>): FixedArray<double>', arkTsAveragedTime);
    // })

    it('PerformanceTest_BuiltinArrayTest03_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSpliced(fixArray, 1, 2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
            'toSpliced(start?: int, delete?: int): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: boolean = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = includes(fixArray, 3.33);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'includes',
            'includes(val: double, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result: int = -1;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = indexOf(fixArray, 4.44);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'indexOf',
            'indexOf(val: double, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSorted(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSorted',
            'toSorted(): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toSorted(fixArray, (a: double, b: double): int => { return b > a ? 1 : -1; });
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSorted',
            'toSorted(comparator?: (a: double, b: double) => int): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reverse(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_2900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
            'reverse(): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = toReversed(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toReversed',
            'toReversed(): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = with(fixArray, 1, 9.99);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'with',
            'with(index: int, value: double): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = values(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = values(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
            'values(): Iterator<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = entries(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = entries(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'entries',
            'entries(): Iterator<[int, double]>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = map(fixArray, (value: double) => value * 2.0);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
            'map<U>(callbackfn: (value: double, index: int, array: FixedArray<double>) => U): FixedArray<U>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result: double = 0.0;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = reduceRight(fixArray, (previousValue: double, currentValue: double) => previousValue + currentValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
            'reduceRight(callbackfn: (previousValue: double, currentValue: double, index: int, array: FixedArray<double>) => double): double', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = filter(fixArray, (v: double) => v > 2.22);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
            'filter(predicate: (value: double, index: int, array: FixedArray<double>) => boolean): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let fixArray2: FixedArray<double> = [4.44, 5.55, 6.66];
        let result = new FixedArray<double>(6, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = concat(fixArray, fixArray2);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
            'concat(...items: FixedArray<double>[]): FixedArray<double>', arkTsAveragedTime);
    })

    // it('PerformanceTest_BuiltinArrayTest03_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
    //     let result = new FixedArray<double>(5);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //         result = concat(fixArray, [4.44, 5.55] as FixedArray<double>);
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = result;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3800: ' + arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
    //         'concat(...items: FixedArray<double>[]): FixedArray<double>', arkTsAveragedTime);
    // })

    it('PerformanceTest_BuiltinArrayTest03_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = sort(fixArray, (a: double, b: double): int => { return a > b ? 1 : -1; });
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_3900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
            'sort(comparator?: (a: double, b: double) => int): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest03_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [3.33, 1.11, 2.22];
        let result = new FixedArray<double>(3, new Double());
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = sort(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
            'sort(comparator?: (a: double, b: double) => int): FixedArray<double>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest03_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
        let result = keys(fixArray);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = keys(fixArray);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest03_4100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
            'keys(): Iterator<int>', arkTsAveragedTime);

    })

  })
}
  
