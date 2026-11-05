/**
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

export default function FunctionPerfTest(): void {
  describe('FunctionPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
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

    it('PerformanceTest_Function_Name_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: Function = () => { return 1; };
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func.name;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function_Name_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function', 'name',
        'get name(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Function0_Invoke0_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: () => number = () => { return 1; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function0_Invoke0_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function0', 'invoke0',
        'invoke0(): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function1_Invoke1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number) => number = (a: number) => { return a + 1; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function1_Invoke1_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function1', 'invoke1',
        'invoke1(p1: P1): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function2_Invoke2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number) => number = (a: number, b: number) => { return a + b; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function2_Invoke2_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function2', 'invoke2',
        'invoke2(p1: P1, p2: P2): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function3_Invoke3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number) => number = (a: number, b: number, c: number) => { return a + b + c; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function3_Invoke3_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function3', 'invoke3',
        'invoke3(p1: P1, p2: P2, p3: P3): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function4_Invoke4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number) => number = (a: number, b: number, c: number, d: number) => { return a + b + c + d; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function4_Invoke4_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function4', 'invoke4',
        'invoke4(p1: P1, p2: P2, p3: P3, p4: P4): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function5_Invoke5_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number) => number = (a: number, b: number, c: number, d: number, e: number) => { return a + b + c + d + e; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function5_Invoke5_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function5', 'invoke5',
        'invoke5(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function6_Invoke6_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number) => { return a + b + c + d + e + f; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function6_Invoke6_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function6', 'invoke6',
        'invoke6(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function7_Invoke7_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number) => { return a + b + c + d + e + f + g; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function7_Invoke7_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function7', 'invoke7',
        'invoke7(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function8_Invoke8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number) => { return a + b + c + d + e + f + g + h; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function8_Invoke8_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function8', 'invoke8',
        'invoke8(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function9_Invoke9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number) => { return a + b + c + d + e + f + g + h + i; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function9_Invoke9_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function9', 'invoke9',
        'invoke9(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function10_Invoke10_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number) => { return a + b + c + d + e + f + g + h + i + j; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function10_Invoke10_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function10', 'invoke10',
        'invoke10(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function11_Invoke11_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number) => { return a + b + c + d + e + f + g + h + i + j + k; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function11_Invoke11_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function11', 'invoke11',
        'invoke11(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function12_Invoke12_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number) => { return a + b + c + d + e + f + g + h + i + j + k + l; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function12_Invoke12_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function12', 'invoke12',
        'invoke12(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11, p12: P12): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function13_Invoke13_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number) => { return a + b + c + d + e + f + g + h + i + j + k + l + m; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function13_Invoke13_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function13', 'invoke13',
        'invoke13(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11, p12: P12, p13: P13): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function14_Invoke14_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number) => { return a + b + c + d + e + f + g + h + i + j + k + l + m + n; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function14_Invoke14_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function14', 'invoke14',
        'invoke14(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11, p12: P12, p13: P13, p14: P14): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function15_Invoke15_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number, o: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number, o: number) => { return a + b + c + d + e + f + g + h + i + j + k + l + m + n + o; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function15_Invoke15_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function15', 'invoke15',
        'invoke15(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11, p12: P12, p13: P13, p14: P14, p15: P15): R', arkTsAveragedTime);
    })

    it('PerformanceTest_Function16_Invoke16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number, o: number, p: number) => number = (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number, k: number, l: number, m: number, n: number, o: number, p: number) => { return a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p; };
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Function16_Invoke16_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Function16', 'invoke16',
        'invoke16(p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9, p10: P10, p11: P11, p12: P12, p13: P13, p14: P14, p15: P15, p16: P16): R', arkTsAveragedTime);
    })

  })
}
