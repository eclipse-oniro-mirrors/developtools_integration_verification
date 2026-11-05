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

export default function ValuePerfTest2(): void {
  describe('ValuePerfTest2', () => {
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
     * ClassValue
     */

    it('PerformanceTest_ClassValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let typ: ClassType = createSampleClassType();
        let data: Object = createSampleObject();
        let result: ClassValue = new ClassValue(typ, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new ClassValue(typ, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'constructor',
          'constructor(typ: ClassType, data: Object)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_getFieldsNum_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: long = value.getFieldsNum();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getFieldsNum();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_getFieldsNum_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'getFieldsNum',
          'getFieldsNum(): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_getField_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: reflect.Value = value.getField(0);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.getField(0);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_getField_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'getField',
          'getField(i: long): reflect.Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_getFieldByName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: reflect.Value = value.getFieldByName("value");
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.getFieldByName("value");
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_getFieldByName_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'getFieldByName',
          'getFieldByName(name: string): reflect.Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_setFieldByName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let fieldValue: reflect.Value = reflect.Value.of(8 as int);
        value.setFieldByName("value", fieldValue);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          value.setFieldByName("value", fieldValue);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = value;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_setFieldByName_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'setFieldByName',
          'setFieldByName(name: string, val: reflect.Value): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_setField_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let fieldValue: reflect.Value = reflect.Value.of(8 as int);
        value.setField(0, fieldValue);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          value.setField(0, fieldValue);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = value;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_setField_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'setField',
          'setField(i: long, val: reflect.Value): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ClassValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ClassValue = createClassValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ClassValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ClassValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    /*
     * ArrayValue
     */

    it('PerformanceTest_ArrayValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let data: Object = createIntArray();
        let result: ArrayValue = new ArrayValue(ArrayType.INT_VAL, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new ArrayValue(ArrayType.INT_VAL, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'constructor',
          'constructor(typ: ArrayType, data: Object)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_getLength_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: long = value.getLength();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getLength();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_getLength_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'getLength',
          'getLength(): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_getElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: reflect.Value = value.getElement(0);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.getElement(0);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_getElement_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'getElement',
          'getElement(i: long): reflect.Value',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_setElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let elementValue: reflect.Value = reflect.Value.of(8 as int);
        value.setElement(0, elementValue);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          value.setElement(0, elementValue);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = value;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_setElement_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'setElement',
          'setElement(i: long, val: reflect.Value): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ArrayValue_toLocaleString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: ArrayValue = createArrayValue();
        let result: string = value.toLocaleString(undefined, undefined);
        let sTime = new Date().getTime();
        for (let i = 0; i < HEAVY_COUNT; i++) {
          result = value.toLocaleString(undefined, undefined);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / HEAVY_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ArrayValue_toLocaleString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ArrayValue',
          'toLocaleString',
          'toLocaleString(locales?: Intl.LocalesArgument, options?: object): string',
          arkTsAveragedTime
        );
      });

    /*
     * LambdaValue
     */

    it('PerformanceTest_LambdaValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let typ: LambdaType = createLambdaTypeValue();
        let data: Object = createLambdaObject();
        let result: LambdaValue = new LambdaValue(typ, data);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new LambdaValue(typ, data);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaValue_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LambdaValue',
          'constructor',
          'constructor(typ: LambdaType, data: Object)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_LambdaValue_getType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: LambdaValue = createLambdaValue();
        let result: Type = value.getType();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaValue_getType_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LambdaValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_LambdaValue_getData_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: LambdaValue = createLambdaValue();
        let result: Any = value.getData();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaValue_getData_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LambdaValue',
          'getData',
          'getData(): Any',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_LambdaValue_toPrint_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: LambdaValue = createLambdaValue();
        let result: string = value.toPrint(1);
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaValue_toPrint_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LambdaValue',
          'toPrint',
          'toPrint(depth: int): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_LambdaValue_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: LambdaValue = createLambdaValue();
        let result: string = value.toString();
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaValue_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LambdaValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      });
  });
}