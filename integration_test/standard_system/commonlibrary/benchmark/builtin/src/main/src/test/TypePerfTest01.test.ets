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

function toByteValue(value: int): byte {
  return value.toByte();
}

function toShortValue(value: int): short {
  return value.toShort();
}

function toLongValue(value: int): long {
  return value.toLong();
}

function toFloatValue(value: double): float {
  return value.toFloat();
}

function toDoubleValue(value: float): double {
  return value.toDouble();
}

// ==================== 辅助类和接口 ====================

class SampleEnumClass {
  public static readonly VALUE_A: SampleEnumClass = new SampleEnumClass("A", 1);
  public static readonly VALUE_B: SampleEnumClass = new SampleEnumClass("B", 2);
  public static readonly VALUE_C: SampleEnumClass = new SampleEnumClass("C", 3);

  private name_: string;
  private value_: int;

  private constructor(name: string, value: int) {
    this.name_ = name;
    this.value_ = value;
  }

  public getName(): string {
    return this.name_;
  }

  public getValue(): int {
    return this.value_;
  }
}

interface ISampleInterface {
  interfaceMethod(): int;
}

class SampleInterfaceImpl implements ISampleInterface {
  public interfaceMethod(): int {
    return 100;
  }
}

function getSampleInterfaceType(): InterfaceType | undefined {
  let cls = Class.from<ISampleInterface>();
  if (cls === undefined) {
    return undefined;
  }
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  return Type.resolve(td, linker) as InterfaceType;
}

function createSampleInterfaceImplType(): ClassType {
  let cls = Class.from<SampleInterfaceImpl>();
  let td: string = cls.getDescriptor();
  let linker = cls.getLinker();
  return Type.resolve(td, linker) as ClassType;
}

export default function TypePerfTest01(): void {
  describe('TypePerfTest01', () => {
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

    // ==================== NullType 补充测试 ====================

    it('PerformanceTest_NullType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: NullType = NullType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_NullType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: NullType = NullType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_NullType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: NullType = NullType.REF;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_NullType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: NullType = NullType.REF;
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'NullType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    // ==================== UndefinedType 补充测试 ====================

    it('PerformanceTest_UndefinedType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UndefinedType = UndefinedType.REF;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UndefinedType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UndefinedType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UndefinedType = UndefinedType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UndefinedType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_UndefinedType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UndefinedType = UndefinedType.REF;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UndefinedType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_UndefinedType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UndefinedType = UndefinedType.REF;
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UndefinedType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    // ==================== VoidType 补充测试 ====================

    it('PerformanceTest_VoidType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: VoidType = VoidType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'VoidType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_VoidType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: VoidType = VoidType.VAL;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'VoidType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_VoidType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: VoidType = VoidType.VAL;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'VoidType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_VoidType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: VoidType = VoidType.VAL;
      let other: Type = VoidType.VAL;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'VoidType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== BooleanType 补充测试 ====================

    it('PerformanceTest_BooleanType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: BooleanType = BooleanType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BooleanType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_BooleanType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: BooleanType = BooleanType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BooleanType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_BooleanType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: BooleanType = BooleanType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BooleanType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_BooleanType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: BooleanType = BooleanType.VAL;
      let other: Type = BooleanType.VAL;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BooleanType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== ByteType 补充测试 ====================

    it('PerformanceTest_ByteType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ByteType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ByteType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ByteType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.REF;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ByteType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.VAL;
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ByteType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ByteType = ByteType.VAL;
      let other: Type = ByteType.VAL;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ByteType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== CharType 补充测试 ====================

    it('PerformanceTest_CharType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: CharType = CharType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CharType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_CharType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: CharType = CharType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CharType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_CharType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: CharType = CharType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CharType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_CharType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: CharType = CharType.VAL;
      let other: Type = CharType.VAL;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'CharType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== ShortType 补充测试 ====================

    it('PerformanceTest_ShortType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.VAL;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ShortType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ShortType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ShortType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.REF;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ShortType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.VAL;
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ShortType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ShortType = ShortType.VAL;
      let other: Type = ShortType.VAL;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ShortType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== StringType 补充测试 ====================

    it('PerformanceTest_StringType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: StringType = StringType.REF;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_StringType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: StringType = StringType.REF;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_StringType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: StringType = StringType.REF;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_StringType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: StringType = StringType.REF;
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_StringType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: StringType = StringType.REF;
      let other: Type = StringType.REF;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'StringType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== ArrayType 补充测试 ====================

    it('PerformanceTest_ArrayType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ArrayType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ArrayType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ArrayType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let result: string = value.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ArrayType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let other: ArrayType = ArrayType.getInstance(Class.of([1, 2, 3] as FixedArray<int>));
      let result: boolean = value.assignableFrom(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.assignableFrom(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ArrayType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== ClassType 补充测试 ====================

    it('PerformanceTest_ClassType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let result: boolean = value.isPrimitive();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ClassType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let result: boolean = value.isReference();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ClassType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let result: boolean = value.hasName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ClassType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_ClassType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let other: Type = Type.resolve(td, linker) as ClassType;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ClassType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<SampleInterfaceImpl>();
      let td: string = cls.getDescriptor();
      let linker = cls.getLinker();
      let value: ClassType = Type.resolve(td, linker) as ClassType;
      let other: Type = Type.of(new SampleInterfaceImpl());
      let result: boolean = value.assignableFrom(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.assignableFrom(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ClassType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType 测试 ====================

    it('PerformanceTest_InterfaceType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
        return;
      }
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
        return;
      }
      let other: Type = value;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_InterfaceType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: InterfaceType | undefined = getSampleInterfaceType();
      if (value === undefined) {
        return;
      }
      let clsType: ClassType = createSampleInterfaceImplType();
      let result: boolean = value.assignableFrom(clsType);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.assignableFrom(clsType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== EnumType 测试 ====================

    it('PerformanceTest_EnumType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
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
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
        return;
      }
      let result: string = value.getLiteral();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
        return;
      }
      let other: Type = value;
      let result: boolean = value.equals(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.equals(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_EnumType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let td: TypeDescriptor = "std.core.GC$Cause";
      let value: Type | undefined = Type.resolve(td);
      if (value === undefined || !(value instanceof EnumType)) {
        return;
      }
      let other: Type = value;
      let result: boolean = value.assignableFrom(other);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = value.assignableFrom(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_EnumType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'EnumType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });
  });
}
