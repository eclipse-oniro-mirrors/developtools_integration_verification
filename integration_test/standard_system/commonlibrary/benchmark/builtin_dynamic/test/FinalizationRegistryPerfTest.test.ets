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

export default function FinalizationRegistryPerfTest(): void {
  describe('FinalizationRegistryPerfTest', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      ArkTools.forceFullGC();
    })
    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_FinalizationRegistryPerfTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: FinalizationRegistry<number> = new FinalizationRegistry<number>((value: number) => {});
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new FinalizationRegistry<number>((value: number) => {});
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FinalizationRegistryPerfTest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FinalizationRegistry', 'constructor',
          'constructor(cleanupCallback: (heldValue: T) => void)', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_FinalizationRegistryPerfTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let registry: FinalizationRegistry<number> = new FinalizationRegistry<number>((value: number) => {});
        let objArray: Object[] = new Array<Object>();
        for (let i = 0; i < BASE_COUNT; i++) {
          objArray[i] = new Object();
        }
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          registry.register(objArray[i], i);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = registry;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FinalizationRegistryPerfTest_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FinalizationRegistry', 'register',
          'register(target: Object, heldValue: T): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_FinalizationRegistryPerfTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let registry: FinalizationRegistry<number> = new FinalizationRegistry<number>((value: number) => {});
        let objArray: Object[] = new Array<Object>(BASE_COUNT);
        let tokenArray: Object[] = new Array<Object>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          objArray[i] = new Object();
        }
        for (let i = 0; i < BASE_COUNT; i++) {
          tokenArray[i] = new Object();
        }
        for (let i = 0; i < BASE_COUNT; i++) {
          registry.register(objArray[i], i, tokenArray[i]);
        }
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          registry.unregister(tokenArray[i]);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = tokenArray.length;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FinalizationRegistryPerfTest_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FinalizationRegistry', 'unregister',
          'unregister(target: Object): void', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_FinalizationRegistryPerfTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let registry: FinalizationRegistry<number> = new FinalizationRegistry<number>((value: number) => {});
        let objArray: Object[] = new Array<Object>(BASE_COUNT);
        let tokenArray: Object[] = new Array<Object>(BASE_COUNT);
        for (let i = 0; i < BASE_COUNT; i++) {
          objArray[i] = new Object();
        }
        for (let i = 0; i < BASE_COUNT; i++) {
          tokenArray[i] = new Object();
        }
        let Stime: number = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          registry.register(objArray[i], i, tokenArray[i]);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = tokenArray.length;
        const arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FinalizationRegistryPerfTest_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'FinalizationRegistry', 'register',
          'register(target: Object, heldValue: T, token?: Object): void', arkTsAveragedTime);
      done();
      })
  })
}