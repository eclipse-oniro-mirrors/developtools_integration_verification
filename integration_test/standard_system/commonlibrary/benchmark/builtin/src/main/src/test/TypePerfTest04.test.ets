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

class SampleFieldClass {
  public fieldA: int = 1;
  public fieldB: string = "test";
  private fieldC: boolean = true;
  protected fieldD: double = 1.5;
}

class SampleMethodClass {
  public methodA(): int {
    return 1;
  }

  public methodB(p1: int, p2: string): boolean {
    return true;
  }

  private methodC(): void {
  }

  protected methodD(p1: double): string {
    return "test";
  }

  public static staticMethod(): void {
  }
}

class SampleInterfaceField extends SampleMethodClass {
  public methodA(): int {
    return 2;
  }

  public methodB(p1: int, p2: string): boolean {
    return false;
  }

  private methodC(): void {
  }

  protected methodD(p1: double): string {
    return "override";
  }

  public static staticMethod(): void {
  }
}

interface SampleInterfaceField2 {
  fieldInterfaceMethod(): int;
}

class SampleInterfaceFieldImpl implements SampleInterfaceField2 {
  public fieldInterfaceMethod(): int {
    return 100;
  }
}

export default function TypePerfTest04(): void {
  describe('TypePerfTest04', () => {
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
    // 以下测试用例暂时注释，待后续确认 API 可用性后再启用

    it('PerformanceTest_TypeAPI_getTypeKind_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let result: byte = TypeAPI.getTypeKind(td, linker);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getTypeKind(td, linker);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getTypeKind_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getTypeKind',
        'getTypeKind(td: RuntimeTypeDescriptor, contextLinker: RuntimeLinker): byte', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_getTypeKind_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.of(1);
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let result: byte = TypeAPI.getTypeKind(td, linker);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getTypeKind(td, linker);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getTypeKind_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getTypeKind',
        'getTypeKind(td: RuntimeTypeDescriptor, contextLinker: RuntimeLinker): byte', arkTsAveragedTime);
    });

    // ==================== TypeAPI isValueType 测试 ====================

    it('PerformanceTest_TypeAPI_isValueType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.of(1);
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let result: boolean = TypeAPI.isValueType(td, linker);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.isValueType(td, linker);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_isValueType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'isValueType',
        'isValueType(td: RuntimeTypeDescriptor, contextLinker: RuntimeLinker): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_isValueType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let result: boolean = TypeAPI.isValueType(td, linker);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.isValueType(td, linker);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_isValueType_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'isValueType',
        'isValueType(td: RuntimeTypeDescriptor, contextLinker: RuntimeLinker): boolean', arkTsAveragedTime);
    });

    // ==================== TypeAPI getClass 测试 ====================

    it('PerformanceTest_TypeAPI_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let result: Class | undefined = TypeAPI.getClass(td, linker);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getClass(td, linker);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getClass',
        'getClass(td: RuntimeTypeDescriptor, contextLinker: RuntimeLinker): Class | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getClassAttributes 测试 ====================

    it('PerformanceTest_TypeAPI_getClassAttributes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let result: int = TypeAPI.getClassAttributes(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getClassAttributes(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getClassAttributes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getClassAttributes',
        'getClassAttributes(cls: Class): int', arkTsAveragedTime);
    });

    // ==================== TypeAPI getFieldsNum 测试 ====================

    it('PerformanceTest_TypeAPI_getFieldsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let result: long = TypeAPI.getFieldsNum(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFieldsNum(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFieldsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFieldsNum',
        'getFieldsNum(cls: Class): long', arkTsAveragedTime);
    });

    // ==================== TypeAPI getOwnFieldsNum 测试 ====================

    it('PerformanceTest_TypeAPI_getOwnFieldsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let result: long = TypeAPI.getOwnFieldsNum(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getOwnFieldsNum(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getOwnFieldsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getOwnFieldsNum',
        'getOwnFieldsNum(cls: Class): long', arkTsAveragedTime);
    });

    // ==================== TypeAPI getMethodsNum 测试 ====================

    it('PerformanceTest_TypeAPI_getMethodsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleMethodClass>();
      if (cls === undefined) {
        return;
      }
      let result: long = TypeAPI.getMethodsNum(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getMethodsNum(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getMethodsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getMethodsNum',
        'getMethodsNum(cls: Class): long', arkTsAveragedTime);
    });

    // ==================== TypeAPI getMethodDescriptor 测试 ====================

    it('PerformanceTest_TypeAPI_getMethodDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleMethodClass>();
      if (cls === undefined) {
        return;
      }
      let result: string | undefined = TypeAPI.getMethodDescriptor(cls, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getMethodDescriptor(cls, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getMethodDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getMethodDescriptor',
        'getMethodDescriptor(cls: Class, i: long): RuntimeTypeDescriptor | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getConstructorsNum 测试 ====================

    it('PerformanceTest_TypeAPI_getConstructorsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleMethodClass>();
      if (cls === undefined) {
        return;
      }
      let result: long = TypeAPI.getConstructorsNum(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getConstructorsNum(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getConstructorsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getConstructorsNum',
        'getConstructorsNum(cls: Class): long', arkTsAveragedTime);
    });

    // ==================== TypeAPI getConstructorDescriptor 测试 ====================

    it('PerformanceTest_TypeAPI_getConstructorDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleMethodClass>();
      if (cls === undefined) {
        return;
      }
      let result: string | undefined = TypeAPI.getConstructorDescriptor(cls, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getConstructorDescriptor(cls, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getConstructorDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getConstructorDescriptor',
        'getConstructorDescriptor(cls: Class, i: long): RuntimeTypeDescriptor | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI getInterfacesNum 测试 ====================

    it('PerformanceTest_TypeAPI_getInterfacesNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceFieldImpl>();
      if (cls === undefined) {
        return;
      }
      let result: long = TypeAPI.getInterfacesNum(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getInterfacesNum(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getInterfacesNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getInterfacesNum',
        'getInterfacesNum(cls: Class): long', arkTsAveragedTime);
    });

    // ==================== TypeAPI getInterface 测试 ====================

    it('PerformanceTest_TypeAPI_getInterface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceFieldImpl>();
      if (cls === undefined) {
        return;
      }
      let result: Class | undefined = TypeAPI.getInterface(cls, 0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getInterface(cls, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getInterface_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getInterface',
        'getInterface(cls: Class, i: long): Class | undefined', arkTsAveragedTime);
    });

    // ==================== TypeAPI isInheritedFrom 测试 ====================

    it('PerformanceTest_TypeAPI_isInheritedFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsA = Class.from<SampleMethodClass>();
      let clsB = Class.from<SampleInterfaceField>();
      if (clsA === undefined || clsB === undefined) {
        return;
      }
      let result: boolean = TypeAPI.isInheritedFrom(clsB, clsA);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.isInheritedFrom(clsB, clsA);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_isInheritedFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'isInheritedFrom',
        'isInheritedFrom(lhs: Class, rhs: Class): boolean', arkTsAveragedTime);
    });

    // ==================== TypeAPI getFunctionAttributes 测试 ====================

    it('PerformanceTest_TypeAPI_getFunctionAttributes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleMethodClass>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let result: int = TypeAPI.getFunctionAttributes(td);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getFunctionAttributes(td);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getFunctionAttributes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getFunctionAttributes',
        'getFunctionAttributes(td: RuntimeTypeDescriptor): int', arkTsAveragedTime);
    });

    // ==================== TypeAPI getArrayElementType 测试 ====================

    it('PerformanceTest_TypeAPI_getArrayElementType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: int[] = [1, 2, 3];
      let cls = Class.of(arr);
      let result: string = TypeAPI.getArrayElementType(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getArrayElementType(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getArrayElementType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getArrayElementType',
        'getArrayElementType(cls: Class): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    // ==================== TypeAPI makeArrayInstance 测试 ====================

    it('PerformanceTest_TypeAPI_makeArrayInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let elemType = Class.of(1);
      let td = elemType.getDescriptor();
      let linker = elemType.getLinker();
      let result: Object = TypeAPI.makeArrayInstance(td, linker, 10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.makeArrayInstance(td, linker, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_makeArrayInstance_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'makeArrayInstance',
        'makeArrayInstance(elemTD: RuntimeTypeDescriptor, contextLinker: RuntimeLinker, len: long): Object', arkTsAveragedTime);
    });

    // ==================== TypeAPI getClassDescriptor 测试 ====================

    it('PerformanceTest_TypeAPI_getClassDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleFieldClass>();
      if (cls === undefined) {
        return;
      }
      let result: string = TypeAPI.getClassDescriptor(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getClassDescriptor(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getClassDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getClassDescriptor',
        'getClassDescriptor(cls: Class): RuntimeTypeDescriptor', arkTsAveragedTime);
    });
    */
  });
}
