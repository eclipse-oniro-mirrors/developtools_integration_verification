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

function createByteFixedArray(): FixedArray<byte> {
  return [toByteValue(1), toByteValue(2), toByteValue(3)] as FixedArray<byte>;
}

function createCharFixedArray(): FixedArray<char> {
  return [c'a', c'b', c'c'] as FixedArray<char>;
}

function createShortFixedArray(): FixedArray<short> {
  return [toShortValue(1), toShortValue(2), toShortValue(3)] as FixedArray<short>;
}

function createIntFixedArray(): FixedArray<int> {
  return [1, 2, 3] as FixedArray<int>;
}

function createLongFixedArray(): FixedArray<long> {
  return [toLongValue(1), toLongValue(2), toLongValue(3)] as FixedArray<long>;
}

function createFloatFixedArray(): FixedArray<float> {
  return [toFloatValue(1.1), toFloatValue(2.2), toFloatValue(3.3)] as FixedArray<float>;
}

function createDoubleFixedArray(): FixedArray<double> {
  return [1.1, 2.2, 3.3] as FixedArray<double>;
}

function createBooleanFixedArray(): FixedArray<boolean> {
  return [true, false, true] as FixedArray<boolean>;
}

function createNumberArray(): Array<Number> {
  let arr = Array<Number>();
  arr.push(1);
  arr.push(2);
  arr.push(3);
  return arr;
}

function createNumberArrayLike(): ArrayLike<Number> {
  return createNumberArray() as ArrayLike<Number>;
}

function createSimpleRecord(): Record<String, Any> {
  let record = new Record<String, Any>();
  record.set("name", "arkts");
  record.set("version", 1);
  return record;
}

function createJsonElementObject(): jsonx.JsonElement {
  let elem = new jsonx.JsonElement();
  elem.setElement("name", jsonx.JsonElement.createString("arkts"));
  elem.setElement("version", jsonx.JsonElement.createInteger(1));
  return elem;
}

function createStringifyFilterFixedArray(): FixedArray<double | string> {
  return ["name", "version"] as FixedArray<double | string>;
}

function createStringifyFilterArray(): Array<double | string> {
  let arr = Array<double | string>();
  arr.push("name");
  arr.push("version");
  return arr;
}

function createParseOptions(): jsonx.ParseOptions {
  return { bigIntMode: jsonx.BigIntMode.DEFAULT };
}

function commonReviver(key: string, value: Any): Any {
  return value;
}

function jsonElementReviver(key: string, value: jsonx.JsonElement): jsonx.JsonElement {
  return value;
}

class SampleJsonReplacer implements JsonReplacer {
  public jsonReplacer(): Record<String, Any> {
    return createSimpleRecord();
  }
}

class SampleJsonSerializable implements JsonSerializable {
  public toJSON(): string {
    return "{\"name\":\"arkts\",\"version\":1}";
  }
}

class SampleJsonElementSerializable implements jsonx.JsonElementSerializable {
  public toJSON(): jsonx.JsonElement {
    return createJsonElementObject();
  }
}

class SampleParsePojo {
  public name: String = "";
  public age: int = 0;

  public constructor() {
  }
}

function getSampleParseClass(): Class {
  return Class.from<SampleParsePojo>();
}

