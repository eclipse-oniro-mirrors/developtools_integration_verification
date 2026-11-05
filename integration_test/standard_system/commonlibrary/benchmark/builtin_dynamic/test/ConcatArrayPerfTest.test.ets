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

export default function ConcatArrayPerfTest(): void {
  describe('ConcatArrayPerfTest', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    let testArray: Array<number> = new Array<number>();
    let testArrayStr: Array<string> = new Array<string>();
    let testArrayObj: Array<Object> = new Array<Object>();
    beforeAll(() => {
      testArray = new Array<number>();
      for (let i = 0; i < 100; i++) {
        testArray.push(i);
      }
      testArrayStr = new Array<string>();
      for (let i = 0; i < 100; i++) {
        testArrayStr.push("item" + i);
      }
      testArrayObj = new Array<Object>();
      for (let i = 0; i < 100; i++) {
        testArrayObj.push(new Object());
      }
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_ConcatArray_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: string = '';
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = testArray.join();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConcatArray_Instance_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Array', 'join',
          'join(separator?: String): string (default separator)', arkTsAveragedTime);
      done();
      })
  })
}