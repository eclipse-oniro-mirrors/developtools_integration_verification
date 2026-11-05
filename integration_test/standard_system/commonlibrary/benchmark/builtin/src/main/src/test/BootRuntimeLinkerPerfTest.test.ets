/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

export default function BootRuntimeLinkerPerfTest(): void {
  describe('BootRuntimeLinkerPerfTest', () => {
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

    it('PerformanceTest_BootRuntimeLinker_getBootRuntimeLinker_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: BootRuntimeLinker = getBootRuntimeLinker();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = getBootRuntimeLinker();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime getBootRuntimeLinker: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BootRuntimeLinker', 'getBootRuntimeLinker',
          'function getBootRuntimeLinker(): BootRuntimeLinker', arkTsAveragedTime);

      })

    it('PerformanceTest_BootRuntimeLinker_instance_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: BootRuntimeLinker = BootRuntimeLinker.instance;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = BootRuntimeLinker.instance;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime instance: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BootRuntimeLinker', 'instance',
          'static final instance: BootRuntimeLinker', arkTsAveragedTime);
      })

    it('PerformanceTest_BootRuntimeLinker_getNearestNonBootRuntimeLinker_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res: RuntimeLinker | undefined = getNearestNonBootRuntimeLinker();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = getNearestNonBootRuntimeLinker();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime getNearestNonBootRuntimeLinker: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BootRuntimeLinker', 'getNearestNonBootRuntimeLinker',
          'native function getNearestNonBootRuntimeLinker(): RuntimeLinker | undefined', arkTsAveragedTime);
      })

    it('PerformanceTest_BootRuntimeLinker_findAndLoadClass_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let bootLinker = getBootRuntimeLinker();
        let res: Class | undefined = bootLinker.findAndLoadClass("std.core.String", true);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = bootLinker.findAndLoadClass("std.core.String", true);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime findAndLoadClass: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BootRuntimeLinker', 'findAndLoadClass',
          'public native override findAndLoadClass(clsName: string, init: boolean): Class | undefined',
          arkTsAveragedTime);
      })
  })
}