export default function JsonPerfTest(): void {
  describe('JsonPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
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

   it('PerformanceTest_JsonParseError_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let msg: string = "json parse error";
        let result: JsonParseError = new JsonParseError(msg, 0, 1);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new JsonParseError(msg, 0, 1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonParseError_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JsonParseError', 'constructor',
          'constructor(string, int, int)', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: byte = toByteValue(7);
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(byte): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: char = c'a';
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(char): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: short = toShortValue(7);
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(short): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: int = 7;
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(int): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: long = toLongValue(7);
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(long): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: float = toFloatValue(3.14);
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(float): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: double = 3.14;
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(double): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: bigint = 123n;
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(bigint): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: boolean = true;
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(boolean): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: String = "arkts";
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(String): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<byte> = createByteFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<byte>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<char> = createCharFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<char>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<short> = createShortFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<short>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<int> = createIntFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<int>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<long> = createLongFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<long>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<float> = createFloatFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<float>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<double> = createDoubleFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<double>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: FixedArray<boolean> = createBooleanFixedArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(FixedArray<boolean>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: Array<Number> = createNumberArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(Array<Number>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ArrayLike<Number> = createNumberArrayLike();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ArrayLike<Number>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: JsonReplacer = new SampleJsonReplacer();
        let result: String = JSON.stringify(obj);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(JsonReplacer): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let result: String = JSON.stringify(obj);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(Any): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let result: string = JSON.stringify(obj, commonReviver, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, commonReviver, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(obj: Any, replacer: ((key: string, value: Any) => Any) | undefined | null, space?: string | int): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let replacer: FixedArray<double | string> = createStringifyFilterFixedArray();
        let result: string = JSON.stringify(obj, replacer, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, replacer, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(Any, FixedArray<double | string>, int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let replacer: Array<double | string> = createStringifyFilterArray();
        let result: string = JSON.stringify(obj, replacer, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, replacer, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(obj: Any, replacer: Array<double | string> | Array<string> | Array<double>, space?: int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyJsonElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let elem: jsonx.JsonElementSerializable = new SampleJsonElementSerializable();
        let result: string = JSON.stringifyJsonElement(elem);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyJsonElement(elem);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyJsonElement_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyJsonElement',
          'stringifyJsonElement(jsonx.JsonElementSerializable): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyJsonElement_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let elem: jsonx.JsonElementSerializable = new SampleJsonElementSerializable();
        let replacer: Array<double | string> = createStringifyFilterArray();
        let result: string = JSON.stringifyJsonElement(elem, replacer, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyJsonElement(elem, replacer, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyJsonElement_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyJsonElement',
          'stringifyJsonElement(elem: jsonx.JsonElementSerializable, replacer?: (double | string)[], space?: int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyJsonElement_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let elem: jsonx.JsonElement = createJsonElementObject();
        let result: string = JSON.stringifyJsonElement(elem);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyJsonElement(elem);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyJsonElement_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyJsonElement',
          'stringifyJsonElement(jsonx.JsonElement): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyJsonElement_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let elem: jsonx.JsonElement = createJsonElementObject();
        let replacer: Array<double | string> = createStringifyFilterArray();
        let result: string = JSON.stringifyJsonElement(elem, replacer, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyJsonElement(elem, replacer, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyJsonElement_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyJsonElement',
          'stringifyJsonElement(elem: jsonx.JsonElement, replacer?: (double | string)[], space?: int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parse_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let json: string = "{\"name\":\"arkts\",\"age\":1}";
        let type: Class = getSampleParseClass();
        let result: SampleParsePojo | null | undefined = JSON.parse<SampleParsePojo>(json, type);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parse<SampleParsePojo>(json, type);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse<T>(json: string, type: Class): T | null | undefined', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parse_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let json: string = "{\"name\":\"arkts\",\"age\":1}";
        let type: Class = getSampleParseClass();
        let options: jsonx.ParseOptions = createParseOptions();
        let result: SampleParsePojo | null | undefined = JSON.parse<SampleParsePojo>(json, commonReviver, type, options);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parse<SampleParsePojo>(json, commonReviver, type, options);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse<T>(json: string, reviver: ((key: string, value: Any) => Any) | undefined, type: Class, options?: jsonx.ParseOptions): T | null | undefined', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parseJsonElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let options: jsonx.ParseOptions = createParseOptions();
        let result: jsonx.JsonElement = JSON.parseJsonElement(text, options);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parseJsonElement(text, options);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonElement_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parseJsonElement',
          'parseJsonElement(string, jsonx.ParseOptions): jsonx.JsonElement', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parseJsonElement_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let options: jsonx.ParseOptions = createParseOptions();
        let result: jsonx.JsonElement = JSON.parseJsonElement(text, jsonElementReviver, options);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parseJsonElement(text, jsonElementReviver, options);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonElement_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parseJsonElement',
          'parseJsonElement(string, (string, jsonx.JsonElement) => jsonx.JsonElement, jsonx.ParseOptions): jsonx.JsonElement', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parseJsonRecord_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let options: jsonx.ParseOptions = createParseOptions();
        let result: Record<string, JsonRecordType> = JSON.parseJsonRecord(text, options);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parseJsonRecord(text, options);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonRecord_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parseJsonRecord',
          'parseJsonRecord(string, jsonx.ParseOptions): Record<string, JsonRecordType>', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyWithGetters_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let result: String = JSON.stringifyWithGetters(obj);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyWithGetters(obj);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyWithGetters_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyWithGetters',
          'stringifyWithGetters(Any): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyWithGetters_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let result: string = JSON.stringifyWithGetters(obj, commonReviver, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyWithGetters(obj, commonReviver, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyWithGetters_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyWithGetters',
          'stringifyWithGetters(obj: Any, replacer: ((key: string, value: Any) => Any) | undefined | null, space?: int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringifyWithGetters_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: Any = createSimpleRecord();
        let replacer: Array<double | string> = createStringifyFilterArray();
        let result: string = JSON.stringifyWithGetters(obj, replacer, 2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringifyWithGetters(obj, replacer, 2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringifyWithGetters_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringifyWithGetters',
          'stringifyWithGetters(obj: Any, replacer: Array<double | string> | Array<string> | Array<double>, space?: int | string): string', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parseUpdate_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let json: string = "{\"name\":\"test\",\"age\":25}";
        let instance: SampleParsePojo = new SampleParsePojo();
        let result: SampleParsePojo = JSON.parseUpdate(json, instance);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parseUpdate(json, instance);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseUpdate_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parseUpdate',
          'parseUpdate<T>(json: string, instance: T): T', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_parseUpdate_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let json: string = "{\"name\":\"test\",\"age\":25}";
        let instance: SampleParsePojo = new SampleParsePojo();
        let options: jsonx.ParseOptions = createParseOptions();
        let result: SampleParsePojo = JSON.parseUpdate(json, commonReviver, instance, options);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.parseUpdate(json, commonReviver, instance, options);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseUpdate_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parseUpdate',
          'parseUpdate<T>(json: string, reviver: ((key: string, value: Any) => Any) | undefined, instance: T, options?: jsonx.ParseOptions): T', arkTsAveragedTime);
      });
  });
}