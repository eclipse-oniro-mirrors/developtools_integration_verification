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
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest12(): void {
  describe('TypedArraysPerfTest12', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Int8Array_some_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((x: number, idx: number, src: Int8Array): boolean => x > 3);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'some', 'some((number, number, Int8Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_reduce_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: number, src: Int8Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduce', 'reduce((number, number, number, Int8Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_reduce_0200Right_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: number, src: Int8Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'reduceRight', 'reduceRight((number, number, number, Int8Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_map_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: Int8Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: number, src: Int8Array): number => x * 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'map', 'map((number, number, Int8Array): => number): Int8Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 5 && result[0] === 2 && result[4] === 10;
      }
      done();
    })

    it('PerformanceTest_Int8Array_every_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: number, src: Int8Array): boolean => x > 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'every', 'every((number, number, Int8Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_filter_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: Int8Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: number, src: Int8Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'filter', 'filter((number, number, Int8Array): => boolean): Int8Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 3 && result[0] === 3 && result[2] === 5;
      }
      done();
    })

    it('PerformanceTest_Int8Array_find_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: number | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: number, src: Int8Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'find', 'find((number, number, Int8Array): => boolean): number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_find_0700Index_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: number, src: Int8Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'findIndex', 'findIndex((number, number, Int8Array): => boolean): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_forEach_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let sum: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: number, src: Int8Array): void => { sum += x; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'forEach', 'forEach((number, number, Int8Array): => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_valueOf_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1 as number, 2 as number, 3 as number, 4 as number, 5 as number]);
      let result: Int8Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'valueOf', 'valueOf(): Int8Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_reduce_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: number, src: Int16Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'reduce', 'reduce((number, number, number, Int16Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_reduce_1100Right_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: number, src: Int16Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'reduceRight', 'reduceRight((number, number, number, Int16Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_map_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: number, src: Int16Array): number => x * 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'map', 'map((number, number, Int16Array): => number): Int16Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 5 && result[0] === 2 && result[4] === 10;
      }
      done();
    })

    it('PerformanceTest_Int16Array_every_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: number, src: Int16Array): boolean => x > 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'every', 'every((number, number, Int16Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_filter_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: number, src: Int16Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'filter', 'filter((number, number, Int16Array): => boolean): Int16Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 3 && result[0] === 3 && result[2] === 5;
      }
      done();
    })

    it('PerformanceTest_Int16Array_find_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: number, src: Int16Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'find', 'find((number, number, Int16Array): => boolean): number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_find_1600Index_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: number, src: Int16Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'findIndex', 'findIndex((number, number, Int16Array): => boolean): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_forEach_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: number, src: Int16Array): void => { sum += x; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'forEach', 'forEach((number, number, Int16Array): => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int16Array_valueOf_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int16Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int16Array', 'valueOf', 'valueOf(): Int16Array', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_some_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.some((x: number, idx: number, src: Int32Array): boolean => x > 3);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array some: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'some', 'some((number, number, Int32Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_reduce_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduce((prev: number, cur: number, idx: number, src: Int32Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array reduce: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'reduce', 'reduce((number, number, number, Int32Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_reduce_2100Right_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.reduceRight((prev: number, cur: number, idx: number, src: Int32Array): number => prev + cur);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array reduceRight: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'reduceRight', 'reduceRight((number, number, number, Int32Array): => number): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_map_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.map((x: number, idx: number, src: Int32Array): number => x * 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array map: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'map', 'map((number, number, Int32Array): => number): Int32Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 5 && result[0] === 2 && result[4] === 10;
      }
      done();
    })

    it('PerformanceTest_Int32Array_every_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.every((x: number, idx: number, src: Int32Array): boolean => x > 0);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array every: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'every', 'every((number, number, Int32Array): => boolean): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_filter_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.filter((x: number, idx: number, src: Int32Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array filter: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'filter', 'filter((number, number, Int32Array): => boolean): Int32Array', arkTsAveragedTime);

      let checkResult: boolean = false;
      if (result !== null) {
        checkResult = result.length === 3 && result[0] === 3 && result[2] === 5;
      }
      done();
    })

    it('PerformanceTest_Int32Array_find_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.find((x: number, idx: number, src: Int32Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array find: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'find', 'find((number, number, Int32Array): => boolean): number | undefined', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_find_2600Index_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: number = -1;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.findIndex((x: number, idx: number, src: Int32Array): boolean => x > 2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array findIndex: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'findIndex', 'findIndex((number, number, Int32Array): => boolean): number', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_forEach_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.forEach((x: number, idx: number, src: Int32Array): void => { sum += x; });
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array forEach: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'forEach', 'forEach((number, number, Int32Array): => void): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_valueOf_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: Int32Array | null = null;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.valueOf();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array valueOf: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'valueOf', 'valueOf(): Int32Array', arkTsAveragedTime);
      done();
    })
  })
}