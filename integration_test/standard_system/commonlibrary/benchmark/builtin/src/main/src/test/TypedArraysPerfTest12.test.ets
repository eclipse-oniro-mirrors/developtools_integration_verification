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

export default function TypedArraysPerfTest12(): void {
  describe('TypedArraysPerfTest12', () => {
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

    // ==================== Int8Array 迭代函数 ====================

    it('PerformanceTest_Int8Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((x: number, idx: int, src: Int8Array): boolean => x > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'some', 'some((number, int, Int8Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: int, src: Int8Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduce', 'reduce((number, number, int, Int8Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: int, src: Int8Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduceRight', 'reduceRight((number, number, int, Int8Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: Int8Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: int, src: Int8Array): number => x * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'map', 'map((number, int, Int8Array): => number): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: int, src: Int8Array): boolean => x > 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'every', 'every((number, int, Int8Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: Int8Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: int, src: Int8Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'filter', 'filter((number, int, Int8Array): => boolean): Int8Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: int, src: Int8Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'find', 'find((number, int, Int8Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: int, src: Int8Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findIndex', 'findIndex((number, int, Int8Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((x: number, idx: int, src: Int8Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findLast', 'findLast((number, int, Int8Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((x: number, idx: int, src: Int8Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findLastIndex', 'findLastIndex((number, int, Int8Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: int, src: Int8Array): void => { let v = x; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'forEach', 'forEach((number, int, Int8Array): => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int8Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int8Array = new Int8Array([1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]);
      let result: Int8Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'valueOf', 'valueOf(): Int8Array', arkTsAveragedTime);
    })

    // ==================== Int16Array 迭代函数补充 ====================

    it('PerformanceTest_Int16Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: int, src: Int16Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'reduce', 'reduce((number, number, int, Int16Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: int, src: Int16Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'reduceRight', 'reduceRight((number, number, int, Int16Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: int, src: Int16Array): number => x * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'map', 'map((number, int, Int16Array): => number): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: int, src: Int16Array): boolean => x > 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'every', 'every((number, int, Int16Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: int, src: Int16Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'filter', 'filter((number, int, Int16Array): => boolean): Int16Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: int, src: Int16Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'find', 'find((number, int, Int16Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: int, src: Int16Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'findIndex', 'findIndex((number, int, Int16Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((x: number, idx: int, src: Int16Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'findLast', 'findLast((number, int, Int16Array): => boolean): short', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((x: number, idx: int, src: Int16Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'findLastIndex', 'findLastIndex((number, int, Int16Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: int, src: Int16Array): void => { let v = x; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'forEach', 'forEach((number, int, Int16Array): => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int16Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'valueOf', 'valueOf(): Int16Array', arkTsAveragedTime);
    })

    // ==================== Int32Array 迭代函数补充 ====================

    it('PerformanceTest_Int32Array_some', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((x: number, idx: int, src: Int32Array): boolean => x > 3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'some', 'some((number, int, Int32Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_reduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: int, src: Int32Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'reduce', 'reduce((number, number, int, Int32Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_reduceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: int, src: Int32Array): number => prev + cur);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'reduceRight', 'reduceRight((number, number, int, Int32Array): => number): number', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_map', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: int, src: Int32Array): number => x * 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'map', 'map((number, int, Int32Array): => number): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_every', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: int, src: Int32Array): boolean => x > 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'every', 'every((number, int, Int32Array): => boolean): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_filter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: int, src: Int32Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'filter', 'filter((number, int, Int32Array): => boolean): Int32Array', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_find', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: int, src: Int32Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'find', 'find((number, int, Int32Array): => boolean): number | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_findIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: int, src: Int32Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'findIndex', 'findIndex((number, int, Int32Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_findLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLast((x: number, idx: int, src: Int32Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array findLast: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'findLast', 'findLast((number, int, Int32Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_findLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findLastIndex((x: number, idx: int, src: Int32Array): boolean => x > 2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array findLastIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'findLastIndex', 'findLastIndex((number, int, Int32Array): => boolean): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_forEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: int, src: Int32Array): void => { let v = x; });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'forEach', 'forEach((number, int, Int32Array): => void): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Int32Array_valueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'valueOf', 'valueOf(): Int32Array', arkTsAveragedTime);
    })
  })
}
