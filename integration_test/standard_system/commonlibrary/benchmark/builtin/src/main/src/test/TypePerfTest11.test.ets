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

function callbackFunc(a: int, b: string): boolean {
  return true;
}

class TestClass {
  public instanceMethod(x: int): string {
    return "result";
  }

  public static staticMethod(x: int): string {
    return "static";
  }
}

// UnionData 类型定义
type UnionData = int | string | boolean;

// 获取方法辅助函数 - 使用 getMethod(index) 获取 Method 类型
function getClassMethod(cls: Class | undefined, methodName: string) {
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  let type = Type.resolve(td, linker);
  if (type instanceof ClassType) {
    // 遍历方法列表，通过名字匹配
    for (let i = 0; i < type.getMethodsNum(); i++) {
      let method = type.getMethod(i);
      if (method.getName() === methodName) {
        return method;
      }
    }
  }
  return undefined;
}

export default function TypePerfTest11(): void {
  describe('TypePerfTest11', () => {
    const BASE_COUNT = 50000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    // ==================== MethodType getDeclaringClass 测试 ====================
    // 注：Method.getDeclaringClass() API 不存在，注释
    /*
    it('PerformanceTest_MethodType_getDeclaringClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getDeclaringClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getDeclaringClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getDeclaringClass',
        'getDeclaringClass(): Class', arkTsAveragedTime);
    });
    */

    // ==================== MethodType getReturnType 测试 ====================
    // 注：Method.getReturnType() API 不存在，注释
    /*
    it('PerformanceTest_MethodType_getReturnType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getReturnType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getReturnType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getReturnType',
        'getReturnType(): Type', arkTsAveragedTime);
    });
    */

    // ==================== MethodType getParameterTypes 测试 ====================
    // 注：Method.getParameterTypes() API 不存在，注释
    /*
    it('PerformanceTest_MethodType_getParameterTypes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: Type[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getParameterTypes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getParameterTypes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getParameterTypes',
        'getParameterTypes(): Type[]', arkTsAveragedTime);
    });
    */

    // ==================== MethodType getName 测试 ====================

    it('PerformanceTest_MethodType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    // ==================== MethodType getModifiers 测试 ====================
    // 注：Method.getModifiers() API 不存在，注释
    /*
    it('PerformanceTest_MethodType_getModifiers_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getModifiers();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getModifiers_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getModifiers',
        'getModifiers(): int', arkTsAveragedTime);
    });
    */

    // ==================== MethodType isStatic 测试 ====================

    it('PerformanceTest_MethodType_isStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let staticMethod = getClassMethod(cls, "staticMethod");
      if (staticMethod === undefined) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = staticMethod.isStatic();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_isStatic_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'isStatic',
        'isStatic(): boolean', arkTsAveragedTime);
    });

    // ==================== MethodType getAccessModifier 测试 ====================
    // 注：Method 没有 isPublic()，使用 getAccessModifier() 替代

    it('PerformanceTest_MethodType_getAccessModifier_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.getAccessModifier();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getAccessModifier_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'getAccessModifier',
        'getAccessModifier(): int', arkTsAveragedTime);
    });

    // ==================== MethodType isAbstract 测试 ====================

    it('PerformanceTest_MethodType_isAbstract_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let method = getClassMethod(cls, "instanceMethod");
      if (method === undefined) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = method.isAbstract();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_isAbstract_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Method', 'isAbstract',
        'isAbstract(): boolean', arkTsAveragedTime);
    });

    // ==================== FunctionType getCapturedVarsNum 测试 ====================
    // 注：FunctionType.getCapturedVarsNum() API 不存在，注释
    /*
    it('PerformanceTest_FunctionType_getCapturedVarsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func = callbackFunc;
      let funcType = Type.of(func);
      let result: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (funcType as FunctionType).getCapturedVarsNum();
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getCapturedVarsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getCapturedVarsNum',
        'getCapturedVarsNum(): long', arkTsAveragedTime);
    });
    */

    // ==================== FunctionType getCapturedVars 测试 ====================
    // 注：FunctionType.getCapturedVars() API 不存在，注释
    /*
    it('PerformanceTest_FunctionType_getCapturedVars_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func = callbackFunc;
      let funcType = Type.of(func);
      let result: Object[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (funcType as FunctionType).getCapturedVars();
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getCapturedVars_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getCapturedVars',
        'getCapturedVars(): Object[]', arkTsAveragedTime);
    });
    */

    // ==================== FunctionType getReceiverType 测试 ====================
    // 注：FunctionType.getReceiverType() API 不存在，注释
    /*
    it('PerformanceTest_FunctionType_getReceiverType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func = callbackFunc;
      let funcType = Type.of(func);
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (funcType as FunctionType).getReceiverType();
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getReceiverType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getReceiverType',
        'getReceiverType(): Type', arkTsAveragedTime);
    });
    */

    // ==================== UnionType getBase 测试 ====================
    // 注：UnionType.getBase() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_getBase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (unionType as UnionType).getBase();
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getBase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getBase',
        'getBase(): Type', arkTsAveragedTime);
    });

    // ==================== UnionType getCaseType 测试 ====================
    // 注：UnionType.getCaseType() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_getCaseType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (unionType as UnionType).getCaseType(0);
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getCaseType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getCaseType',
        'getCaseType(index: long): Type', arkTsAveragedTime);
    });
    */

    // ==================== UnionType getCaseTypesNum 测试 ====================
    // 注：UnionType.getCaseTypesNum() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_getCaseTypesNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: long = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        try {
          result = (unionType as UnionType).getCaseTypesNum();
        } catch (e) {
          // not available
        }
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getCaseTypesNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getCaseTypesNum',
        'getCaseTypesNum(): long', arkTsAveragedTime);
    });
    */

    // ==================== ClassType getBase 测试 ====================
    // 注：ClassType.getBase() API 不存在，注释
    /*
    it('PerformanceTest_ClassType_getBase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      if (cls === undefined) {
        return;
      }
      let clsType = Type.of(cls);
      let result: ClassType | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (clsType as ClassType).getBase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getBase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getBase',
        'getBase(): ClassType', arkTsAveragedTime);
    });

    // ==================== ClassType getSuperClass 测试 ====================
    // 注：ClassType.getSuperClass() API 不存在，注释
    /*
    it('PerformanceTest_ClassType_getSuperClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      if (cls === undefined) {
        return;
      }
      let clsType = Type.of(cls);
      let result: ClassType | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (clsType as ClassType).getSuperClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getSuperClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getSuperClass',
        'getSuperClass(): ClassType', arkTsAveragedTime);
    });
    */

    // ==================== ClassType getDeclaringClass 测试 ====================
    // 注：ClassType.getDeclaringClass() API 不存在，注释
    /*
    it('PerformanceTest_ClassType_getDeclaringClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      if (cls === undefined) {
        return;
      }
      let clsType = Type.of(cls);
      let result: ClassType | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (clsType as ClassType).getDeclaringClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getDeclaringClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getDeclaringClass',
        'getDeclaringClass(): ClassType', arkTsAveragedTime);
    });
    */

    // ==================== ClassType isFinal 测试 ====================

    it('PerformanceTest_ClassType_isFinal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      if (cls === undefined) {
        return;
      }
      let clsType = Type.of(cls);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (clsType as ClassType).isFinal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_isFinal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'isFinal',
        'isFinal(): boolean', arkTsAveragedTime);
    });

    // ==================== ClassType isAbstract 测试 ====================
    // 注：ClassType.isAbstract() API 不存在，注释
    /*
    it('PerformanceTest_ClassType_isAbstract_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      if (cls === undefined) {
        return;
      }
      let clsType = Type.of(cls);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (clsType as ClassType).isAbstract();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_isAbstract_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'isAbstract',
        'isAbstract(): boolean', arkTsAveragedTime);
    });*/
  });
}
