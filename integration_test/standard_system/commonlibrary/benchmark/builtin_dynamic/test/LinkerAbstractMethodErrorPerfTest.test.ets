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

class LinkerAbstractMethodError extends Error {
  constructor(message?: string) {
    super(message);
    this.name = 'LinkerAbstractMethodError';
  }
}

export default function LinkerAbstractMethodErrorPerfTest(): void {
  describe('LinkerAbstractMethodErrorPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_LinkerAbstractMethodError_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let err: LinkerAbstractMethodError = new LinkerAbstractMethodError();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          err = new LinkerAbstractMethodError("test message");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = err;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerAbstractMethodError_constructor_0100 : ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'LinkerAbstractMethodError', 'constructor', 'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
      done();
      })
  })
}