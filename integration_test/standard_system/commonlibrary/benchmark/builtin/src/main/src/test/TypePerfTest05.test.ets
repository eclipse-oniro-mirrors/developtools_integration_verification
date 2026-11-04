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

enum SampleEnum {
  VALUE_A = 1,
  VALUE_B = 2,
  VALUE_C = 3
}

enum SampleEnumString {
  NAME_A = "nameA",
  NAME_B = "nameB"
}

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

export default function TypePerfTest05(): void {
  describe('TypePerfTest05', () => {
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

    // ==================== EnumType getConstantsNum 测试 ====================

    it('PerformanceTest_EnumType_getConstantsNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleEnum>();
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

    // ==================== EnumType make 测试 ====================

    it('PerformanceTest_EnumType_make_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleEnum>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      try {
        let result: Object = enumType.make("VALUE_A");
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = enumType.make("VALUE_A");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_make_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'make',
          'make(constantName: string): Object', arkTsAveragedTime);
      } catch (e) {
        console.info('EnumType make not implemented: ' + e.message);
      }
    });

    // ==================== EnumType getConstantByName 测试 ====================

    it('PerformanceTest_EnumType_getConstantByName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleEnum>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      try {
        let result: EnumConstant = enumType.getConstantByName("VALUE_A");
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = enumType.getConstantByName("VALUE_A");
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getConstantByName_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getConstantByName',
          'getConstantByName(name: string): EnumConstant', arkTsAveragedTime);
      } catch (e) {
        console.info('EnumType getConstantByName not implemented: ' + e.message);
      }
    });

    // ==================== EnumType create 测试 ====================

    it('PerformanceTest_EnumType_create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleEnum>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      try {
        let consts: EnumConstant[] = [];
        let result: EnumType = enumType.create(consts);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = enumType.create(consts);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_create_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'create',
          'create(consts: EnumConstant[]): EnumType', arkTsAveragedTime);
      } catch (e) {
        console.info('EnumType create not implemented: ' + e.message);
      }
    });

    // ==================== EnumType convertObject 测试 ====================

    it('PerformanceTest_EnumType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleEnum>();
      if (cls === undefined) {
        return;
      }
      let enumType: EnumType | undefined = EnumHelper.getEnumType(cls);
      if (enumType === undefined) {
        return;
      }
      try {
        let enumValue: Object = SampleEnum.VALUE_A;
        let result: Any = enumType.convertObject(enumValue);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = enumType.convertObject(enumValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'convertObject',
          'convertObject(obj: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('EnumType convertObject not implemented: ' + e.message);
      }
    });

    /*
    // ==================== UnionType 测试 ====================
    // 注意：Type.of<number | string>() 泛型语法不支持，UnionType API 可能不可用
    // 以下测试用例暂时注释，待后续确认 API 可用性后再启用

    it('PerformanceTest_UnionType_getCaseType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Type.of<number | string>();
      if (!(type instanceof UnionType)) {
        return;
      }
      let result: Type | undefined = type.getCaseType(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = type.getCaseType(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getCaseType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getCaseType',
        'getCaseType(i: long): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let unionType = Type.of<number | string>();
      if (!(unionType instanceof UnionType)) {
        return;
      }
      let numType = Type.of(1);
      let result: boolean = unionType.assignableFrom(numType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = unionType.assignableFrom(numType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UnionType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let unionType = Type.of<number | string>();
      if (!(unionType instanceof UnionType)) {
        return;
      }
      let value: number | string = 42;
      try {
        let result: Any = unionType.convertObject(value);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = unionType.convertObject(value);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'convertObject',
          'convertObject(obj: Any): Any', arkTsAveragedTime);
      } catch (e) {
        console.info('UnionType convertObject error: ' + e.message);
      }
    });

    it('PerformanceTest_UnionType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let unionType1 = Type.of<number | string>();
      let unionType2 = Type.of<number | string>();
      if (!(unionType1 instanceof UnionType) || !(unionType2 instanceof UnionType)) {
        return;
      }
      let result: boolean = unionType1.equals(unionType2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = unionType1.equals(unionType2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });
    */

    // ==================== LongType VAL/REF 测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_LongType_VAL_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: LongType = LongType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongType_VAL_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LongType', 'VAL.isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_LongType_REF_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: LongType = LongType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LongType_REF_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LongType', 'REF.isReference',
        'isReference(): boolean', arkTsAveragedTime);
    }); */

    // ==================== FloatType VAL/REF 测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_FloatType_VAL_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: FloatType = FloatType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FloatType_VAL_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FloatType', 'VAL.isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_FloatType_REF_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: FloatType = FloatType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_FloatType_REF_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'FloatType', 'REF.isReference',
        'isReference(): boolean', arkTsAveragedTime);
    }); */

    // ==================== DoubleType VAL/REF 测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_DoubleType_VAL_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: DoubleType = DoubleType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DoubleType_VAL_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DoubleType', 'VAL.isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_DoubleType_REF_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: DoubleType = DoubleType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_DoubleType_REF_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'DoubleType', 'REF.isReference',
        'isReference(): boolean', arkTsAveragedTime);
    }); */

    // ==================== Type.of() 各种类型重载测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_Type_of_fixedArray_boolean_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: boolean[] = [true, false, true];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_boolean_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<boolean>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_byte_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: byte[] = [1, 2, 3];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_byte_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<byte>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_char_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: char[] = [c'a', c'b', c'c'];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_char_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<char>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_short_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: short[] = [1, 2, 3];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_short_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<short>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: long[] = [1, 2, 3];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_long_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<long>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_float_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: float[] = [1.0, 2.0, 3.0];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_float_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<float>): Type', arkTsAveragedTime);
    });

    it('PerformanceTest_Type_of_fixedArray_double_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: double[] = [1.0, 2.0, 3.0];
      let result: Type = Type.of(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.of(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_of_fixedArray_double_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'of',
        'of(v: FixedArray<double>): Type', arkTsAveragedTime);
    }); */

    // ==================== Type.toRefType 测试 ====================
    // 以下用例与 TypePerfTest.test.ets 重复，注释排除

    /* it('PerformanceTest_Type_toRefType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let primType: Type = IntType.VAL;
      let result: Type = Type.toRefType(primType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = Type.toRefType(primType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Type_toRefType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Type', 'toRefType',
        'toRefType(primitiveType: Type): Type', arkTsAveragedTime);
    }); */
  });
}
