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
} from '@ohos/hypium';
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';
import { errorManager } from '@kit.AbilityKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function RejectedHandlerPerfTest(): void {
  describe('RejectedHandlerPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_RejectedHandler_register_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let observers: Array<errorManager.GlobalObserver> =
          new Array<number>(BASE_COUNT).fill(0).map((_value: number): errorManager.GlobalObserver =>
            (error: errorManager.GlobalError): void => {});
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = errorManager.on('globalUnhandledRejectionDetected', observers[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_register_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.AbilityKit', 'errorManager', 'on',
          'on(event: "globalUnhandledRejectionDetected", observer: errorManager.GlobalObserver): void',
          arkTsAveragedTime);
observers.forEach((observer: errorManager.GlobalObserver): void => {
          errorManager.off('globalUnhandledRejectionDetected', observer);
        });
        done();
      })

    it('PerformanceTest_RejectedHandler_unregister_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let observers: Array<errorManager.GlobalObserver> =
          new Array<number>(BASE_COUNT).fill(0).map((_value: number): errorManager.GlobalObserver =>
            (error: errorManager.GlobalError): void => {});
        observers.forEach((observer: errorManager.GlobalObserver): void => {
          errorManager.on('globalUnhandledRejectionDetected', observer);
        });
        let res: void = undefined;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = errorManager.off('globalUnhandledRejectionDetected', observers[i]);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1: void = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RejectedHandler_unregister_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.AbilityKit', 'errorManager', 'off',
          'off(event: "globalUnhandledRejectionDetected", observer: errorManager.GlobalObserver): void',
          arkTsAveragedTime);
      done();
      })

  })
}