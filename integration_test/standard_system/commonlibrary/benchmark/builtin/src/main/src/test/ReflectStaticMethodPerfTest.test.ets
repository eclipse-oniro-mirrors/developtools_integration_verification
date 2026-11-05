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
  public testValue: int = 0;

  public static staticMethod(): number {
    return 42;
  }

  public static staticMethodWithArgs(a: number, b: number): number {
    return a + b;
  }

  public static async staticAsyncMethod(): Promise<number> {
    return 100;
  }

  public static get staticGetter(): number {
    return 1;
  }

  public static set staticSetter(value: number) {
    // no-op
  }
}

function getTestClass(): Class {
  return Class.from<TestClass>();
}

function createTestClassType(): ClassType {
  let cls = getTestClass();
  return Type.resolve(cls.getDescriptor(), cls.getLinker()) as ClassType;
}

function getStaticMethod(name: string): Method | undefined {
  let classType = createTestClassType();
  for (let i = 0; i < classType.getMethodsNum(); i++) {
    let method = classType.getMethod(i);
    if (method.isStatic() && method.getName() === name) {
      return method;
    }
  }
  return undefined;
}

export default function ReflectStaticMethodPerfTest(): void {
  describe('ReflectStaticMethodPerfTest', () => {
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

    // Test isAsync method
    it('PerformanceTest_StaticMethod_isAsync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getStaticMethod("staticAsyncMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isAsync();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_isAsync_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'isAsync',
        'isAsync(): boolean', arkTsAveragedTime);
    })

    // Test equals method
    it('PerformanceTest_StaticMethod_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method1 = getStaticMethod("staticMethod");
      let method2 = getStaticMethod("staticMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method1!.equals(method2!);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'equals',
        'equals(other: StaticMethod): boolean', arkTsAveragedTime);
    })


    // Test getName method
    it('PerformanceTest_StaticMethod_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getStaticMethod("staticMethod");
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

  })
}
