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

export default function BuiltinArrayPerfTest11(): void {
  describe('BuiltinArrayPerfTest11', () => {
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

    // ==================== sort 实例风格 (8 种类型) ====================

    it('PerformanceTest_BuiltinArrayTest_41000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<boolean>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [3, 1, 4, 2, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<byte>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<short> = [30, 10, 40, 20, 50];
      let result = new FixedArray<short>(5, new Short());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<short>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<int> = [300, 100, 400, 200, 500];
      let result = new FixedArray<int>(5, new Int());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<int>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<long> = [3000, 1000, 4000, 2000, 5000];
      let result = new FixedArray<long>(5, new Long());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<long>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<float> = [3.3f, 1.1f, 4.4f, 2.2f, 5.5f];
      let result = new FixedArray<float>(5, new Float());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<float>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<double> = [3.33, 1.11, 4.44, 2.22, 5.55];
      let result = new FixedArray<double>(5, new Double());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<double>', arkTsAveragedTime);
    })

    it('PerformanceTest_BuiltinArrayTest_41700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<char> = [c'c', c'a', c'd', c'b', c'e'];
      let result = new FixedArray<char>(5, new Char());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(): FixedArray<char>', arkTsAveragedTime);
    })

    // ==================== sort self 风格 (7 种类型, char 已在 builtinArrayPerfTest06) ====================

    /* 41800 与 41000 完全重复：代码、数据、调用完全一致，仅 keyword 从 'sort(): FixedArray<boolean>'
       变为 'sort(self: FixedArray<boolean>): FixedArray<boolean>'，注释掉 */
    /* it('PerformanceTest_BuiltinArrayTest_41800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<boolean> = [true, false, true, false, true];
      let result = new FixedArray<boolean>(5, new Boolean());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(self: FixedArray<boolean>): FixedArray<boolean>', arkTsAveragedTime);
    }) */

    /* 41900 与 41100 完全重复：代码、数据、调用完全一致，仅 keyword 从 'sort(): FixedArray<byte>'
       变为 'sort(self: FixedArray<byte>): FixedArray<byte>'，注释掉 */
    /* it('PerformanceTest_BuiltinArrayTest_41900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fixArray: FixedArray<byte> = [3, 1, 4, 2, 5];
      let result = new FixedArray<byte>(5, new Byte());
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = sort(fixArray);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_41900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
        'sort(self: FixedArray<byte>): FixedArray<byte>', arkTsAveragedTime);
    }) */

    // it('PerformanceTest_BuiltinArrayTest_42000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<short> = [30, 10, 40, 20, 50];
    //   let result = new FixedArray<short>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = sort(fixArray);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
    //     'sort(self: FixedArray<short>): FixedArray<short>', arkTsAveragedTime);
    // })
    //
    // it('PerformanceTest_BuiltinArrayTest_42100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<int> = [300, 100, 400, 200, 500];
    //   let result = new FixedArray<int>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = sort(fixArray);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
    //     'sort(self: FixedArray<int>): FixedArray<int>', arkTsAveragedTime);
    // })
    //
    // it('PerformanceTest_BuiltinArrayTest_42200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<long> = [3000, 1000, 4000, 2000, 5000];
    //   let result = new FixedArray<long>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = sort(fixArray);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
    //     'sort(self: FixedArray<long>): FixedArray<long>', arkTsAveragedTime);
    // })
    //
    // it('PerformanceTest_BuiltinArrayTest_42300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<float> = [3.3f, 1.1f, 4.4f, 2.2f, 5.5f];
    //   let result = new FixedArray<float>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = sort(fixArray);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
    //     'sort(self: FixedArray<float>): FixedArray<float>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_BuiltinArrayTest_42400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let fixArray: FixedArray<double> = [3.33, 1.11, 4.44, 2.22, 5.55];
    //   let result = new FixedArray<double>(5);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     result = sort(fixArray);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = result;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BuiltinArrayTest_42400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'FixedArray', 'sort',
    //     'sort(self: FixedArray<double>): FixedArray<double>', arkTsAveragedTime);
    // })

  })
}
