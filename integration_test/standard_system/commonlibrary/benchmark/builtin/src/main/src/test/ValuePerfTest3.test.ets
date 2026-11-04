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

export default function ValuePerfTest3(): void {
  describe('ValuePerfTest3', () => {
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
     * BooleanValue
     */

    it('PerformanceTest_BooleanValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: BooleanValue = new BooleanValue(BooleanType.VAL, true);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new BooleanValue(BooleanType.VAL, true);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'constructor',
          'constructor(typ: BooleanType, data: boolean)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_BooleanValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: BooleanValue = createBooleanValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_BooleanValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: BooleanValue = createBooleanValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_BooleanValue_getValueData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: BooleanValue = createBooleanValue();
        let result: boolean = value.getValueData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_getValueData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'getValueData',
          'getValueData(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_BooleanValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: BooleanValue = createBooleanValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_BooleanValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: BooleanValue = createBooleanValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_BooleanValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'BooleanValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * ByteValue
     */

    it('PerformanceTest_ByteValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let data: byte = toByteValue(7);
        let result: ByteValue = new ByteValue(ByteType.VAL, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new ByteValue(ByteType.VAL, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'constructor',
          'constructor(typ: ByteType, data: byte)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ByteValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ByteValue = createByteValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ByteValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ByteValue = createByteValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ByteValue_getValueData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ByteValue = createByteValue();
        let result: byte = value.getValueData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_getValueData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'getValueData',
          'getValueData(): byte',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ByteValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ByteValue = createByteValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ByteValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ByteValue = createByteValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ByteValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ByteValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * ShortValue
     */

    it('PerformanceTest_ShortValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let data: short = toShortValue(7);
        let result: ShortValue = new ShortValue(ShortType.VAL, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new ShortValue(ShortType.VAL, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'constructor',
          'constructor(typ: ShortType, data: short)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ShortValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ShortValue = createShortValueObj();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ShortValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ShortValue = createShortValueObj();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ShortValue_getValueData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ShortValue = createShortValueObj();
        let result: short = value.getValueData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_getValueData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'getValueData',
          'getValueData(): short',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ShortValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ShortValue = createShortValueObj();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ShortValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ShortValue = createShortValueObj();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ShortValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ShortValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * CharValue
     */

    it('PerformanceTest_CharValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: CharValue = new CharValue(CharType.VAL, c'a');
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new CharValue(CharType.VAL, c'a');
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'constructor',
          'constructor(typ: CharType, data: char)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_CharValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: CharValue = createCharValueObj();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_CharValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: CharValue = createCharValueObj();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_CharValue_getValueData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: CharValue = createCharValueObj();
        let result: char = value.getValueData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_getValueData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'getValueData',
          'getValueData(): char',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_CharValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: CharValue = createCharValueObj();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_CharValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: CharValue = createCharValueObj();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_CharValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'CharValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });
  });
}