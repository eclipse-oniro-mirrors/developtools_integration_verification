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

export default function BuiltinArrayPerfTest12(): void {
  describe('BuiltinArrayPerfTest12', () => {
    const BASE_COUNT = 50000;
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

    // ==================== filter self 风格 (7 种类型, char 已在 PerfTest06) ====================

    it('PerformanceTest_BuiltinArrayTest_42500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let filterCb = (v: boolean, k: int, arr: FixedArray<boolean>): boolean => {
        return v == true;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<boolean>, fn: (v: boolean, k: int, array: FixedArray<boolean>) => boolean): FixedArray<boolean>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_42600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let filterCb = (v: byte, k: int, arr: FixedArray<byte>): boolean => {
        return v > 2;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<byte>, fn: (v: byte, k: int, array: FixedArray<byte>) => boolean): FixedArray<byte>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_42700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let filterCb = (v: short, k: int, arr: FixedArray<short>): boolean => {
        return v > 20;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<short>, fn: (v: short, k: int, array: FixedArray<short>) => boolean): FixedArray<short>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_42800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let filterCb = (v: int, k: int, arr: FixedArray<int>): boolean => {
        return v > 200;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<int>, fn: (v: int, k: int, array: FixedArray<int>) => boolean): FixedArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_42900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let filterCb = (v: long, k: int, arr: FixedArray<long>): boolean => {
        return v > 2000;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<long>, fn: (v: long, k: int, array: FixedArray<long>) => boolean): FixedArray<long>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let filterCb = (v: float, k: int, arr: FixedArray<float>): boolean => {
        return v > 2.2f;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<float>, fn: (v: float, k: int, array: FixedArray<float>) => boolean): FixedArray<float>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result = new FixedArray<double>(5, new Double());
      let filterCb = (v: double, k: int, arr: FixedArray<double>): boolean => {
        return v > 2.22;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = filter(fixArray, filterCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'filter',
        'filter(self: FixedArray<double>, fn: (v: double, k: int, array: FixedArray<double>) => boolean): FixedArray<double>', arkTsAveragedTime);
    })

    // ==================== forEach self 风格 (7 种类型, char 已在 PerfTest06) ====================

    it('PerformanceTest_BuiltinArrayTest_43200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result: boolean = true;
      let forEachCb = (value: boolean, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<boolean>, callbackfn: (value: boolean, index: int, array: FixedArray<boolean>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result: byte = 1;
      let forEachCb = (value: byte, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<byte>, callbackfn: (value: byte, index: int, array: FixedArray<byte>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result: short = 10;
      let forEachCb = (value: short, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<short>, callbackfn: (value: short, index: int, array: FixedArray<short>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result: int = 100;
      let forEachCb = (value: int, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<int>, callbackfn: (value: int, index: int, array: FixedArray<int>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result: long = 1000;
      let forEachCb = (value: long, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<long>, callbackfn: (value: long, index: int, array: FixedArray<long>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result: float = 1.1f;
      let forEachCb = (value: float, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<float>, callbackfn: (value: float, index: int, array: FixedArray<float>) => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_43800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result: double = 1.11;
      let forEachCb = (value: double, index: int): void => {
        result = value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        forEach(fixArray, forEachCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'forEach',
        'forEach(self: FixedArray<double>, callbackfn: (value: double, index: int, array: FixedArray<double>) => void): void', arkTsAveragedTime);
    })

    /* 与BuiltinArrayPerfTest08 map段完全重复(7类型: boolean~double)，已注释
    // ==================== map self 风格 (7 种类型, char 已在 PerfTest06) ====================

    it('PerformanceTest_BuiltinArrayTest_43900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let mapCb = (value: boolean): boolean => {
        return !value;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_43900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<boolean>, callbackfn: (value: boolean, index: int, array: FixedArray<boolean>) => boolean): FixedArray<boolean>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [1, 2, 3, 4, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let mapCb = (value: byte): byte => {
        return Int.toByte(value + 1);
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<byte>, callbackfn: (value: byte, index: int, array: FixedArray<byte>) => byte): FixedArray<byte>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = new FixedArray<short>(5, new Short());
      let mapCb = (value: short): short => {
        return Int.toShort(value + 10);
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<short>, callbackfn: (value: short, index: int, array: FixedArray<short>) => short): FixedArray<short>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [100, 200, 300, 400, 500];
      let result = new FixedArray<int>(5, new Int());
      let mapCb = (value: int): int => {
        return value + 100;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<int>, callbackfn: (value: int, index: int, array: FixedArray<int>) => int): FixedArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [1000, 2000, 3000, 4000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let mapCb = (value: long): long => {
        return value + 1000;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<long>, callbackfn: (value: long, index: int, array: FixedArray<long>) => long): FixedArray<long>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let mapCb = (value: float): float => {
        return value + 1.0f;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<float>, callbackfn: (value: float, index: int, array: FixedArray<float>) => float): FixedArray<float>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_44500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [1.11, 2.22, 3.33, 4.44, 5.55];
      let result = new FixedArray<double>(5, new Double());
      let mapCb = (value: double): double => {
        return value + 1.0;
      };
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map(fixArray, mapCb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_44500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'map',
        'map(self: FixedArray<double>, callbackfn: (value: double, index: int, array: FixedArray<double>) => double): FixedArray<double>', arkTsAveragedTime);
    })
    */

  })
}
