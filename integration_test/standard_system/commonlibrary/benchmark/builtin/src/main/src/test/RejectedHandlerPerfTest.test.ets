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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";
import performance from './Performance.util';

export default function RejectedHandlerPerfTest(): void {
  describe('RejectedHandlerPerfTest', () => {
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
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_RejectedHandler_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let b: RejectedHandler | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++){
        b = new RejectedHandler();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'constructor',
        'constructor()', arkTsAveragedTime);
    });

    it('PerformanceTest_RejectedHandler_constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const callback = (reason: Error, obj: Object): void => {};
      let b: RejectedHandler | null = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = new RejectedHandler(callback);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'constructor',
        'constructor(cb: RejectedObjectListener)', arkTsAveragedTime);
    });

    it('PerformanceTest_RejectedHandler_register_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new RejectedHandler();
      let callback = (reason: Error, c: Object): void => {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        handler.register(callback);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = handler;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_register_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'register',
        'register(cb: RejectedObjectListener): void', arkTsAveragedTime);
    });

    it('PerformanceTest_RejectedHandler_unregister_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new RejectedHandler();
      let callbacks: ((reason: Error, obj: Object) => void)[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let cb = (reason: Error, obj: Object): void => {};
        callbacks.push(cb);
        handler.register(cb);
      }

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        handler.unregister(callbacks[i]);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = handler; 

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_unregister_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'unregister',
        'unregister(cb: RejectedObjectListener): void', arkTsAveragedTime);
    });

    it('PerformanceTest_RejectedHandler_reset_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new RejectedHandler();

      let callback = (reason: Error, obj: Object): void => {};
      handler.register(callback);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        handler.reset();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = handler;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_reset_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'reset',
        'reset(): void', arkTsAveragedTime);
    });

    it('PerformanceTest_RejectedHandler_apply_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new RejectedHandler();
      let callback = (reason: Error, obj: Object): void => {};
      handler.register(callback);
      let err = new Error("test");
      let obj: Object = {};
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        handler.apply(err, obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = handler;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_apply_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'apply',
        'apply(reason: Error, obj: Object): void', arkTsAveragedTime);
    })

    it('PerformanceTest_RejectedHandler_size_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new RejectedHandler();
      let callback = (reason: Error, obj: Object): void => {};
      handler.register(callback);
      let result: number = 0;

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = handler.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_size_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RejectedHandler', 'size',
        'size: number', arkTsAveragedTime);
    });

  })
}
