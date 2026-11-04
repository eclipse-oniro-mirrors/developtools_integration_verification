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

class TestClass {
  public instanceField: int = 42;
  public readonly readonlyField: int = 100;
}

function getInstanceField(name: string): reflect.InstanceField | undefined {
  let cls = Class.from<TestClass>();
  return cls.getInstanceField(name);
}

export default function ReflectInstanceFieldPerfTest(): void {
  describe('ReflectInstanceFieldPerfTest', () => {
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

    // Test equals method
    it('PerformanceTest_InstanceField_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field1 = getInstanceField("instanceField");
      let field2 = getInstanceField("instanceField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field1!.equals(field2!);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceField_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceField', 'equals',
        'equals(other: InstanceField): boolean', arkTsAveragedTime);
    })

    // Test getValue method
    it('PerformanceTest_InstanceField_getValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getInstanceField("instanceField");
      let obj = new TestClass();
      let res: Any = field!.getValue(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.getValue(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceField_getValue_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceField', 'getValue',
        'getValue(thisObj: Object): Any', arkTsAveragedTime);
    })

    // Test setValue method
    it('PerformanceTest_InstanceField_setValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getInstanceField("instanceField");
      let obj = new TestClass();
      let res: void | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        field!.setValue(obj, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceField_setValue_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceField', 'setValue',
        'setValue(thisObj: Object, value: Any): void', arkTsAveragedTime);
    })

  })
}
