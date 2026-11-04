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

export default function ReflectInstanceFieldPerfTest(): void {
  describe('ReflectInstanceFieldPerfTest', () => {

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    const BASE_COUNT = 1000;

    it('PerformanceTest_Reflect_InstanceField_Get_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let obj: Record<string, Object> = { "intField": 42 };
        let resValue: Object = obj["intField"];
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          resValue = Reflect.get(obj, "intField");
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = resValue;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_Reflect_InstanceField_Get_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core', 'Reflect', 'get',
          'Reflect.get(obj: Object, prop: string): Object', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Reflect_InstanceField_Set_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let resValue: boolean = true;
        let obj: Record<string, Object> = { "intField": 0 };
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          resValue = Reflect.set(obj, "intField", i);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = resValue;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_Reflect_InstanceField_Set_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core', 'Reflect', 'set',
          'Reflect.set(obj: Object, prop: string, value: Object): boolean',
          arkTsAveragedTime);
      done();
      })
  })
}