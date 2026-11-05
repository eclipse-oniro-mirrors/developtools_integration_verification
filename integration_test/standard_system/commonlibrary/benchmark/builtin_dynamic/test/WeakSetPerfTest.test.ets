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
} from '@ohos/hypium';
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function WeakSetPerfTest(): void {
  describe('WeakSetPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_WeakSet_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: WeakSet<Object> = new WeakSet<Object>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new WeakSet<Object>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: WeakSet<Object> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
          'constructor()', arkTsAveragedTime);
        let obj: Object = new Object();
        res1.add(obj);
      done();
      })

    it('PerformanceTest_WeakSet_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: Object = new Object();
        let arr: Object[] = [obj];
        let res: WeakSet<Object> = new WeakSet<Object>(arr);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new WeakSet<Object>(arr);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: WeakSet<Object> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
          'constructor(elements?: K[] | null)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WeakSet_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: Object = new Object();
        let entries: Array<Object> = [obj];
        let res: WeakSet<Object> = new WeakSet<Object>(entries);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new WeakSet<Object>(entries);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: WeakSet<Object> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Constructor_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'constructor',
          'constructor(elements: Iterable<K>)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WeakSet_Add_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let weakSets: Array<WeakSet<Object>> = [];
        let objects: Array<Object> = [];
        for (let i = 0; i < BASE_COUNT; i++) {
          weakSets.push(new WeakSet<Object>());
        }
        for (let i = 0; i < BASE_COUNT; i++) {
          objects.push(new Object());
        }
        let res: WeakSet<Object> = new WeakSet<Object>();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = weakSets[i].add(objects[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: WeakSet<Object> = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Add_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'add',
          'add(v: K): WeakSet<K>', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WeakSet_Has_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let ws: WeakSet<Object> = new WeakSet<Object>();
        let obj: Object = new Object();
        ws.add(obj);
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ws.has(obj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Has_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'has',
          'has(v: K): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WeakSet_Delete_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let weakSets: Array<WeakSet<Object>> = [];
        let objects: Object[] = [];
        for (let i = 0; i < BASE_COUNT; i++) {
          objects.push(new Object());
        }
        let createWeakSet: (obj: Object) => WeakSet<Object> = (obj: Object): WeakSet<Object> => {
          let ws: WeakSet<Object> = new WeakSet<Object>();
          ws.add(obj);
          return ws;
        };
        for (let i = 0; i < BASE_COUNT; i++) {
          weakSets.push(createWeakSet(objects[i]));
        }
        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = weakSets[i].delete(objects[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_Delete_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'delete',
          'delete(v: K): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WeakSet_ToString_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let ws: WeakSet<Object> = new WeakSet<Object>();
        let res: string = '';
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ws.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: string = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WeakSet_ToString_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.containers', 'WeakSet', 'toString',
          'toString(): String', arkTsAveragedTime);
      done();
      })

  })
}