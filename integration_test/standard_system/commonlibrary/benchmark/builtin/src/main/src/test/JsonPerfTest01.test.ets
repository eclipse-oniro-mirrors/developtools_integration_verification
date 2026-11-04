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

function createByteValueArray(): ValueArray<byte> {
  return [toByteValue(1), toByteValue(2), toByteValue(3)] as ValueArray<byte>;
}

function createCharValueArray(): ValueArray<char> {
  return [c'a', c'b', c'c'] as ValueArray<char>;
}

function createShortValueArray(): ValueArray<short> {
  return [toShortValue(1), toShortValue(2), toShortValue(3)] as ValueArray<short>;
}

function createIntValueArray(): ValueArray<int> {
  return [1, 2, 3] as ValueArray<int>;
}

function createLongValueArray(): ValueArray<long> {
  return [toLongValue(1), toLongValue(2), toLongValue(3)] as ValueArray<long>;
}

function createFloatValueArray(): ValueArray<float> {
  return [toFloatValue(1.1), toFloatValue(2.2), toFloatValue(3.3)] as ValueArray<float>;
}

function createDoubleValueArray(): ValueArray<double> {
  return [1.1, 2.2, 3.3] as ValueArray<double>;
}

function createBooleanValueArray(): ValueArray<boolean> {
  return [true, false, true] as ValueArray<boolean>;
}

class SampleJsonReplacer implements JsonReplacer {
  public jsonReplacer(): Record<String, Any> {
    let record = new Record<String, Any>();
    record.set("name", "arkts");
    record.set("version", 1);
    return record;
  }
}

class SampleJsonSerializable implements JsonSerializable {
  public toJSON(): string {
    return "{\"name\":\"arkts\",\"version\":1}";
  }
}




export default function JsonPerfTest01(): void {

  describe('JsonPerfTest01', () => {
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 1000;
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

    // ===== stringify(ValueArray<T>) — 补充 FixedArray 对应的 8 个 ValueArray 重载 =====

    it('PerformanceTest_JSON_stringify_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<byte> = createByteValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<byte>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<char> = createCharValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<char>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<short> = createShortValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<short>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<int> = createIntValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_2900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<int>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<long> = createLongValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_3000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<long>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<float> = createFloatValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_3100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<float>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<double> = createDoubleValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_3200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<double>): String', arkTsAveragedTime);
      });

    it('PerformanceTest_JSON_stringify_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let d: ValueArray<boolean> = createBooleanValueArray();
        let result: String = JSON.stringify(d);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_3300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(ValueArray<boolean>): String', arkTsAveragedTime);
      });

    // ===== JsonReplacer.jsonReplacer() =====

    it('PerformanceTest_JsonReplacer_jsonReplacer_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let replacer: JsonReplacer = new SampleJsonReplacer();
        let result: Record<String, Any> = replacer.jsonReplacer();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = replacer.jsonReplacer();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonReplacer_jsonReplacer_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JsonReplacer', 'jsonReplacer',
          'jsonReplacer(): Record<String, Any>', arkTsAveragedTime);
      });

    // ===== JsonSerializable.toJSON() =====

    it('PerformanceTest_JsonSerializable_toJSON_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let obj: JsonSerializable = new SampleJsonSerializable();
        let result: string = obj.toJSON();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = obj.toJSON();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonSerializable_toJSON_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JsonSerializable', 'toJSON',
          'toJSON(): string', arkTsAveragedTime);
      });

    // ===== JsonParseError.super(msg_at_offset) =====

    it('PerformanceTest_JsonParseError_message_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let err: JsonParseError = new JsonParseError("test error", 5, 10);
        let result: string = err.message;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = err.message;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonParseError_message_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JsonParseError', 'super',
          'super(msg_at_offset)', arkTsAveragedTime);
      });



  });
}
