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
import { systemDateTime } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

class RealLogger {
  private static readonly DOMAIN: number = 0x0000;
  private static readonly TAG: string = 'PerfTest';

  static enableLogging(): void {
    hilog.info(RealLogger.DOMAIN, RealLogger.TAG, 'Logging enabled');
  }

  static disableLogging(): void {
    hilog.info(RealLogger.DOMAIN, RealLogger.TAG, 'Logging disabled');
  }

  static log(m: string): void {
    hilog.info(RealLogger.DOMAIN, RealLogger.TAG, '%{public}s', m);
  }

  static logError(m: string): void {
    hilog.error(RealLogger.DOMAIN, RealLogger.TAG, '%{public}s', m);
  }
}

export default function LoggerPerfTest() : void{
  describe('LoggerPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      console.info('Real Logger Performance Test Summary ');
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Logger_EnableLogging_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          RealLogger.enableLogging();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = true;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(`[Performance] RealLogger.enableLogging - Total: ${Dtime}ns, ` +
          `Count: ${BASE_COUNT}, Average: ${arkTsAveragedTime}ns`);
        performance.apiWithClassAndKeywordTxt('std.debug', 'RealLogger', 'enableLogging',
          'static enableLogging(): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Logger_DisableLogging_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          RealLogger.disableLogging();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = true;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(`[Performance] RealLogger.disableLogging - Total: ${Dtime}ns, ` +
          `Count: ${BASE_COUNT}, Average: ${arkTsAveragedTime}ns`);
        performance.apiWithClassAndKeywordTxt('std.debug', 'RealLogger', 'disableLogging',
          'static disableLogging(): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Logger_Log_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let testMessage = "Performance test log message";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          RealLogger.log(testMessage);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = true;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(`[Performance] RealLogger.log - Total: ${Dtime}ns, ` +
          `Count: ${BASE_COUNT}, Average: ${arkTsAveragedTime}ns`);
        performance.apiWithClassAndKeywordTxt('std.debug', 'RealLogger', 'log',
          'static log(m: string): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Logger_LogError_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let errorMsg = "This is a real error message for performance testing with sufficient length";
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          RealLogger.logError(errorMsg);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = true;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(`[Performance] RealLogger.logError - Total: ${Dtime}ns, ` +
          `Count: ${BASE_COUNT}, Average: ${arkTsAveragedTime}ns`);
        performance.apiWithClassAndKeywordTxt('std.debug', 'RealLogger', 'logError',
          'static logError(m: string): void', arkTsAveragedTime);
      done();
      })
  })
}