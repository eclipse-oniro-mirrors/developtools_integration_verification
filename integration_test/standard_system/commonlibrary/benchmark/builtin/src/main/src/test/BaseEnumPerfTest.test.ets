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

export default function BaseEnumPerfTest(): void {
  describe('BaseEnumPerfTest', () => {
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

    it('PerformanceTest_BaseEnum_constructor_int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: BaseEnum<int> = new BaseEnum<int>(42, 'TestEnum');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new BaseEnum<int>(42, 'TestEnum');
      }
      let Dtime = new Date().getTime() - Stime;
	    let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BaseEnum_constructor_int_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BaseEnum', 'constructor',
        'constructor(value: T)', arkTsAveragedTime);
    })

    it('PerformanceTest_BaseEnum_valueOf_int_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let baseEnum: BaseEnum<int> = new BaseEnum<int>(42, 'TestEnum');
      let res = baseEnum.valueOf();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = baseEnum.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BaseEnum_valueOf_int_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BaseEnum', 'valueOf',
        'valueOf(): T', arkTsAveragedTime);
    })

    it('PerformanceTest_BaseEnum_getName_string_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let baseEnum: BaseEnum<string> = new BaseEnum<string>('success', 'TestEnum');
      let res = baseEnum.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = baseEnum.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BaseEnum_getName_string_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BaseEnum', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

    it('PerformanceTest_BaseEnum_toString_int_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let baseEnum: BaseEnum<int> = new BaseEnum<int>(42, 'TestEnum');
      let res = baseEnum.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = baseEnum.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BaseEnum_toString_int_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BaseEnum', 'toString',
        'toString(): string', arkTsAveragedTime);
    })

  })
}
