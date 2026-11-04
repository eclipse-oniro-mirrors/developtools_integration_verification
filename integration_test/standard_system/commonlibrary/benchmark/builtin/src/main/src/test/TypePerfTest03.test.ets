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

interface SampleInterfaceA {
  methodA(): void;
}

interface SampleInterfaceB {
  methodB(): int;
}

interface SampleInterfaceC extends SampleInterfaceA {
  methodC(): string;
}

function getSampleInterfaceAType(): InterfaceType | undefined {
  let cls = Class.from<SampleInterfaceA>();
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  return Type.resolve(td, linker) as InterfaceType;
}

function getSampleInterfaceBType(): InterfaceType | undefined {
  let cls = Class.from<SampleInterfaceB>();
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  return Type.resolve(td, linker) as InterfaceType;
}

function getSampleInterfaceCType(): InterfaceType | undefined {
  let cls = Class.from<SampleInterfaceC>();
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  return Type.resolve(td, linker) as InterfaceType;
}

export default function TypePerfTest03(): void {
  describe('TypePerfTest03', () => {
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

    // ==================== InterfaceType 特有方法测试 ====================

    it('PerformanceTest_InterfaceType_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceAType();
      if (value === undefined) {
        return;
      }
      let result: Class = value.getClass();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getClass',
        'getClass(): Class', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getInterfacesNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceCType();
      if (value === undefined) {
        return;
      }
      let result: long = value.getInterfacesNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getInterfacesNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getInterfacesNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getInterfacesNum',
        'getInterfacesNum(): long', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getInterface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceCType();
      if (value === undefined) {
        return;
      }
      let result: InterfaceType = value.getInterface(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getInterface(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getInterface_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getInterface',
        'getInterface(i: long): InterfaceType', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getMethodsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceAType();
      if (value === undefined) {
        return;
      }
      let result: long = value.getMethodsNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getMethodsNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getMethodsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getMethodsNum',
        'getMethodsNum(): long', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getMethod_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceAType();
      if (value === undefined) {
        return;
      }
      let result: Method = value.getMethod(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getMethod(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getMethod_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getMethod',
        'getMethod(i: long): Method', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_hasSuperInterface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parentType: InterfaceType | undefined = getSampleInterfaceAType();
      let childType: InterfaceType | undefined = getSampleInterfaceCType();
      if (parentType === undefined || childType === undefined) {
        return;
      }
      let result: boolean = childType.hasSuperInterface(parentType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = childType.hasSuperInterface(parentType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_hasSuperInterface_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'hasSuperInterface',
        'hasSuperInterface(expected: InterfaceType): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_hasSuperInterface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type: InterfaceType | undefined = getSampleInterfaceAType();
      if (type === undefined) {
        return;
      }
      let result: boolean = type.hasSuperInterface(type);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.hasSuperInterface(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_hasSuperInterface_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'hasSuperInterface',
        'hasSuperInterface(expected: InterfaceType): boolean', arkTsAveragedTime);
    });

    // ==================== Type 基类方法测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_Type_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: Type = IntType.VAL;
      let result: string = value.getTypeDesc();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getTypeDesc();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'getTypeDesc',
        'getTypeDesc(): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: Type = StringType.REF;
      let result: Class | undefined = value.getClass();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'getClass',
        'getClass(): Class | undefined', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: Type = IntType.VAL;
      let other: Type = ByteType.VAL;
      let result: boolean = value.assignableFrom(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.assignableFrom(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: Type = IntType.VAL;
      let result: string = value.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_toString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'toString',
        'toString(): string', arkTsAveragedTime);
    }); */

    // ==================== EnumType 特有方法测试 ====================

    it('PerformanceTest_EnumType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
        return;
      }
      let result: Any = value.convertObject(GC.Cause.FULL);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.convertObject(GC.Cause.FULL);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    });

    // ==================== LambdaType convertObject 测试 ====================

    it('PerformanceTest_LambdaType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda: () => int = (): int => { return 1; };
      let value: Type = Type.of(lambda);
      if (!(value instanceof LambdaType)) {
        return;
      }
      let result: Any = value.convertObject(lambda);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.convertObject(lambda);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    });

    // ==================== UnionType convertObject 测试 ====================

    it('PerformanceTest_UnionType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value1: number | string = 1;
      let type: Type = Type.of(value1);
      if (!(type instanceof UnionType)) {
        return;
      }
      let value: number | string = 123;
      let result: Any = type.convertObject(value);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.convertObject(value);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    });

    // ==================== ArrayType 更多方法测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_ArrayType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let arr: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
      let result: Any = value.convertObject(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.convertObject(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    }); */

    // ==================== TypeAPI 静态方法测试 ====================
    // 注意：TypeAPI 是 Type.ets 的内部类，未导出，无法直接使用
    // 以下测试用例暂时注释，待后续确认 API 可用性后再启用

    /*
    it('PerformanceTest_TypeAPI_getNullTypeDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: TypeDescriptor = TypeAPI.getNullTypeDescriptor();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getNullTypeDescriptor();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getNullTypeDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getNullTypeDescriptor',
        'getNullTypeDescriptor(): TypeDescriptor', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_getUndefinedTypeDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: TypeDescriptor = TypeAPI.getUndefinedTypeDescriptor();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getUndefinedTypeDescriptor();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getUndefinedTypeDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getUndefinedTypeDescriptor',
        'getUndefinedTypeDescriptor(): TypeDescriptor', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_getTypeName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<number>();
      if (cls === undefined) {
        return;
      }
      let result: string = TypeAPI.getTypeName(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getTypeName(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getTypeName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getTypeName',
        'getTypeName(cls: Class): string', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_convertTypeDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "I";
      let result: RuntimeTypeDescriptor = TypeAPI.convertTypeDescriptor(td);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.convertTypeDescriptor(td);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_convertTypeDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'convertTypeDescriptor',
        'convertTypeDescriptor(td: TypeDescriptor): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    it('PerformanceTest_TypeAPI_getTypeDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: int = 1;
      let result: RuntimeTypeDescriptor = TypeAPI.getTypeDescriptor(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = TypeAPI.getTypeDescriptor(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TypeAPI_getTypeDescriptor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TypeAPI', 'getTypeDescriptor',
        'getTypeDescriptor(o: Object): RuntimeTypeDescriptor', arkTsAveragedTime);
    });
    */
  });
}
