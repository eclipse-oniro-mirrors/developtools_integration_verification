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

export default function BuiltinArrayPerfTest16(): void {
  describe('BuiltinArrayPerfTest16', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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

    // ==================== reduce ====================

    it('PerformanceTest_BuiltinArrayTest_50000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: byte = 0;
      let reducer = (acc: byte, val: byte): byte => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<byte>, byte, byte, int, FixedArray<byte>): => byte): byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: char = c'a';
      let reducer = (acc: char, val: char): char => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, c'a');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<char>, char, char, int, FixedArray<char>): => char): char', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: float = 0.0f;
      let reducer = (acc: float, val: float): float => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, 0.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<float>, float, float, int, FixedArray<float>): => float): float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: int = 0;
      let reducer = (acc: int, val: int): int => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<int>, int, int, int, FixedArray<int>): => int): int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: long = 0;
      let reducer = (acc: long, val: long): long => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<long>, long, long, int, FixedArray<long>): => long): long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: short = 0;
      let reducer = (acc: short, val: short): short => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(FixedArray<short>, short, short, int, FixedArray<short>): => short): short', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: boolean = false;
      let reducer = (acc: boolean, val: boolean): boolean => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<boolean>, boolean, boolean, int, ValueArray<boolean>): => boolean): boolean', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: byte = 0;
      let reducer = (acc: byte, val: byte): byte => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<byte>, byte, byte, int, ValueArray<byte>): => byte): byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: double = 0.0;
      let reducer = (acc: double, val: double): double => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<double>, double, double, int, ValueArray<double>): => double): double', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_50900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: float = 0.0f;
      let reducer = (acc: float, val: float): float => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_50900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<float>, float, float, int, ValueArray<float>): => float): float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: int = 0;
      let reducer = (acc: int, val: int): int => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<int>, int, int, int, ValueArray<int>): => int): int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: long = 0;
      let reducer = (acc: long, val: long): long => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<long>, long, long, int, ValueArray<long>): => long): long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: short = 0;
      let reducer = (acc: short, val: short): short => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduce(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduce',
        'reduce(ValueArray<short>, short, short, int, ValueArray<short>): => short): short', arkTsAveragedTime);
    })


    // ==================== reduceRight ====================

    it('PerformanceTest_BuiltinArrayTest_51300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: byte = 0;
      let reducer = (acc: byte, val: byte): byte => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<byte>, byte, byte, int, FixedArray<byte>): => byte): byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: char = c'a';
      let reducer = (acc: char, val: char): char => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, c'a');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<char>, char, char, int, FixedArray<char>): => char): char', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: float = 0.0f;
      let reducer = (acc: float, val: float): float => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, 0.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<float>, float, float, int, FixedArray<float>): => float): float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: int = 0;
      let reducer = (acc: int, val: int): int => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<int>, int, int, int, FixedArray<int>): => int): int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: long = 0;
      let reducer = (acc: long, val: long): long => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<long>, long, long, int, FixedArray<long>): => long): long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: short = 0;
      let reducer = (acc: short, val: short): short => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(fixArray, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(FixedArray<short>, short, short, int, FixedArray<short>): => short): short', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_51900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<boolean> = [true, false, true, false, true];
      let result: boolean = false;
      let reducer = (acc: boolean, val: boolean): boolean => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, false);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_51900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<boolean>, boolean, boolean, int, ValueArray<boolean>): => boolean): boolean', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<byte> = [1, 2, 3, 4, 5];
      let result: byte = 0;
      let reducer = (acc: byte, val: byte): byte => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<byte>, byte, byte, int, ValueArray<byte>): => byte): byte', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<char> = [c'a', c'b', c'c', c'd', c'e'];
      let result: char = c'a';
      let reducer = (acc: char, val: char): char => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, c'a');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<char>, char, char, int, ValueArray<char>): => char): char', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: double = 0.0;
      let reducer = (acc: double, val: double): double => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<double>, double, double, int, ValueArray<double>): => double): double', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: float = 0.0f;
      let reducer = (acc: float, val: float): float => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0.0f);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<float>, float, float, int, ValueArray<float>): => float): float', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<int> = [100, 200, 300, 400, 500];
      let result: int = 0;
      let reducer = (acc: int, val: int): int => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<int>, int, int, int, ValueArray<int>): => int): int', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: long = 0;
      let reducer = (acc: long, val: long): long => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<long>, long, long, int, ValueArray<long>): => long): long', arkTsAveragedTime);
    })


    it('PerformanceTest_BuiltinArrayTest_52600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let va: ValueArray<short> = [10, 20, 30, 40, 50];
      let result: short = 0;
      let reducer = (acc: short, val: short): short => {
        return val;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reduceRight(va, reducer, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_52600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueArray', 'reduceRight',
        'reduceRight(ValueArray<short>, short, short, int, ValueArray<short>): => short): short', arkTsAveragedTime);
    })


  })
}
