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

export default function BuiltinArrayPerfTest(): void {
  describe('BuiltinArrayPerfTest', () => {
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

    it('PerformanceTest_BuiltinArrayTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean())
      let res = true;
      fixArray[1] = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = at(fixArray, 1)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(index: int): boolean | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean())
      let res = new FixedArray<boolean>(5, new Boolean())
      fixArray[1] = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = copyWithin(fixArray, 0)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(target: int, start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);

    })
    //被判断为重复
    // it('PerformanceTest_BuiltinArrayTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray = new FixedArray<boolean>(5)
    //   let res = new FixedArray<boolean>(5)
    //   fixArray[1] = true;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = copyWithin(fixArray, 0, 0)
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
    //     'copyWithin(target: int, start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);
    //
    // })
    //
    //
    // it('PerformanceTest_BuiltinArrayTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray = new FixedArray<boolean>(5)
    //   let result = new FixedArray<boolean>(5)
    //   fixArray[1] = true;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = copyWithin(fixArray, 4, 1, 4)
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
    //     'copyWithin(target: int, start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);
    // })
    //

    it('PerformanceTest_BuiltinArrayTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean())
      fixArray[1] = true;
      let result = new FixedArray<boolean>(5, new Boolean())
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, false, 0, 5)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(value: boolean, start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[0] = true;
      fixArray[1] = false;
      let result: boolean | undefined = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value) => value === true)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'find',
        'find(predicate: (value: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean | undefined',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[0] = true;
      fixArray[1] = false;
      let result = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findIndex(fixArray, (value) => value === false)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findIndex',
        'findIndex(predicate: (value: boolean, index: int, array: FixedArray<boolean>) => boolean): int',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[3] = false;
      fixArray[2] = true;
      fixArray[4] = true;
      let result: boolean | undefined = false
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (value) => value === true)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLast',
        'findLast(predicate: (elem: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean | undefined',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, true, true];
      let result: boolean | undefined = false
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = every(fixArray, (value) => value === true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'every',
        'every(predicate: (value: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[3] = false;
      fixArray[4] = true;
      let result: boolean | undefined = false
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = some(fixArray, (value) => value === true)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'some',
        'some(predicate: (value: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean',
        arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[3] = false;
      fixArray[2] = true;
      fixArray[4] = true;
      let result = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLastIndex(fixArray, (value) => value === true)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLastIndex',
        'findLastIndex(predicate: (element: boolean, index: int, array: FixedArray<boolean>) => boolean): int',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      let result: boolean | undefined = false
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, (previousValue, currentValue) => previousValue && currentValue);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
        'reduce(callbackfn: (previousValue: boolean, currentValue: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean',
        arkTsAveragedTime);
    })
    it('PerformanceTest_BuiltinArrayTest_01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[0] = true
      fixArray[3] = true
      fixArray[4] = true
      let result = 0
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, (previousValue, currentValue) => previousValue + (currentValue ? 1 : 0), 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduce',
        'reduce<U>(callbackfn: (previousValue: U, currentValue: boolean, index: int, array: FixedArray<boolean>) => U, initialValue: U): U',
        arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[0] = true
      fixArray[3] = true
      fixArray[4] = true
      let result = 0
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, (previousValue, currentValue) => previousValue + (currentValue ? 1 : 0), 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: boolean, currentValue: boolean, index: int, array: FixedArray<boolean>) => boolean): boolean',
        arkTsAveragedTime);
    })



    it('PerformanceTest_BuiltinArrayTest_01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = slice(fixArray, 2)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
        'slice(start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);
    })


    // it('PerformanceTest_BuiltinArrayTest_01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray = new FixedArray<boolean>(5);
    //   let result = new FixedArray<boolean>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = slice(fixArray, 2, 4)
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'slice',
    //     'slice(start?: int, end?: int): FixedArray<boolean>', arkTsAveragedTime);
    // })

    it('PerformanceTest_BuiltinArrayTest_01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray = new FixedArray<boolean>(5, new Boolean());
      fixArray[1] = true
      fixArray[4] = true
      let result = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = lastIndexOf(fixArray, true)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'lastIndexOf',
        'lastIndexOf(element: boolean, fromIndex?: int): int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_01900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_01900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest_02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string', arkTsAveragedTime);

    })



    it('PerformanceTest_BuiltinArrayTest_02300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest_02400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean())
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
        'toSpliced(start: int): FixedArray<boolean>', arkTsAveragedTime);
    })
    it('PerformanceTest_BuiltinArrayTest_02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1, 1, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
        'toSpliced(start: int, delete: int, ...items: FixedArray<boolean>): FixedArray<boolean>', arkTsAveragedTime);

    })


    it('PerformanceTest_BuiltinArrayTest_02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSpliced(fixArray, 1, 1)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSpliced',
        'toSpliced(start?: int, delete?: int): FixedArray<boolean>', arkTsAveragedTime);

    })


    it('PerformanceTest_BuiltinArrayTest_02700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = includes(fixArray, false)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'includes',
        'includes(val: boolean, fromIndex?: int): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = indexOf(fixArray, false)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'indexOf',
        'indexOf(val: boolean, fromIndex?: int): int', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSorted(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_02900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSorted',
        'toSorted(): FixedArray<boolean>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_03000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toSorted(fixArray, (a: boolean, b: boolean) => a === b ? 0 : a ? -1 : 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toSorted',
        'toSorted(comparator?: (a: boolean, b: boolean) => int): FixedArray<boolean>', arkTsAveragedTime);

    })

    it('PerformanceTest_BuiltinArrayTest_03100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reverse(fixArray)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reverse',
        'reverse(): FixedArray<boolean>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toReversed(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toReversed',
        'toReversed(): FixedArray<boolean>', arkTsAveragedTime);
    })
    it('PerformanceTest_BuiltinArrayTest_03300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = with(fixArray, 1, true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'with',
        'with(index: number, value: T): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_03400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let resultct = new FixedArray<boolean>(5, new Boolean());
      let result = values(resultct)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = values(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'values',
        'values(): Iterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_03500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false]
      let resultct = new FixedArray<boolean>(5, new Boolean());
      let result = entries(resultct);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = entries(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'entries',
        'entries(): Iterator<[int, T]>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_03600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, (value: boolean) => !value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(callbackfn: (value: T, index: number) => T): FixedArray<T>', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_03700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = true;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, (prev: boolean, curr: boolean) => prev && curr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'reduceRight',
        'reduceRight(callbackfn: (previousValue: T, currentValue: T, index: number) => T): T', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_03800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true]
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, (value: boolean) => value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(predicate: (value: T, index: number) => boolean): FixedArray<T>', arkTsAveragedTime);

    })
    it('PerformanceTest_BuiltinArrayTest_03900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let fixArray2: FixedArray<boolean> = [true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = concat(fixArray, fixArray2)
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_03900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
        'concat(...items: (T | ConcatArray<T>)[]): FixedArray<T>', arkTsAveragedTime);

    })

    // it('PerformanceTest_BuiltinArrayTest_04000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<boolean> = [true, false, true];
    //   let result = new FixedArray<boolean>(3);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = concat(fixArray, [false, true] as FixedArray<boolean>)
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'concat',
    //     'concat(...items: (T | ConcatArray<T>)[]): FixedArray<T>', arkTsAveragedTime);
    //
    // })

    it('PerformanceTest_BuiltinArrayTest_04100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = [true, false, true] as FixedArray<boolean>;
      }
      let result = new FixedArray<boolean>(3, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(pools[i], (a: boolean, b: boolean): int => (a ? 1 : 0) - (b ? 1 : 0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(compareFn?: (a: T, b: T) => number): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pools: FixedArray<boolean>[] = new Array<FixedArray<boolean>>();
      for (let i = 0; i < BASE_COUNT; i++) {
        pools[i] = [true, false, true] as FixedArray<boolean>;
      }
      let result = new FixedArray<boolean>(3, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(pools[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = keys(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = keys(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
        'keys(): Iterator<number>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result: Byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = at(fixArray, 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'at',
        'at(index: number): T', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(target: number): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(target: number, start: number): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = copyWithin(fixArray, 0, 3, 4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'copyWithin',
        'copyWithin(target: number, start: number, end?: number): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = fill(fixArray, 9);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'fill',
        'fill(value: T, start?: number, end?: number): FixedArray<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_04900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = find(fixArray, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_04900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'find',
        'find(predicate: (value: T, index: number) => boolean): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_05000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findIndex(fixArray, (value: byte) => value > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_05000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findIndex',
        'findIndex(predicate: (value: T, index: number) => boolean): number', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_05100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: Byte | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = findLast(fixArray, (elem: byte) => elem < 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_05100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'findLast',
        'findLast(predicate: (value: T, index: number) => boolean): T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_05200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [2, 4, 6, 8, 10];
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = every(fixArray, (value: byte) => value % 2 === 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_05200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'every',
        'every(predicate: (value: T, index: number) => boolean): boolean', arkTsAveragedTime);
    })
    it('PerformanceTest_BuiltinArrayTest_05300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = some(fixArray, (value: byte) => value > 4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_05300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'some',
        'some(predicate: (value: T, index: number) => boolean): boolean', arkTsAveragedTime);
    })

  })
}

