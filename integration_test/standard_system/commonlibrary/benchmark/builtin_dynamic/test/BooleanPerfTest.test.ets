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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function BooleanPerfTest(): void {
  describe('BooleanPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Boolean_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(false);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean(true);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'constructor(value: boolean)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(true);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'constructor()', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(false);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean(1 as number);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'constructor(value: number)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(false);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean('A');
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'constructor(value: string)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(false);
      let comt: bigint = 123n;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean(comt);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'constructor(value: bigint)', arkTsAveragedTime);
      done();
    })


    it('PerformanceTest_Boolean_Constructor_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Boolean = new Boolean(false);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = new Boolean(null);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Constructor_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'constructor',
        'function constructor(value: Object|null|undefined)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Instance_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let boolTrue = new Boolean(true);
      let res: Boolean = new Boolean(false);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = boolTrue.valueOf();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Instance_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'valueOf',
        'valueOf(): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Boolean_Instance_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let boolTrue = new Boolean(true);
      let res: string = '';
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = boolTrue.toString();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Boolean_Instance_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Boolean', 'toString',
        'toString(): string', arkTsAveragedTime);
      done();
    })

  })
}
