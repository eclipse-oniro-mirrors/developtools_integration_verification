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
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import { ArkTSUtils } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function AsyncCondVarPerfTest() : void{
  describe('AsyncCondVarPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_AsyncCondVar_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = new ArkTSUtils.locks.ConditionVariable();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'ConditionVariable', 'constructor',
          'constructor()', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncCondVar_Instance_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let condVar: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          condVar.notifyOne();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = condVar;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Instance_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'ConditionVariable', 'notifyOne',
          'notifyOne(): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_AsyncCondVar_Instance_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let condVar: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          condVar.notifyAll();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = condVar;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncCondVar_Instance_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'ConditionVariable', 'notifyAll',
          'notifyAll(): void', arkTsAveragedTime);
      done();
      })
  })
}