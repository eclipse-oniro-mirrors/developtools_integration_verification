/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

export default function ErrorHandlerPerfTest(): void {
  describe('ErrorHandlerPerfTest', () => {
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

    it('PerformanceTest_ErrorHandler_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cb = (error: Object) => {};
      let res: ProcessErrorHandler = new ProcessErrorHandler(cb);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new ProcessErrorHandler(cb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_Constructor_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'constructor',
        'constructor(cb: UncaughtErrorListener): ProcessErrorHandler', arkTsAveragedTime);
    })

    it('PerformanceTest_ErrorHandler_HandleUncaughtError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        let handler = new ProcessErrorHandler((error: Object) => {});
        let error = new Error("test error");
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          handler.handleUncaughtError(error);
        }
        let Dtime = new Date().getTime() - Stime;
		    let res1 = handler;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_HandleUncaughtError_0200: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'handleUncaughtError',
          'handleUncaughtError(error: Object): void', arkTsAveragedTime);
      })

    it('PerformanceTest_ErrorHandler_Reset_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new ProcessErrorHandler((error: Object) => {});
      let cb = (error: Object) => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        handler.reset(cb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = handler;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_Reset_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'reset',
        'reset(cb: UncaughtErrorListener): void', arkTsAveragedTime);
    })

    // 0400: 传入非Error对象会调用ProcessManager.exit(1)终止进程，无法在循环中测试
    // it('PerformanceTest_ErrorHandler_HandleUncaughtError_NonErrorType_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   () => {
    //     let handler = new ProcessErrorHandler((error: Object) => {
    //     });
    //     let nonErrorObj: Object = "string error";
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //       try {
    //         handler.handleUncaughtError(nonErrorObj);
    //       } catch (e) {
    //         break;
    //       }
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = handler;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_HandleUncaughtError_NonErrorType_0400: ' +
    //       arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'handleUncaughtError',
    //       'handleUncaughtError(error: NonErrorObject): void', arkTsAveragedTime);
    //   })

    // 0500: 回调抛异常时handleUncaughtError会调用ProcessManager.exit(1)终止进程，无法在循环中测试
    // it('PerformanceTest_ErrorHandler_HandleUncaughtError_CallbackThrows_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   () => {
    //     let handler = new ProcessErrorHandler((error: Object) => {
    //       throw new Error("callback error");
    //     });
    //     let error = new Error("test error");
    //     let Stime = new Date().getTime();
    //     let loopCount = 0;
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //       try {
    //         handler.handleUncaughtError(error);
    //         loopCount++;
    //       } catch (e) {
    //         break;
    //       }
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let actualLoopCount = loopCount > 0 ? loopCount : 1;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / actualLoopCount;
    //     let res1 = handler;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_HandleUncaughtError_CallbackThrows_0500: ' +
    //       arkTsAveragedTime + 'ns');
    //     performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'handleUncaughtError',
    //       'handleUncaughtError(callbackThrows): void', arkTsAveragedTime);
    //   })

    // Duplicate of _0300 (same reset interface, non-overload). Commented out.
    // it('PerformanceTest_ErrorHandler_Reset_MultipleCalls_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let handler = new ProcessErrorHandler((error: Object) => {
    //   });
    //   let cb1 = (error: Object) => {};
    //   let cb2 = (error: Object) => {};
    //   let cb3 = (error: Object) => {};
    //   let cb4 = (error: Object) => {};
    //   let callbacks: Array<(error: Object) => void> = [cb1, cb2, cb3, cb4];
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let cbIndex = i % 4;
    //     handler.reset(callbacks[cbIndex]);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = handler;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ErrorHandler_Reset_MultipleCalls_0600: ' +
    //     arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'ProcessErrorHandler', 'reset',
    //     'reset(cb: UncaughtErrorListener): void', arkTsAveragedTime);
    // })

  })
}
