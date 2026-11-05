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

interface InterfaceA {
  methodA(): int;
}

interface InterfaceB {
  methodB(): string;
}

interface InterfaceC extends InterfaceA {
  methodC(): boolean;
}

class ClassImplementingInterfaces implements InterfaceA, InterfaceB {
  public methodA(): int {
    return 1;
  }

  public methodB(): string {
    return "test";
  }
}

class ClassImplementingExtendedInterface implements InterfaceC {
  public methodA(): int {
    return 2;
  }

  public methodC(): boolean {
    return true;
  }
}

class BaseClass {
  public baseMethod(): void {
  }
}

class DerivedClass extends BaseClass {
  public derivedMethod(): void {
  }
}

enum TestEnum {
  A = 1,
  B = 2,
  C = 3
}

export default function TypePerfTest07(): void {
  describe('TypePerfTest07', () => {
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

    // ==================== InterfaceType getInterfaces 测试 ====================

    /* it('PerformanceTest_InterfaceType_getInterfaces_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ClassImplementingExtendedInterface>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: InterfaceType[] = interfaceType.getInterfaces();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getInterfaces();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getInterfaces_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getInterfaces',
        'getInterfaces(): InterfaceType[]', arkTsAveragedTime);
    });
    */

    // ==================== InterfaceType getMethods 测试 ====================

    /* it('PerformanceTest_InterfaceType_getMethods_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceC>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: Method[] = interfaceType.getMethods();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getMethods();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getMethods_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getMethods',
        'getMethods(): Method[]', arkTsAveragedTime);
    }); */

    // ==================== InterfaceType getMethodsNum 测试 ====================

    it('PerformanceTest_InterfaceType_getMethodsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceC>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: long = interfaceType.getMethodsNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getMethodsNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getMethodsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getMethodsNum',
        'getMethodsNum(): long', arkTsAveragedTime);
    });

    /* // ==================== InterfaceType getMethod 测试 ====================

    it('PerformanceTest_InterfaceType_getMethod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceC>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: Method | undefined = interfaceType.getMethod("methodA");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getMethod("methodA");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getMethod_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getMethod',
        'getMethod(name: string): Method | undefined', arkTsAveragedTime);
    }); */

    /* // ==================== InterfaceType getBasesNum 测试 ====================

    it('PerformanceTest_InterfaceType_getBasesNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceC>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: long = interfaceType.getBasesNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getBasesNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getBasesNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getBasesNum',
        'getBasesNum(): long', arkTsAveragedTime);
    }); */

    /* // ==================== InterfaceType getBase 测试 ====================

    it('PerformanceTest_InterfaceType_getBase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceC>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: InterfaceType | undefined = interfaceType.getBase(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getBase(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getBase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getBase',
        'getBase(i: long): InterfaceType | undefined', arkTsAveragedTime);
    }); */

    // ==================== InterfaceType hasSuperInterface 测试 ====================

    it('PerformanceTest_InterfaceType_hasSuperInterface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsC = Class.from<InterfaceC>();
      let clsA = Class.from<InterfaceA>();
      if (clsC === undefined || clsA === undefined) {
        return;
      }
      let tdC = clsC.getDescriptor();
      let linkerC = clsC.getLinker();
      let tdA = clsA.getDescriptor();
      let linkerA = clsA.getLinker();
      let interfaceTypeC = Type.resolve(tdC, linkerC);
      let interfaceTypeA = Type.resolve(tdA, linkerA);
      if (!(interfaceTypeC instanceof InterfaceType) || !(interfaceTypeA instanceof InterfaceType)) {
        return;
      }
      let result: boolean = interfaceTypeC.hasSuperInterface(interfaceTypeA);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceTypeC.hasSuperInterface(interfaceTypeA);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_hasSuperInterface_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'hasSuperInterface',
        'hasSuperInterface(iface: InterfaceType): boolean', arkTsAveragedTime);
    });

    /* // ==================== ClassType getBase 测试 ====================

    it('PerformanceTest_ClassType_getBase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<DerivedClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: ClassType | undefined = classType.getBase();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getBase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getBase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getBase',
        'getBase(): ClassType | undefined', arkTsAveragedTime);
    }); */

    /* // ==================== ClassType getSuperClass 测试 ====================

    it('PerformanceTest_ClassType_getSuperClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<DerivedClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let classType = Type.resolve(td, linker);
      if (!(classType instanceof ClassType)) {
        return;
      }
      let result: Class | undefined = classType.getSuperClass();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = classType.getSuperClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getSuperClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getSuperClass',
        'getSuperClass(): Class | undefined', arkTsAveragedTime);
    }); */

    // ==================== ClassType isAssignableFrom 不同类型测试 ====================

    it('PerformanceTest_ClassType_assignableFrom_ClassType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let baseCls = Class.from<BaseClass>();
      let derivedCls = Class.from<DerivedClass>();
      if (baseCls === undefined || derivedCls === undefined) {
        return;
      }
      let baseTd = baseCls.getDescriptor();
      let baseLinker = baseCls.getLinker();
      let derivedTd = derivedCls.getDescriptor();
      let derivedLinker = derivedCls.getLinker();
      let baseType = Type.resolve(baseTd, baseLinker);
      let derivedType = Type.resolve(derivedTd, derivedLinker);
      if (!(baseType instanceof ClassType) || !(derivedType instanceof ClassType)) {
        return;
      }
      let result: boolean = baseType.assignableFrom(derivedType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = baseType.assignableFrom(derivedType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_assignableFrom_ClassType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== ArrayType 深度测试 ====================

    it('PerformanceTest_ArrayType_2D_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr2d: int[][] = [[1, 2], [3, 4]];
      let result: Type = Type.of(arr2d);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr2d);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_2D_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'Type.of(2D array): Type', arkTsAveragedTime);
    });

    /* it('PerformanceTest_ArrayType_getComponentType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: int[] = [1, 2, 3];
      let arrayType = Type.of(arr);
      if (!(arrayType instanceof ArrayType)) {
        return;
      }
      let result: Type = arrayType.getComponentType()!;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arrayType.getComponentType()!;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_getComponentType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'getComponentType',
        'getComponentType(): Type', arkTsAveragedTime);
    }); */

    // ==================== StringType convertObject 测试 ====================
    // 与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_StringType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stringType = Type.of("test");
      if (!(stringType instanceof StringType)) {
        return;
      }
      let value = "hello";
      let result: Any = stringType.convertObject(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = stringType.convertObject(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    }); */

    // ==================== TypeKind 测试 ====================

    it('PerformanceTest_TypeKind_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let kind1: byte = TypeKind.INT;
      let kind2: byte = TypeKind.INT;
      let kind3: byte = TypeKind.STRING;
      let result = (kind1 == kind2) && (kind1 != kind3);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (kind1 == kind2) && (kind1 != kind3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeKind_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeKind', 'equals',
        'TypeKind comparison', arkTsAveragedTime);
    });

    // ==================== Attributes 测试 ====================

    it('PerformanceTest_Attributes_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attr: int = Attributes.STATIC;
      let result = attr & Attributes.STATIC;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = attr & Attributes.STATIC;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_STATIC_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'STATIC',
        'Attributes.STATIC', arkTsAveragedTime);
    });

    it('PerformanceTest_Attributes_FINAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attr: int = Attributes.FINAL;
      let result = attr & Attributes.FINAL;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = attr & Attributes.FINAL;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_FINAL_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'FINAL',
        'Attributes.FINAL', arkTsAveragedTime);
    });

    // ==================== AccessModifier 测试 ====================

    it('PerformanceTest_AccessModifier_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let modifier: byte = AccessModifier.PUBLIC;
      let result = modifier == AccessModifier.PUBLIC;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = modifier == AccessModifier.PUBLIC;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AccessModifier_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AccessModifier', 'PUBLIC',
        'AccessModifier comparison', arkTsAveragedTime);
    });

    /* // ==================== ValueTypeDesc 测试 ====================

    it('PerformanceTest_ValueTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: string = ValueTypeDesc.INT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        let result = td == ValueTypeDesc.INT;
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'INT',
        'ValueTypeDesc comparison', arkTsAveragedTime);
    }); */
  });
}
