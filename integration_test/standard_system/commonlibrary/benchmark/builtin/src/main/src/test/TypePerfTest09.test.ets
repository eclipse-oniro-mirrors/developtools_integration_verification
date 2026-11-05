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

// 使用反射机制动态获取标准库中的类型
function getAttributesType(): ClassType | undefined {
  let td: TypeDescriptor = "std.core.Attributes";
  let type = Type.resolve(td);
  return type as ClassType | undefined;
}

function getAccessModifierType(): ClassType | undefined {
  let td: TypeDescriptor = "std.core.AccessModifier";
  let type = Type.resolve(td);
  return type as ClassType | undefined;
}

function getValueTypeDescType(): ClassType | undefined {
  let td: TypeDescriptor = "std.core.ValueTypeDesc";
  let type = Type.resolve(td);
  return type as ClassType | undefined;
}

// 使用 getTypeDesc() 获取类型描述信息
function getTypeDescription(type: ClassType | undefined): string {
  if (type === undefined) {
    return "";
  }
  let desc = type.getTypeDesc();
  return desc;
}

// 通过反射获取静态字段值
function getStaticFieldValue(type: ClassType | undefined, fieldName: string): Any {
  if (type === undefined) {
    return undefined;
  }
  let field = type.getFieldByName(fieldName);
  if (field !== undefined) {
    return field.getStaticValue();
  }
  return undefined;
}

export default function TypePerfTest09(): void {
  describe('TypePerfTest09', () => {
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

    // ==================== Attributes.READONLY 测试 ====================

    it('PerformanceTest_Attributes_READONLY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'READONLY') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_READONLY_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'READONLY',
        'static readonly READONLY: int', arkTsAveragedTime);
    });

    // ==================== Attributes.ABSTRACT 测试 ====================

    it('PerformanceTest_Attributes_ABSTRACT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'ABSTRACT') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_ABSTRACT_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'ABSTRACT',
        'static readonly ABSTRACT: int', arkTsAveragedTime);
    });

    // ==================== Attributes.CONSTRUCTOR 测试 ====================

    it('PerformanceTest_Attributes_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'CONSTRUCTOR') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_CONSTRUCTOR_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'CONSTRUCTOR',
        'static readonly CONSTRUCTOR: int', arkTsAveragedTime);
    });

    // ==================== Attributes.REST 测试 ====================

    it('PerformanceTest_Attributes_REST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'REST') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_REST_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'REST',
        'static readonly REST: int', arkTsAveragedTime);
    });

    // ==================== Attributes.OPTIONAL 测试 ====================

    it('PerformanceTest_Attributes_OPTIONAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'OPTIONAL') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_OPTIONAL_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'OPTIONAL',
        'static readonly OPTIONAL: int', arkTsAveragedTime);
    });

    // ==================== Attributes.NATIVE 测试 ====================

    it('PerformanceTest_Attributes_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'NATIVE') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_NATIVE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'NATIVE',
        'static readonly NATIVE: int', arkTsAveragedTime);
    });

    // ==================== Attributes.ASYNC 测试 ====================

    it('PerformanceTest_Attributes_ASYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'ASYNC') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_ASYNC_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'ASYNC',
        'static readonly ASYNC: int', arkTsAveragedTime);
    });

    // ==================== Attributes.GETTER 测试 ====================

    it('PerformanceTest_Attributes_GETTER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'GETTER') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_GETTER_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'GETTER',
        'static readonly GETTER: int', arkTsAveragedTime);
    });

    // ==================== Attributes.SETTER 测试 ====================

    it('PerformanceTest_Attributes_SETTER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(attrsType, 'SETTER') as int;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_SETTER_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'SETTER',
        'static readonly SETTER: int', arkTsAveragedTime);
    });

    // ==================== AccessModifier.PRIVATE 测试 ====================

    it('PerformanceTest_AccessModifier_PRIVATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let accessType = getAccessModifierType();
      let result: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(accessType, 'PRIVATE') as byte;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AccessModifier_PRIVATE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AccessModifier', 'PRIVATE',
        'static readonly PRIVATE: byte', arkTsAveragedTime);
    });

    // ==================== AccessModifier.PROTECTED 测试 ====================

    it('PerformanceTest_AccessModifier_PROTECTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let accessType = getAccessModifierType();
      let result: byte = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(accessType, 'PROTECTED') as byte;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AccessModifier_PROTECTED_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AccessModifier', 'PROTECTED',
        'static readonly PROTECTED: byte', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.VOID 测试 ====================

    it('PerformanceTest_ValueTypeDesc_VOID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'VOID') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_VOID_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'VOID',
        'static readonly VOID: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.BOOLEAN 测试 ====================

    it('PerformanceTest_ValueTypeDesc_BOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'BOOLEAN') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_BOOLEAN_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'BOOLEAN',
        'static readonly BOOLEAN: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.BYTE 测试 ====================

    it('PerformanceTest_ValueTypeDesc_BYTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'BYTE') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_BYTE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'BYTE',
        'static readonly BYTE: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.SHORT 测试 ====================

    it('PerformanceTest_ValueTypeDesc_SHORT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'SHORT') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_SHORT_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'SHORT',
        'static readonly SHORT: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.CHAR 测试 ====================

    it('PerformanceTest_ValueTypeDesc_CHAR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'CHAR') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_CHAR_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'CHAR',
        'static readonly CHAR: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.LONG 测试 ====================

    it('PerformanceTest_ValueTypeDesc_LONG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'LONG') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_LONG_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'LONG',
        'static readonly LONG: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.FLOAT 测试 ====================

    it('PerformanceTest_ValueTypeDesc_FLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'FLOAT') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_FLOAT_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'FLOAT',
        'static readonly FLOAT: string', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.DOUBLE 测试 ====================

    it('PerformanceTest_ValueTypeDesc_DOUBLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getStaticFieldValue(vtdType, 'DOUBLE') as string;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_DOUBLE_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'DOUBLE',
        'static readonly DOUBLE: string', arkTsAveragedTime);
    });

    // ==================== Attributes.getTypeDesc() 测试 ====================

    it('PerformanceTest_Attributes_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let attrsType = getAttributesType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(attrsType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Attributes_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Attributes', 'getTypeDesc',
        'getTypeDesc(): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    // ==================== AccessModifier.getTypeDesc() 测试 ====================

    it('PerformanceTest_AccessModifier_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let accessType = getAccessModifierType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(accessType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AccessModifier_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AccessModifier', 'getTypeDesc',
        'getTypeDesc(): RuntimeTypeDescriptor', arkTsAveragedTime);
    });

    // ==================== ValueTypeDesc.getTypeDesc() 测试 ====================

    it('PerformanceTest_ValueTypeDesc_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vtdType = getValueTypeDescType();
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = getTypeDescription(vtdType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ValueTypeDesc_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ValueTypeDesc', 'getTypeDesc',
        'getTypeDesc(): RuntimeTypeDescriptor', arkTsAveragedTime);
    });
  });
}
