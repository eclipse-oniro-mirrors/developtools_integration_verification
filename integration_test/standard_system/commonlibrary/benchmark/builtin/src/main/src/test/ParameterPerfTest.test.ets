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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

// 测试类，用于通过反射获取 TypeAPIParameter 实例
class SampleParamClass {
  public value: int = 0;

  public constructor() {
    this.value = 0;
  }

  public sampleMethod(a: int, b: string): int {
    return a;
  }
}

function getSampleParamClassType(): ClassType {
  let cls = Class.from<SampleParamClass>();
  return Type.resolve(cls.getDescriptor(), cls.getLinker()) as ClassType;
}

// 获取一个带参数方法的 MethodType，再获取 TypeAPIParameter
function getParamInstance(): TypeAPIParameter {
  let classType = getSampleParamClassType();
  for (let i = 0; i < classType.getMethodsNum(); i++) {
    let method = classType.getMethod(i);
    if (!method.isStatic() && method.getType().getParametersNum() > 0) {
      return method.getType().getParameter(0);
    }
  }
  throw new Error("No method with parameters found");
}

// 获取第二个参数实例用于 equals 测试
function getAnotherParamInstance(): TypeAPIParameter {
  let classType = getSampleParamClassType();
  for (let i = 0; i < classType.getMethodsNum(); i++) {
    let method = classType.getMethod(i);
    if (!method.isStatic() && method.getType().getParametersNum() > 1) {
      return method.getType().getParameter(1);
    }
  }
  throw new Error("No method with enough parameters found");
}

export default function ParameterPerfTest(): void {
  describe('ParameterPerfTest', () => {
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

    // getType() 测试
    it('PerformanceTest_Parameter_Method_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: Type = param.getType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.getType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'getType',
        'public getType(): Type', arkTsAveragedTime);
    })

    // getName() 测试
    it('PerformanceTest_Parameter_Method_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: string = param.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'getName',
        'public getName(): string', arkTsAveragedTime);
    })

    // getAttributes() 测试
    it('PerformanceTest_Parameter_Method_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: int = param.getAttributes();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.getAttributes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'getAttributes',
        'public getAttributes(): int', arkTsAveragedTime);
    })

    // isRest() 测试
    it('PerformanceTest_Parameter_Method_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: boolean = param.isRest();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.isRest();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'isRest',
        'public isRest(): boolean', arkTsAveragedTime);
    })

    // isOptional() 测试
    it('PerformanceTest_Parameter_Method_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: boolean = param.isOptional();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.isOptional();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'isOptional',
        'public isOptional(): boolean', arkTsAveragedTime);
    })

    // toString() 测试
    it('PerformanceTest_Parameter_Method_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param = getParamInstance();
      let res: string = param.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'toString',
        'public override toString(): string', arkTsAveragedTime);
    })

    // equals() 测试
    it('PerformanceTest_Parameter_Method_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let param1 = getParamInstance();
      let param2 = getAnotherParamInstance();
      let res: boolean = param1.equals(param2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = param1.equals(param2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Parameter_Method_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPIParameter', 'equals',
        'public equals(oth: Any): boolean', arkTsAveragedTime);
    })

  })
}
