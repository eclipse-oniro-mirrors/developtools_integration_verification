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
  beforeEach,
  afterAll
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import { errorManager } from '@kit.AbilityKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ErrorHandlerPerfTest(): void {
  describe('ErrorHandlerPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ErrorHandler_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cb: errorManager.ErrorHandler = (error: Error) => {};
        let res: errorManager.ErrorHandler | undefined = errorManager.setDefaultErrorHandler(cb);

        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = errorManager.setDefaultErrorHandler(cb);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_Constructor_0100: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'setDefaultErrorHandler',
          'setDefaultErrorHandler(cb: UncaughtErrorListener): ProcessErrorHandler', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ErrorHandler_HandleUncaughtError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: errorManager.ErrorHandler = (error: Error) => {};
        errorManager.setDefaultErrorHandler(res);
        let error = new Error("test error");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res(error);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_HandleUncaughtError_0200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'invoke',
          'invoke(error: Error): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_ErrorHandler_Reset_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cb1: errorManager.ErrorHandler = (error: Error) => {};
        errorManager.setDefaultErrorHandler(cb1);
        let res: errorManager.ErrorHandler = (error: Error) => {};
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          errorManager.setDefaultErrorHandler(res);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_Reset_0300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'setDefaultErrorHandler',
          'setDefaultErrorHandler(cb: UncaughtErrorListener): ProcessErrorHandler', arkTsAveragedTime);
      done();
      })

  })
}