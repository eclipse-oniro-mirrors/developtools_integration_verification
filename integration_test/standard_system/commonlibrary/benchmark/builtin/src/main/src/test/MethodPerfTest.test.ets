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

// 测试类，用于通过反射获取 Method 实例
class SampleMethodClass {
  public testValue: int = 0;

  public constructor() {
    this.testValue = 0;
  }

  public sampleMethod(): int {
    return this.testValue;
  }

  public static staticMethod(): int {
    return 42;
  }
}

function getSampleMethodClass(): Class {
  return Class.from<SampleMethodClass>();
}

function createSampleMethodType(): ClassType {
  let cls = getSampleMethodClass();
  return Type.resolve(cls.getDescriptor(), cls.getLinker()) as ClassType;
}

// 获取一个 Method 实例
function getMethodInstance(): Method {
  let classType = createSampleMethodType();
  // 遍历找到非静态方法
  for (let i = 0; i < classType.getMethodsNum(); i++) {
    let method = classType.getMethod(i);
    if (!method.isStatic()) {
      return method;
    }
  }
  throw new Error("No non-static method found");
}

// 获取另一个 Method 实例用于 equals 测试
function getAnotherMethodInstance(): Method {
  let classType = createSampleMethodType();
  let foundFirst = false;
  for (let i = 0; i < classType.getMethodsNum(); i++) {
    let method = classType.getMethod(i);
    if (!method.isStatic()) {
      if (foundFirst) {
        return method;
      }
      foundFirst = true;
    }
  }
  throw new Error("Not enough methods found");
}

export default function MethodPerfTest() : void{
  describe('MethodPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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

    it('PerformanceTest_Method_getType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.getType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_getType_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'getType',
        'public getType(): MethodType',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_getOwnerType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.getOwnerType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getOwnerType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_getOwnerType_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'getOwnerType',
        'public getOwnerType(): Type',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_getName_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'getName',
        'public getName(): string',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isStatic();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isStatic();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isStatic_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isStatic',
        'public isStatic(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isFinal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isFinal();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isFinal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isFinal_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isFinal',
        'public isFinal(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isAbstract_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isAbstract();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isAbstract();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isAbstract_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isAbstract',
        'public isAbstract(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isConstructor();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isConstructor();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isConstructor_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isConstructor',
        'public isConstructor(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isGetter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isGetter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isGetter();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isGetter_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isGetter',
        'public isGetter(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isSetter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isSetter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isSetter();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isSetter_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isSetter',
        'public isSetter(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isNative_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isNative();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isNative();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isNative_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isNative',
        'public isNative(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_isAsync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.isAsync();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isAsync();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_isAsync_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'isAsync',
        'public isAsync(): boolean',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_toString_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'toString',
        'public override toString(): string',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_invoke_instanceWithArgs_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let recv = new SampleMethodClass();
      let args = new FixedArray<Any>(0, undefined);
      let result = method.invoke(recv, args);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.invoke(recv, args);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_invoke_instanceWithArgs_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'invoke',
        'public invoke(recv: Any, args: FixedArray<Any>): Any',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_getAttributes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.getAttributes();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getAttributes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_getAttributes_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'getAttributes',
        'public getAttributes(): int',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_getAccessModifier_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let result = method.getAccessModifier();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getAccessModifier();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_getAccessModifier_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'getAccessModifier',
        'public getAccessModifier(): int',
        arkTsAveragedTime
      );
    })

    it('PerformanceTest_Method_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getMethodInstance();
      let otherMethod = getAnotherMethodInstance();
      let result = method.equals(otherMethod as Any);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.equals(otherMethod as Any);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Method_equals_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'Method',
        'equals',
        'public equals(oth: Any): boolean',
        arkTsAveragedTime
      );
    })
  })
}
