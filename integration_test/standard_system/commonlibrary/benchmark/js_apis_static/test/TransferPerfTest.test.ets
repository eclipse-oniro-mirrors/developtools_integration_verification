'use static'
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
} from "../../../hypium/index";
import performance from './Performance.util';
import { transfer } from '@kit.ArkTS'

export default function TransferPerfTest1_2(): void {
  describe('TransferPerfTest1_2', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    //it('PerformanceTest_Transfer_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //  let input = new ArrayBuffer(8);
    //  let result: Object = new Object();
    //  let Stime = Chrono.nanoNow();
    //  for (let i = 0; i < BASE_COUNT; i++) {
    //    result = transfer.transferStatic(input, 'InteropTransferHelper');
    //  }
    //  let Dtime = Chrono.nanoNow() - Stime;
    //  let res1 = result;
    //  let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
    //  console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Transfer_Static_0100: ' + arkTsAveragedTime + 'ns');
    //  performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'transfer', 'transferStatic',
    //    'transferStatic(input: Any, inputName: string): Object', arkTsAveragedTime);
    //})

    it('PerformanceTest_Transfer_Dynamic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let static_obj = new ArrayBuffer(8);
      let result: Any = undefined;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = transfer.transferDynamic(static_obj, 'InteropTransferHelper');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Transfer_Dynamic_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'transfer', 'transferDynamic',
        'transferDynamic(input: Object, inputName: string): Any', arkTsAveragedTime);
    })
  })
}