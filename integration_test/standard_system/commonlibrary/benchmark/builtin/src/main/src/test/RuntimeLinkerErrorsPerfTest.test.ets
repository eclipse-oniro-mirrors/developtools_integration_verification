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


export default function RuntimeLinkerErrorsPerfTest(): void {
  describe('RuntimeLinkerErrorsPerfTest', () => {
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

    // LinkerError tests
    it('PerformanceTest_LinkerError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerError = new LinkerError("test message", undefined);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerError("test message", undefined);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerVerificationError tests
    it('PerformanceTest_LinkerVerificationError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerVerificationError = new LinkerVerificationError("verification failed");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerVerificationError("verification failed");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerVerificationError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerVerificationError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerUnresolvedClassError tests
    it('PerformanceTest_LinkerUnresolvedClassError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerUnresolvedClassError = new LinkerUnresolvedClassError("class not found");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerUnresolvedClassError("class not found");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerUnresolvedClassError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerUnresolvedClassError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerUnresolvedFieldError tests
    it('PerformanceTest_LinkerUnresolvedFieldError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerUnresolvedFieldError = new LinkerUnresolvedFieldError("field not found");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerUnresolvedFieldError("field not found");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerUnresolvedFieldError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerUnresolvedFieldError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerUnresolvedMethodError tests
    it('PerformanceTest_LinkerUnresolvedMethodError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerUnresolvedMethodError = new LinkerUnresolvedMethodError("method not found");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerUnresolvedMethodError("method not found");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerUnresolvedMethodError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerUnresolvedMethodError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerBadSupertypeError tests
    it('PerformanceTest_LinkerBadSupertypeError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerBadSupertypeError = new LinkerBadSupertypeError("bad supertype");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerBadSupertypeError("bad supertype");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerBadSupertypeError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerBadSupertypeError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerTypeCircularityError tests
    it('PerformanceTest_LinkerTypeCircularityError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerTypeCircularityError = new LinkerTypeCircularityError("type circularity detected");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerTypeCircularityError("type circularity detected");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerTypeCircularityError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerTypeCircularityError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerMethodConflictError tests
    it('PerformanceTest_LinkerMethodConflictError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerMethodConflictError = new LinkerMethodConflictError("method conflict");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerMethodConflictError("method conflict");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerMethodConflictError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerMethodConflictError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerAbstractMethodError tests
    it('PerformanceTest_LinkerAbstractMethodError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerAbstractMethodError = new LinkerAbstractMethodError("abstract method not implemented");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerAbstractMethodError("abstract method not implemented");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerAbstractMethodError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerAbstractMethodError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

    // LinkerClassNotFoundError tests
    it('PerformanceTest_LinkerClassNotFoundError_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: LinkerClassNotFoundError = new LinkerClassNotFoundError("class not found");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new LinkerClassNotFoundError("class not found");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerClassNotFoundError_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerClassNotFoundError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
    })

  })
}
