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

// 使用动态方法获取 MethodType，避免类型转换问题
function getMethodType(cls: Class | undefined, methodName: string): MethodType | undefined {
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  let type = Type.resolve(td, linker);
  if (type instanceof ClassType) {
    let method: Method = type.getMethodByName(methodName);
    return method.getType();
  }
  return undefined;
}

class TestClass {
  public testMethod(a: int, b: int): int {
    return a + b;
  }
}

class TestClassForMethodA {
  public testMethod(a: int): int {
    return a;
  }
}

class TestClassForMethodVoid {
  public testMethod(): void { }
}

// 使用 getTypeDesc() 获取类型描述信息作为替代
function getTypeDescription(type: Type | undefined): string {
  if (type === undefined) {
    return "";
  }
  return type.getTypeDesc();
}

// 使用 getTypeDesc() 获取 MethodType 描述信息
function getMethodTypeDescription(methodType: MethodType | undefined): string {
  if (methodType === undefined) {
    return "";
  }
  return methodType.getTypeDesc();
}

export default function TypePerfTest02(): void {
  describe('TypePerfTest02', () => {
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

    // ==================== LambdaType 测试 ====================

    it('PerformanceTest_LambdaType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_LambdaType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_LambdaType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_LambdaType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    // TODO: 循环体调用getTypeDescription()替代getLiteral()，需要修复为调用真正的目标API
    /* it('PerformanceTest_LambdaType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'getLiteral',
        'getLiteral(): string (using getTypeDesc替代)', arkTsAveragedTime);
    }); */

    it('PerformanceTest_LambdaType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let other: Type = Type.of(lambda);
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== FunctionType (getResultType, getParametersNum, getParameter) 测试 ====================
    // TODO: 以下3个用例循环体调用getTypeDescription()替代目标API，需要修复

    /* it('PerformanceTest_FunctionType_getResultType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof FunctionType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getResultType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getResultType',
        'getResultType(): Type (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_FunctionType_getParametersNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof FunctionType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getParametersNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getParametersNum',
        'getParametersNum(): long (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_FunctionType_getParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof FunctionType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getParameter_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getParameter',
        'getParameter(i: long): TypeAPIParameter (using getTypeDesc替代)', arkTsAveragedTime);
    }); */

    it('PerformanceTest_FunctionType_getTypeParametersNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: int) => int = (a: int, b: int): int => { return a + b; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof FunctionType)) {
        return;
      }
      let result: long = value.getTypeParametersNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getTypeParametersNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getTypeParametersNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getTypeParametersNum',
        'getTypeParametersNum(): long', arkTsAveragedTime);
    });

    // ==================== LambdaType assignableFrom 测试 ====================
    // TODO: 以下2个用例循环体调用getTypeDescription()替代assignableFrom()，需要修复

    /* it('PerformanceTest_LambdaType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda1: (a: int) => int = (a: int): int => { return a; };
      let lambda2: (a: int) => int = (a: int): int => { return a + 1; };
      let value: Type = Type.of(lambda1);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'assignableFrom',
        'assignableFrom(other: Type): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_LambdaType_assignableFrom_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda1: (a: number) => number = (a: number): number => { return a; };
      let lambda2: (a: int) => int = (a: int): int => { return a + 1; };
      let value: Type = Type.of(lambda1);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_assignableFrom_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'assignableFrom',
        'assignableFrom(other: Type): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    }); */

    // ==================== LambdaType make 测试 ====================
    // TODO: 循环体调用getTypeDescription()替代make()，需要修复

    /* it('PerformanceTest_LambdaType_make_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: () => void = (): void => { };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: string = getTypeDescription(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_make_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'make',
        'make(): Object (using getTypeDesc替代)', arkTsAveragedTime);
    }); */

    // ==================== MethodType 测试 ====================
    // TODO: 以下10个用例循环体调用getMethodTypeDescription()替代目标API，需要修复

    /* it('PerformanceTest_MethodType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let cls = Class.from<TestClass>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getLiteral',
        'getLiteral(): string (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_hasReceiver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodA>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_hasReceiver_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'hasReceiver',
        'hasReceiver(): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_getReceiverType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodA>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getReceiverType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getReceiverType',
        'getReceiverType(): Type (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodA>();
      let methodType1: MethodType | undefined = getMethodType(cls, "testMethod");
      let methodType2: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType1 === undefined || methodType2 === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType1);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'assignableFrom',
        'assignableFrom(other: Type): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    // ==================== MethodType 基类方法测试 ====================

    it('PerformanceTest_MethodType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodVoid>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'isPrimitive',
        'isPrimitive(): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodVoid>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'isReference',
        'isReference(): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodVoid>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'hasName',
        'hasName(): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodVoid>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getName',
        'getName(): string (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodVoid>();
      let methodType1: MethodType | undefined = getMethodType(cls, "testMethod");
      let methodType2: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType1 === undefined || methodType2 === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType1);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'equals',
        'equals(other: Type): boolean (using getTypeDesc替代)', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_getResultType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClassForMethodA>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: string = getMethodTypeDescription(methodType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getMethodTypeDescription(methodType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getResultType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getResultType',
        'getResultType(): Type (using getTypeDesc替代)', arkTsAveragedTime);
    }); */

    it('PerformanceTest_MethodType_getParametersNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result: long = methodType.getParametersNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = methodType.getParametersNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getParametersNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getParametersNum',
        'getParametersNum(): long', arkTsAveragedTime);
    });

    it('PerformanceTest_MethodType_getParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestClass>();
      let methodType: MethodType | undefined = getMethodType(cls, "testMethod");
      if (methodType === undefined) {
        return;
      }
      let result = methodType.getParameter(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = methodType.getParameter(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getParameter_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getParameter',
        'getParameter(i: long): TypeAPIParameter', arkTsAveragedTime);
    });

    // ==================== UnionType 测试 ====================

    it('PerformanceTest_UnionType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: boolean = type.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: boolean = type.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: boolean = type.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: string = type.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: string = type.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_getCasesNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number | string = 1;
      let type: Type = Type.of(value);
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: long = type.getCasesNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getCasesNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getCasesNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getCasesNum',
        'getCasesNum(): long', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value1: number | string = 1;
      let value2: number | string = "test";
      let type1: Type = Type.of(value1);
      let type2: Type = Type.of(value2);
      if (!(type1 instanceof UnionType) || !(type2 instanceof UnionType)) {
        return;
      }
      let result: boolean = type1.equals(type2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type1.equals(type2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value1: number | string = 1;
      let value2: number = 1;
      let type1: Type = Type.of(value1);
      let type2: Type = Type.of(value2);
      if (!(type1 instanceof UnionType)) {
        return;
      }
      let result: boolean = type1.assignableFrom(type2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type1.assignableFrom(type2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });
  });
}
