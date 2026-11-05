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
  public static staticField: number = 42;
  public static readonly readonlyField: number = 100;
}

function getTestClass(): Class {
  return Class.from<TestClass>();
}

function createTestClassType(): ClassType {
  let cls = getTestClass();
  return Type.resolve(cls.getDescriptor(), cls.getLinker()) as ClassType;
}

function getStaticField(name: string): Field | undefined {
  let classType = createTestClassType();
  for (let i = 0; i < classType.getFieldsNum(); i++) {
    let field = classType.getField(i);
    if (field.isStatic() && field.getName() === name) {
      return field;
    }
  }
  return undefined;
}

export default function ReflectStaticFieldPerfTest(): void {
  describe('ReflectStaticFieldPerfTest', () => {
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
    it('PerformanceTest_StaticField_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field1 = getStaticField("staticField");
      let field2 = getStaticField("staticField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field1!.equals(field2!);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticField_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticField', 'equals',
        'equals(other: StaticField): boolean', arkTsAveragedTime);
    })

    // Test getStaticValue method
    it('PerformanceTest_StaticField_getStaticValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getStaticField("staticField");
      let res:Any = field!.getStaticValue();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.getStaticValue();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticField_getStaticValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticField', 'getStaticValue',
        'getStaticValue(): Any', arkTsAveragedTime);
    })

    // Test setStaticValue method
    it('PerformanceTest_StaticField_setStaticValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getStaticField("staticField");
      let res: void | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.setStaticValue(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticField_setStaticValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticField', 'setStaticValue',
        'setStaticValue(value: Any): void', arkTsAveragedTime);
    })

  })
}
