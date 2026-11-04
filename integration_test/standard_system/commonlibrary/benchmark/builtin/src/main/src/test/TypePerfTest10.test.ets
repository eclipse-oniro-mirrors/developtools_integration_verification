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

// EnumHelper 用于获取 EnumType
class EnumHelper {
  public static getEnumType(enumClass: Class): EnumType | undefined {
    let td: string = enumClass.getDescriptor();
    let linker = enumClass.getLinker();
    let type = Type.resolve(td, linker);
    if (type instanceof EnumType) {
      return type;
    }
    return undefined;
  }
}

enum TestEnumDetailed {
  CONST_A = 10,
  CONST_B = 20,
  CONST_C = 30
}

export default function TypePerfTest10(): void {
  describe('TypePerfTest10', () => {
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

    // ==================== ArrayType getElementType 测试 ====================

    it('PerformanceTest_ArrayType_getElementType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrType: ArrayType = ArrayType.BOOLEAN_VAL;
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arrType.getElementType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_getElementType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'getElementType',
        'getElementType(): Type', arkTsAveragedTime);
    });

    // ==================== ArrayType make 测试 ====================

    it('PerformanceTest_ArrayType_make_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrType: ArrayType = ArrayType.INT_VAL;
      let result: Object | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arrType.make(5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_make_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'make',
        'make(length: long): Object', arkTsAveragedTime);
    });

    // ==================== ArrayType BOOLEAN_VAL 静态字段测试 ====================

    it('PerformanceTest_ArrayType_BOOLEAN_VAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: ArrayType | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = ArrayType.BOOLEAN_VAL;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_BOOLEAN_VAL_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'BOOLEAN_VAL',
        'static readonly BOOLEAN_VAL: ArrayType', arkTsAveragedTime);
    });

    // ==================== ArrayType INT_VAL 静态字段测试 ====================

    it('PerformanceTest_ArrayType_INT_VAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: ArrayType | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = ArrayType.INT_VAL;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_INT_VAL_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'INT_VAL',
        'static readonly INT_VAL: ArrayType', arkTsAveragedTime);
    });

    // ==================== EnumType getConstantsNum 测试 ====================

    it('PerformanceTest_EnumType_getConstantsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: long = enumType.getConstantsNum();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getConstantsNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getConstantsNum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getConstantsNum',
        'getConstantsNum(): long', arkTsAveragedTime);
    });

    // ==================== EnumType getConstantByName 测试 ====================

    it('PerformanceTest_EnumType_getConstantByName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: EnumConstant | undefined = undefined;
      result = enumType.getConstantByName("CONST_A");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getConstantByName("CONST_A");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getConstantByName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getConstantByName',
      'getConstantByName(name: string): EnumConstant', arkTsAveragedTime);
    });

    // ==================== EnumType make 测试 ====================

    it('PerformanceTest_EnumType_make_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: Object = new Object();
      try {
        result = enumType.make("CONST_A"); // warmup verify
      } catch (e) {
        return;
      }
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.make("CONST_A");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_make_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'make',
        'make(constantName: string): EnumType', arkTsAveragedTime);
    });

    // ==================== EnumType getName 测试 ====================

    it('PerformanceTest_EnumType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    // ==================== EnumType getLiteral 测试 ====================

    it('PerformanceTest_EnumType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    // ==================== EnumType hasName 测试 ====================

    it('PerformanceTest_EnumType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    // ==================== EnumType isPrimitive 测试 ====================

    it('PerformanceTest_EnumType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    // ==================== EnumType isReference 测试 ====================

    it('PerformanceTest_EnumType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    // ==================== EnumType getClass 测试 ====================

    it('PerformanceTest_EnumType_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getClass',
        'getClass(): Class', arkTsAveragedTime);
    });

    // ==================== EnumType getTypeDesc 测试 ====================

    it('PerformanceTest_EnumType_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<TestEnumDetailed>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      let result: TypeDescriptor | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = enumType.getTypeDesc();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getTypeDesc',
        'getTypeDesc(): TypeDescriptor', arkTsAveragedTime);
    });
  });
}
