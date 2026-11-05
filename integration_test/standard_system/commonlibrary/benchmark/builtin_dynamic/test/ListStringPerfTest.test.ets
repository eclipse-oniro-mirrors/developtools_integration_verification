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

export default function ListStringPerfTest(): void {
  describe('ListStringPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ListString_PushFront_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      let val: string = "test";
      let unshiftRet: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        unshiftRet = list.unshift(val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let res2: number = unshiftRet;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_PushFront_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'pushFront', 'pushFront(e: String): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ListString_PopFront_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      let val: string = "test";
      for (let i: number = 0; i < BASE_COUNT; i++) {
        list.push(val);
      }
      let res: string = "";
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = list.shift() as string;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      let res2: string = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_PopFront_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'popFront', 'popFront(): String', arkTsAveragedTime);
;
      done();
    })

    it('PerformanceTest_ListString_PushBack_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      let val: string = "test";
      let pushRet: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        pushRet = list.push(val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let res2: number = pushRet;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_PushBack_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'pushBack', 'pushBack(e: String): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ListString_PopBack_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      let val: string = "test";
      for (let i: number = 0; i < BASE_COUNT; i++) {
        list.push(val);
      }
      let res: string = "";
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = list.pop() as string;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      let res2: string = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_PopBack_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'popBack', 'popBack(): String', arkTsAveragedTime);
;
      done();
    })

    it('PerformanceTest_ListString_Size_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      list.push("test");
      let currentSize: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        currentSize = list.length;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      let res2: number = currentSize;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_Size_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'size', 'size(): int', arkTsAveragedTime);
;
      done();
    })

    it('PerformanceTest_ListString_At_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      list.push("test");
      let res: string = "";
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = list[0];
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      let res2: string = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_At_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'at', 'at(index: int): String', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ListString_Set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      list.push("test1");
      let val: string = "test2";
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        list[0] = val;
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_Set_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'set', 'set(index: int, e: String): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_ListString_Has_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let list: string[] = [];
      let val: string = "test";
      list.push(val);
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = list.includes(val);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string[] = list;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      let res2: boolean = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListString_Has_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListString', 'has', 'has(e: String): boolean', arkTsAveragedTime);
      done();
    })

  })
}