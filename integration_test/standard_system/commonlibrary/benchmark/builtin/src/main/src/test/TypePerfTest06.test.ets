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

class SampleClassForField {
  public publicField: int = 1;
  public readonly readonlyField: string = "readonly";
  private privateField: boolean = true;
  protected protectedField: double = 1.5;
  public static staticField: long = 100;
}

class SubClassForField extends SampleClassForField {
  public subField: int = 2;
}

class SampleClassForMethod {
  public methodWithNoParams(): int {
    return 1;
  }

  public methodWithOneParam(p1: int): string {
    return p1.toString();
  }

  public methodWithTwoParams(p1: int, p2: string): boolean {
    return true;
  }

  public methodWithThreeParams(p1: int, p2: string, p3: boolean): double {
    return 1.5;
  }

  public static staticMethod(): void {
  }

  public static staticMethodWithParams(p1: int): string {
    return "static";
  }
}

export default function TypePerfTest06(): void {
  describe('TypePerfTest06', () => {
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

    /*
    // ==================== TypeAPI 测试 ====================
    // 注意：TypeAPI 是 Type.ets 的内部类，未导出，无法直接使用

    // ==================== TypeAPI getFieldPtr 测试 ====================

    it('PerformanceTest_TypeAPI_getFieldPtr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let result: Long | undefined = TypeAPI.getFieldPtr(cls, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFieldPtr(cls, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFieldPtr_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFieldPtr',
        'getFieldPtr(cls: Class, i: long): Long | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getOwnFieldPtr 测试 ====================

    it('PerformanceTest_TypeAPI_getOwnFieldPtr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let result: Long | undefined = TypeAPI.getOwnFieldPtr(cls, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getOwnFieldPtr(cls, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getOwnFieldPtr_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getOwnFieldPtr',
        'getOwnFieldPtr(cls: Class, i: long): Long | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getFieldPtrByName 测试 ====================

    it('PerformanceTest_TypeAPI_getFieldPtrByName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let result: Long | undefined = TypeAPI.getFieldPtrByName(cls, "publicField");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFieldPtrByName(cls, "publicField");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFieldPtrByName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFieldPtrByName',
        'getFieldPtrByName(cls: Class, name: string): Long | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getFieldDescriptor 测试 ====================

    it('PerformanceTest_TypeAPI_getFieldDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let fieldPtr = TypeAPI.getFieldPtr(cls, 0);
      if (fieldPtr === undefined) {
        return;
      }
      let result: string = TypeAPI.getFieldDescriptor(fieldPtr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFieldDescriptor(fieldPtr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFieldDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFieldDescriptor',
        'getFieldDescriptor(fieldPtr: long): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    // ==================== TypeAPI getFieldOwner 测试 ====================

    it('PerformanceTest_TypeAPI_getFieldOwner_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let fieldPtr = TypeAPI.getFieldPtr(cls, 0);
      if (fieldPtr === undefined) {
        return;
      }
      let result: Class = TypeAPI.getFieldOwner(fieldPtr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFieldOwner(fieldPtr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFieldOwner_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFieldOwner',
        'getFieldOwner(fieldPtr: long): Class', arkTsAveragedTime);
    });

    // ==================== TypeAPI getField 测试 ====================

    it('PerformanceTest_TypeAPI_getField_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let fieldPtr = TypeAPI.getFieldPtr(cls, 0);
      if (fieldPtr === undefined) {
        return;
      }
      let fieldType = Type.of(1);
      let ownerType = Type.resolve(cls.getDescriptor(), cls.getLinker())!;
      let result: Field = TypeAPI.getField(fieldPtr, fieldType, ownerType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getField(fieldPtr, fieldType, ownerType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getField_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getField',
        'getField(fieldPtr: long, fieldType: Type, ownerType: Type): Field', arkTsAveragedTime);
    });

    // ==================== TypeAPI getMethod 测试 ====================

    it('PerformanceTest_TypeAPI_getMethod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForMethod>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let methodType = Type.resolve(td, linker);
      if (!(methodType instanceof MethodType)) {
        return;
      }
      let ownerType = Type.resolve(cls.getDescriptor(), cls.getLinker())!;
      let result: Method = TypeAPI.getMethod(methodType, ownerType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getMethod(methodType, ownerType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getMethod_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getMethod',
        'getMethod(methodType: MethodType, ownerType: Type): Method', arkTsAveragedTime);
    });

    // ==================== TypeAPI getDeclaringClassImpl 测试 ====================

    it('PerformanceTest_TypeAPI_getDeclaringClassImpl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: () => int = (): int => { return 1; };
      let type = Type.of(lambda);
      if (!(type instanceof LambdaType)) {
        return;
      }
      let result: Class | undefined = TypeAPI.getDeclaringClassImpl(type);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getDeclaringClassImpl(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getDeclaringClassImpl_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getDeclaringClassImpl',
        'getDeclaringClassImpl(type: LambdaType | MethodType): Class | undefined', arkTsAveragedTime);
    });
    */

    /* ==================== ClassType getMethods 测试 ====================

    it('PerformanceTest_ClassType_getMethods_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForMethod>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: Method[] = classType.getMethods();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getMethods();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getMethods_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getMethods',
        'getMethods(): Method[]', arkTsAveragedTime);
    });
    */

    // ==================== ClassType getFields 测试 ====================

    /* it('PerformanceTest_ClassType_getFields_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForField>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: Field[] = classType.getFields();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getFields();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getFields_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getFields',
        'getFields(): Field[]', arkTsAveragedTime);
    });
    */

    /* ==================== ClassType getConstructors 测试 ====================

    it('PerformanceTest_ClassType_getConstructors_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForMethod>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: Method[] = classType.getConstructors();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getConstructors();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getConstructors_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getConstructors',
        'getConstructors(): Method[]', arkTsAveragedTime);
    });
    */

    // ==================== ClassType getInterfaces 测试 ====================

    /* interface SampleInterfaceForClass {
      interfaceMethod(): int;
    }

    class ClassWithInterface implements SampleInterfaceForClass {
      public interfaceMethod(): int {
        return 1;
      }
    }

    it('PerformanceTest_ClassType_getInterfaces_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ClassWithInterface>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: InterfaceType[] = classType.getInterfaces();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getInterfaces();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getInterfaces_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getInterfaces',
        'getInterfaces(): InterfaceType[]', arkTsAveragedTime);
    });
    */

    /* ==================== ClassType isAssignableFrom 测试 ====================

    it('PerformanceTest_ClassType_isAssignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parentCls = Class.from<SampleClassForField>();
      let childCls = Class.from<SubClassForField>();
      if (parentCls === undefined || childCls === undefined) {
        return;
      }
      let parentTd = parentCls.getDescriptor();
      let parentLinker = parentCls.getLinker();
      let childTd = childCls.getDescriptor();
      let childLinker = childCls.getLinker();
      let parentType = Type.resolve(parentTd, parentLinker);
      let childType = Type.resolve(childTd, childLinker);
      if (!(parentType instanceof ClassType) || !(childType instanceof ClassType)) {
        return;
      }
      let result: boolean = parentType.isAssignableFrom(childType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = parentType.isAssignableFrom(childType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_isAssignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'isAssignableFrom',
        'isAssignableFrom(other: ClassType): boolean', arkTsAveragedTime);
    });
    */

    /* ==================== MethodType hasReceiver 测试 ====================

    it('PerformanceTest_MethodType_hasReceiver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForMethod>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let methodType = classType.getMethodByName("methodWithNoParams");
      if (methodType === undefined) {
        return;
      }
      let result: boolean = methodType.hasReceiver();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = methodType.hasReceiver();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_hasReceiver_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'hasReceiver',
        'hasReceiver(): boolean', arkTsAveragedTime);
    });
    */

    /* ==================== MethodType getReceiverType 测试 ====================

    it('PerformanceTest_MethodType_getReceiverType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleClassForMethod>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let methodType = classType.getMethodByName("methodWithNoParams");
      if (methodType === undefined) {
        return;
      }
      let result: Type = methodType.getReceiverType()!;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = methodType.getReceiverType()!;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MethodType_getReceiverType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'MethodType', 'getReceiverType',
        'getReceiverType(): Type', arkTsAveragedTime);
    });

    /* ==================== FunctionType getResultTypeDescriptor 测试 ====================

    it('PerformanceTest_FunctionType_getResultTypeDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int) => string = (a: int): string => { return a.toString(); };
      let type = Type.of(lambda);
      if (!(type instanceof FunctionType)) {
        return;
      }
      let result: string = type.getResultTypeDescriptor();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getResultTypeDescriptor();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getResultTypeDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getResultTypeDescriptor',
        'getResultTypeDescriptor(): string', arkTsAveragedTime);
    });

    /* ==================== FunctionType getParameterDescriptor 测试 ====================

    it('PerformanceTest_FunctionType_getParameterDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: string) => boolean = (a: int, b: string): boolean => { return true; };
      let type = Type.of(lambda);
      if (!(type instanceof FunctionType)) {
        return;
      }
      let result: string = type.getParameterDescriptor(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getParameterDescriptor(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getParameterDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getParameterDescriptor',
        'getParameterDescriptor(i: long): string', arkTsAveragedTime);
    });
    */

    // ==================== FunctionType getParametersNum 测试 ====================
    // 注：getParametersNum API 不稳定，暂时注释
    /*
    it('PerformanceTest_FunctionType_getParametersNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: string, c: boolean) => double = (a: int, b: string, c: boolean): double => { return 1.0; };
      let type = Type.of(lambda);
      if (!(type instanceof FunctionType)) {
        return;
      }
      let result: long = type.getParametersNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getParametersNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getParametersNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getParametersNum',
        'getParametersNum(): long', arkTsAveragedTime);
    });
    */

    // ==================== FunctionType getParameter 测试 ====================
    /*
    it('PerformanceTest_FunctionType_getParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: (a: int, b: string) => boolean = (a: int, b: string): boolean => { return true; };
      let type = Type.of(lambda);
      if (!(type instanceof FunctionType)) {
        return;
      }
      let result: TypeAPIParameter = type.getParameter(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getParameter(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FunctionType_getParameter_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FunctionType', 'getParameter',
        'getParameter(i: long): TypeAPIParameter', arkTsAveragedTime);
    }); */

  });
}
