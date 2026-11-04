/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

class RealListObjectImpl implements containers.ListObject {
  private data: Object[] = [];
  pushFront(e: Object): void { this.data.unshift(e); }
  popFront(): Object { return this.data.length > 0 ? this.data.shift() as Object : new Object(); }
  pushBack(e: Object): void { this.data.push(e); }
  popBack(): Object { return this.data.length > 0 ? this.data.pop() as Object : new Object(); }
  size(): int { return this.data.length as int; }
  at(index: int): Object { return this.data[index]; }
  set(index: int, e: Object): void { this.data[index] = e; }
  has(e: Object): boolean { return this.data.includes(e); }
}

export default function ListObjectPerfTest(): void {
  describe('ListObjectPerfTest', () => {
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

    it('PerformanceTest_ListObject_PushFront_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      let varObj = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushFront(varObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_PushFront_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'pushFront', 'pushFront(e: Object): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_PopFront_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushBack(new Object());
      }
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.popFront();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_PopFront_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'popFront', 'popFront(): Object', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_PushBack_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      let varObj = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushBack(varObj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_PushBack_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'pushBack', 'pushBack(e: Object): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_PopBack_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.pushBack(new Object());
      }
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.popBack();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_PopBack_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'popBack', 'popBack(): Object', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_Size_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      list.pushBack(new Object());
      let res = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.size();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_Size_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'size', 'size(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_At_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      list.pushBack(new Object());
      let res: Object = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.at(0 as int);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res2 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_At_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'at', 'at(index: int): Object', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_Set_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      list.pushBack(new Object());
      let val = new Object();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        list.set(0 as int, val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_Set_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'set', 'set(index: int, e: Object): void', arkTsAveragedTime);
    })

    it('PerformanceTest_ListObject_Has_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: containers.ListObject = new RealListObjectImpl();
      let val = new Object();
      list.pushBack(val);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = list.has(val);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = list;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res2 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ListObject_Has_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.containers', 'ListObject', 'has', 'has(e: Object): boolean', arkTsAveragedTime);
    })

  })
}