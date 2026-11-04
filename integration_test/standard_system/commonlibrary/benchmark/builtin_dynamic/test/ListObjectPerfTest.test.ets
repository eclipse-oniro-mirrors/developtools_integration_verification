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
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

interface ListObject {
  pushFront(e: Object): void;
  popFront(): Object;
  pushBack(e: Object): void;
  popBack(): Object;
  size(): number;
  at(index: number): Object;
  set(index: number, e: Object): void;
  has(e: Object): boolean;
}

class RealListObjectImpl implements ListObject {
  private data: Object[] = [];
  pushFront(e: Object): void { this.data.unshift(e); }
  popFront(): Object { return this.data.length > 0 ? this.data.shift() as Object : new Object(); }
  pushBack(e: Object): void { this.data.push(e); }
  popBack(): Object { return this.data.length > 0 ? this.data.pop() as Object : new Object(); }
  size(): number { return this.data.length; }
  at(index: number): Object { return this.data[index]; }
  set(index: number, e: Object): void { this.data[index] = e; }
  has(e: Object): boolean { return this.data.includes(e); }
}

export default function ListObjectPerfTest(): void {
  describe('ListObjectPerfTest', () => {
    const BASE_COUNT: number = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ListObject_PushFront_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ListObject[] = new Array<ListObject>(BASE_COUNT);
        for (let j = 0; j < BASE_COUNT; j++) {
          lists[j] = new RealListObjectImpl();
        }
        let varObj: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].pushFront(varObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lists[BASE_COUNT - 1];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_PushFront_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'pushFront',
          'pushFront(e: Object): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_PopFront_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        for (let i = 0; i < BASE_COUNT; i++) {
          list.pushBack(new Object());
        }
        let res: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.popFront();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_PopFront_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'popFront',
          'popFront(): Object', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_PushBack_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lists: ListObject[] = new Array<ListObject>(BASE_COUNT);
        for (let j = 0; j < BASE_COUNT; j++) {
          lists[j] = new RealListObjectImpl();
        }
        let varObj: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          lists[i].pushBack(varObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = lists[BASE_COUNT - 1];
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_PushBack_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'pushBack',
          'pushBack(e: Object): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_PopBack_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        for (let i = 0; i < BASE_COUNT; i++) {
          list.pushBack(new Object());
        }
        let res: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.popBack();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_PopBack_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'popBack',
          'popBack(): Object', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_Size_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        list.pushBack(new Object());
        let res: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.size();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_Size_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'size',
          'size(): number', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_At_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        list.pushBack(new Object());
        let res: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.at(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_At_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'at',
          'at(index: number): Object', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_Set_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        list.pushBack(new Object());
        let val: Object = new Object();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          list.set(0, val);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = list;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_Set_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'set',
          'set(index: number, e: Object): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ListObject_Has_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let list: ListObject = new RealListObjectImpl();
        let val: Object = new Object();
        list.pushBack(val);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = list.has(val);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_ListObject_Has_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'has',
          'has(e: Object): boolean', arkTsAveragedTime);
      done();
      })
  })
}