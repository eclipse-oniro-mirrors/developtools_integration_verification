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

export default function WorkerLocalPerfTest(): void {
  describe('WorkerLocalPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_WorkerLocal_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: LocalStorage = new LocalStorage();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = new LocalStorage();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: LocalStorage = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WorkerLocal_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'LocalStorage', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WorkerLocal_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let initFn = (): number => { return 42; };
        let para: Record<string, number> = { 'v': initFn() };
        let res: LocalStorage = new LocalStorage(para);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = new LocalStorage(para);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: LocalStorage = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WorkerLocal_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'LocalStorage', 'constructor',
          'constructor(init: () => T)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WorkerLocal_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let workerLocal: LocalStorage = new LocalStorage();
        workerLocal.setOrCreate('v', 100);
        let res: number = 0;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = workerLocal.get<number>('v') as number;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: number = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WorkerLocal_Instance_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'LocalStorage', 'get',
          'get<T>(key: string): T | undefined', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_WorkerLocal_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pools: LocalStorage[] = [];
        let vals: number[] = [];
        for (let i: number = 0; i < BASE_COUNT; i++) {
          let workerLocal: LocalStorage = new LocalStorage();
          workerLocal.setOrCreate('v', 0);
          pools.push(workerLocal);
          vals.push(i);
        }
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = pools[i].set('v', vals[i]);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_WorkerLocal_Instance_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'LocalStorage', 'set',
          'set(value: T): void', arkTsAveragedTime);
      done();
      })

  })
}