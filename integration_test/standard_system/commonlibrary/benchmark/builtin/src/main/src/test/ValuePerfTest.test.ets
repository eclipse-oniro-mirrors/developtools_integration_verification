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

export default function ValuePerfTest(): void {
  describe('ValuePerfTest', () => {
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

    it('PerformanceTest_Value_of_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: reflect.Value = reflect.Value.of(true);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(true);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: boolean): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: byte = toByteValue(7);
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: byte): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: char = c'a';
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: char): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: short = toShortValue(7);
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: short): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: reflect.Value = reflect.Value.of(7);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(7);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: int): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: long = toLongValue(7);
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: long): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: float = toFloatValue(3.14);
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: float): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: reflect.Value = reflect.Value.of(3.14);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(3.14);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: double): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<boolean> = createBooleanArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<boolean>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<byte> = createByteArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<byte>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<char> = createCharArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<char>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<short> = createShortArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<short>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<int> = createIntArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<int>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<long> = createLongArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<long>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<float> = createFloatArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<float>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: FixedArray<double> = createDoubleArray();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(v: FixedArray<double>): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_of_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: Any = createSampleObject();
        let result: reflect.Value = reflect.Value.of(value);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = reflect.Value.of(value);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_of_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'of',
          'static of(o: Any): Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: reflect.Value = createBaseValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: reflect.Value = createBaseValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Value_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: reflect.Value = createBaseValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Value_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Value',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });
  });
}