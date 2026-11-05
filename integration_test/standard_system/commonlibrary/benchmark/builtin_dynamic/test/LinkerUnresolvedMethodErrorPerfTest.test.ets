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

declare class ArkTools {
  static forceFullGC(): void;
}

class LinkerUnresolvedMethodError extends Error {
  constructor(message?: string) {
    super(message);
    this.name = 'LinkerUnresolvedMethodError';
  }
}

export default function LinkerUnresolvedMethodErrorPerfTest(): void {
  describe('LinkerUnresolvedMethodErrorPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_LinkerUnresolvedMethodError_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let err: LinkerUnresolvedMethodError = new LinkerUnresolvedMethodError();
      let Stime: number = systemDateTime.getTime(true);

      for (let i: number = 0; i < BASE_COUNT; i++) {
        err = new LinkerUnresolvedMethodError("test message");
      }

      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: LinkerUnresolvedMethodError = err;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LinkerUnresolvedMethodError_constructor_0100 : ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LinkerUnresolvedMethodError', 'constructor',
        'constructor(message?: String, options?: ErrorOptions)', arkTsAveragedTime);
      done();
    })
  })
}