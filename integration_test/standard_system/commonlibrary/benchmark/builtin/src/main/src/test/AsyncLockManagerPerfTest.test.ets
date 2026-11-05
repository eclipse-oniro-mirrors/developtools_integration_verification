/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
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


export default function AsyncLockManagerPerfTest() : void{
  describe('AsyncLockManagerPerfTest', () => {
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


    it('PerformanceTest_AsyncLockState_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new AsyncLockState()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockState()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockState_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockState', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockState_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let heldSet = new Set<AsyncLockInfo>();
      let pending = new Set<AsyncLockInfo>();
      let result = new AsyncLockState(heldSet, pending)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockState(heldSet, pending)
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockState_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockState', 'constructor',
        'constructor(heldSet: Set<AsyncLockInfo>, pending: Set<AsyncLockInfo>)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockInfo_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new AsyncLockInfo()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockInfo()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockInfo_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockInfo', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockInfo_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new AsyncLockInfo("a", AsyncLockMode.EXCLUSIVE, 1)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockInfo("a", AsyncLockMode.EXCLUSIVE, 1)
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockInfo_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockInfo', 'constructor',
        'constructor(id: string, mode: AsyncLockMode, priority: int)', arkTsAveragedTime);
    })


    it('PerformanceTest_AsyncLockOptions_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new AsyncLockOptions()
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockOptions()
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockOptions_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockOptions', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockOptions_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new AsyncLockOptions(true, null, 1)
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = new AsyncLockOptions(true, null, 1)
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = result
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockOptions_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockOptions', 'constructor',
        'constructor(delay?: boolean, timeout?: number, priority?: int)', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockState_Property_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state = new AsyncLockState()
      let res = state.held;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = state.held;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = res
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockState_Property_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockState', 'held',
        'held: AsyncLockInfo[]', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockState_Property_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state = new AsyncLockState()
      let res = state.pending;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = state.pending;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockState_Property_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockState', 'pending',
        'pending: AsyncLockInfo[]', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockInfo_Property_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let info = new AsyncLockInfo("test", AsyncLockMode.EXCLUSIVE, 123)
      let mode = info.mode;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        mode = info.mode;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = mode
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockInfo_Property_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockInfo', 'mode',
        'mode: AsyncLockMode', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockInfo_Property_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let info = new AsyncLockInfo("test", AsyncLockMode.EXCLUSIVE, 123)
      let contextId = info.contextId;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        contextId = info.contextId;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = contextId
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockInfo_Property_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockInfo', 'contextId',
        'contextId: int', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockOptions_Property_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions()
      let available = options.isAvailable;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        available = options.isAvailable;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = available
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockOptions_Property_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockOptions', 'isAvailable',
        'isAvailable: boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockOptions_Property_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions()
      let signal = options.signal;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        signal = options.signal;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = signal
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockOptions_Property_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockOptions', 'signal',
        'signal: AbortSignal<T> | null', arkTsAveragedTime);
    })

    it('PerformanceTest_AsyncLockOptions_Property_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions()
      let timeout = options.timeout;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        timeout = options.timeout;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      let res1 = timeout
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AsyncLockOptions_Property_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'AsyncLockOptions', 'timeout',
        'timeout: int', arkTsAveragedTime);
    })
  })
}