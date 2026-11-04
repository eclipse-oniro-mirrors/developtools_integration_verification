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

export default function UndefinableObjectArrayPerfTest(): void {
  describe('UndefinableObjectArrayPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_UndefinableObjectArray_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Object[] = [];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = [];
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor', 'constructor()', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: Object[] = new Array<Object>(10);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Array<Object>(10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor', 'constructor(capacity: int)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let val: Object = new Object();
      let arr: Object[] = new Array<Object>(10);
      let res: Object[] = arr.fill(val);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        let tmp: Object[] = new Array<Object>(10);
        res = tmp.fill(val);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'constructor', 'constructor(capacity: int, val: UndefinableObject)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_Reserve_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.length = 100;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Reserve_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'reserve', 'reserve(capacity: int): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_ToArray_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      arr.push(new Object());
      let res: Object[] = [];
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.slice();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_ToArray_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'toArray', 'toArray(): Object[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_PushBack_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      let val: Object = new Object();
      let pushRes: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        pushRes = arr.push(val);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = pushRes;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_PushBack_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'push', 'pushBack(e: UndefinableObject): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_PopBack_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      let val: Object = new Object();
      for (let i = 0; i < BASE_COUNT; i++) {
        arr.push(val);
      }
      let res: Object | undefined = undefined;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.pop();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_PopBack_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'pop', 'popBack(): UndefinableObject', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_Size_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      arr.push(new Object());
      let res: number = 0;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Size_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'length', 'size(): int', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_At_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      arr.push(new Object());
      let res: Object | undefined = undefined;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr[0];
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_At_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'at', 'at(index: int): UndefinableObject', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_UndefinableObjectArray_Set_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Object[] = [];
      arr.push(new Object());
      let val: Object = new Object();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arr[0] = val;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arr;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinableObjectArray_Set_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'UndefinableObjectArray', 'indexAssignment', 'set(index: int, e: UndefinableObject): void', arkTsAveragedTime);
      done();
    })
  })
}