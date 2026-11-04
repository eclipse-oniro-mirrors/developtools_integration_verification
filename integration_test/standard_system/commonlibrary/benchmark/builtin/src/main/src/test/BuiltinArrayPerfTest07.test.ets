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

export default function BuiltinArrayPerfTest07(): void {
  describe('BuiltinArrayPerfTest07', () => {
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

    // ==================== forEach (8 类型) ====================

    it('PerformanceTest_BuiltinArrayTest_30000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result: boolean = true;
      let forEachBoolCb = (value: boolean, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachBoolCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: boolean, index: int, array: FixedArray<boolean>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result: Byte = 0;
      let forEachByteCb = (value: byte, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachByteCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: byte, index: int, array: FixedArray<byte>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30];
      let result: Short = 0;
      let forEachShortCb = (value: short, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachShortCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: short, index: int, array: FixedArray<short>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300];
      let result: int = 0;
      let forEachIntCb = (value: int, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachIntCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: int, index: int, array: FixedArray<int>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000];
      let result: long = 0;
      let forEachLongCb = (value: long, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachLongCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: long, index: int, array: FixedArray<long>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result: float = 0.0f;
      let forEachFloatCb = (value: float, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachFloatCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: float, index: int, array: FixedArray<float>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
      let result: double = 0.0;
      let forEachDoubleCb = (value: double, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachDoubleCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: double, index: int, array: FixedArray<double>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
      let result: Char = c'a';
      let forEachCharCb = (value: char, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCharCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(callbackfn: (value: char, index: int, array: FixedArray<char>) => void): void', arkTsAveragedTime);
    })

    // ==================== toLocaleString (无参, 8 类型) ====================

    it('PerformanceTest_BuiltinArrayTest_30800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<boolean>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_30900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_30900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<byte>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<short>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<int>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<long>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<float>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<double>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_31500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toLocaleString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
        'toLocaleString(): string (FixedArray<char>)', arkTsAveragedTime);
    })

    // ==================== toLocaleString (1个Object参数, 8 类型) - 暂注释 ====================
    // 原因：Array.toLocaleString: not implemented

    // it('PerformanceTest_BuiltinArrayTest_31600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<boolean> = [true, false, true];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31600: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_31700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<byte> = [1, 2, 3];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_31800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<short> = [10, 20, 30];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_31900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<int> = [100, 200, 300];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_31900: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_32000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<long> = [1000, 2000, 3000];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_32100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_32200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_32300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
    //   let locales: Object = "en-US";
    //   let result = toLocaleString(fixArray, locales);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = toLocaleString(fixArray, locales);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toLocaleString',
    //     'toLocaleString(locales?: string | string[]): string', arkTsAveragedTime);
    // })

    // ==================== toString (8 类型) ====================

    it('PerformanceTest_BuiltinArrayTest_32400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<boolean>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_32500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<byte>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_32600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<short>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_32700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<int>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_32800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<long>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_32900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_32900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<float>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<double>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = toString(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'toString',
        'toString(): string (FixedArray<char>)', arkTsAveragedTime);
    })

    // ==================== join (8 类型) ====================

    it('PerformanceTest_BuiltinArrayTest_33200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<boolean>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<byte>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<short>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<int>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<long>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<float>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<double>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_33900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'a', c'b', c'c'];
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = join(fixArray, '-');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_33900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'join',
        'join(sep?: String): string (FixedArray<char>)', arkTsAveragedTime);
    })

    // ==================== keys (boolean, byte, short) ====================

    it('PerformanceTest_BuiltinArrayTest_34000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true];
      let result = keys(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = keys(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_34000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
        'keys(): Iterator<number> (FixedArray<boolean>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_34100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3];
      let result = keys(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = keys(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_34100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
        'keys(): Iterator<number> (FixedArray<byte>)', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_34200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30];
      let result = keys(fixArray);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = keys(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_34200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'keys',
        'keys(): Iterator<number> (FixedArray<short>)', arkTsAveragedTime);
    })

  })
}
