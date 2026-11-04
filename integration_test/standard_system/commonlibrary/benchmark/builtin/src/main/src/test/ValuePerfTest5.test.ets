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

function createStringObject(): String {
  return new String("arkts");
}

function createStringPrimitive(): string {
  return "arkts";
}

function createBooleanArray(): FixedArray<boolean> {
  return [true, false, true] as FixedArray<boolean>;
}

function createByteArray(): FixedArray<byte> {
  return [toByteValue(1), toByteValue(2), toByteValue(3)] as FixedArray<byte>;
}

function createCharArray(): FixedArray<char> {
  return [c'a', c'b', c'c'] as FixedArray<char>;
}

function createShortArray(): FixedArray<short> {
  return [toShortValue(1), toShortValue(2), toShortValue(3)] as FixedArray<short>;
}

function createIntArray(): FixedArray<int> {
  return [1, 2, 3] as FixedArray<int>;
}

function createLongArray(): FixedArray<long> {
  return [toLongValue(1), toLongValue(2), toLongValue(3)] as FixedArray<long>;
}

function createFloatArray(): FixedArray<float> {
  return [toFloatValue(1.1), toFloatValue(2.2), toFloatValue(3.3)] as FixedArray<float>;
}

function createDoubleArray(): FixedArray<double> {
  return [1.1, 2.2, 3.3] as FixedArray<double>;
}

class ValuePerfSample {
  public value: int = 7;

  public constructor() {
    this.value = 7;
  }
}

function createSampleObject(): ValuePerfSample {
  return new ValuePerfSample();
}

function createSampleClassType(): ClassType {
  let cls = Class.of(createSampleObject());
  return Type.resolve(cls.getDescriptor(), cls.getLinker()) as ClassType;
}

function createClassValue(): ClassValue {
  return new ClassValue(createSampleClassType(), createSampleObject());
}

function createArrayValue(): ArrayValue {
  return new ArrayValue(ArrayType.INT_VAL, createIntArray());
}

function createLambdaRaw(): Any {
  return (): int => {
    return 1;
  };
}

function createLambdaTypeValue(): LambdaType {
  let fn: Any = createLambdaRaw();
  let t: Any = Type.of(fn);
  return t as LambdaType;
}

function createLambdaObject(): Object {
  let fn: Any = createLambdaRaw();
  return fn as Object;
}

function createLambdaValue(): LambdaValue {
  return new LambdaValue(createLambdaTypeValue(), createLambdaObject());
}

function createBooleanValue(): BooleanValue {
  return new BooleanValue(BooleanType.VAL, true);
}

function createByteValue(): ByteValue {
  return new ByteValue(ByteType.VAL, toByteValue(7));
}

function createShortValueObj(): ShortValue {
  return new ShortValue(ShortType.VAL, toShortValue(7));
}

function createCharValueObj(): CharValue {
  return new CharValue(CharType.VAL, c'a');
}

function createIntValueObj(): IntValue {
  return new IntValue(IntType.VAL, 7);
}

function createFloatValueObj(): FloatValue {
  return new FloatValue(FloatType.VAL, toFloatValue(3.14));
}

function createDoubleValueObj(): DoubleValue {
  return new DoubleValue(DoubleType.VAL, 3.14);
}

function createLongValueObj(): LongValue {
  return new LongValue(LongType.VAL, toLongValue(7));
}

function createStringValue(): StringValue {
  return new StringValue(StringType.REF, createStringObject());
}

function createBaseValue(): reflect.Value {
  return reflect.Value.of(7);
}

export default function ValuePerfTest5(): void {
  describe('ValuePerfTest5', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 1000;
    const HEAVY_COUNT = 1000;
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
     * StringValue
     */

    it('PerformanceTest_StringValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let data: String = createStringObject();
        let result: StringValue = new StringValue(StringType.REF, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringValue(StringType.REF, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StringValue',
          'constructor',
          'constructor(typ: StringType, data: String)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StringValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: StringValue = createStringValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StringValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StringValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: StringValue = createStringValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StringValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StringValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: StringValue = createStringValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StringValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StringValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: StringValue = createStringValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StringValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StringValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * NullValue
     */

    it('PerformanceTest_NullValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: NullValue = new NullValue();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new NullValue();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'NullValue',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_NullValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: NullValue = NullValue.INSTANCE;
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'NullValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_NullValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: NullValue = NullValue.INSTANCE;
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'NullValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_NullValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: NullValue = NullValue.INSTANCE;
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'NullValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_NullValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: NullValue = NullValue.INSTANCE;
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_NullValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'NullValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * UndefinedValue
     */

    it('PerformanceTest_UndefinedValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: UndefinedValue = new UndefinedValue();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new UndefinedValue();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'UndefinedValue',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_UndefinedValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: UndefinedValue = UndefinedValue.INSTANCE;
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'UndefinedValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_UndefinedValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: UndefinedValue = UndefinedValue.INSTANCE;
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'UndefinedValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_UndefinedValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: UndefinedValue = UndefinedValue.INSTANCE;
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'UndefinedValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_UndefinedValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: UndefinedValue = UndefinedValue.INSTANCE;
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UndefinedValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'UndefinedValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * VoidValue
     */

    it('PerformanceTest_VoidValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: VoidValue = new VoidValue();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new VoidValue();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'VoidValue',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_VoidValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: VoidValue = VoidValue.INSTANCE;
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'VoidValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_VoidValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: VoidValue = VoidValue.INSTANCE;
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'VoidValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_VoidValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: VoidValue = VoidValue.INSTANCE;
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'VoidValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_VoidValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: VoidValue = VoidValue.INSTANCE;
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_VoidValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'VoidValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });
  });
}