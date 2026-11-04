/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { JSON } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

const SAMPLE_OBJECT_JSON: string = '{"name":"arkts","version":1,"enabled":true}';
const SAMPLE_ARRAY_JSON: string = '["arkts",1,true]';
const SAMPLE_BIGINT_JSON: string = '{"largeNumber":112233445566778899}';
const SAMPLE_FULL_OBJECT_JSON: string =
  '{"array":["arkts",1],"double":3.14,"integer":123,"long":123,"bigint":112233445566778899,"string":"arkts","boolean":true,"null":null}';

function toLongValue(value: number): number {
  return value;
}

function createSampleArrayValues(): Object[] {
  let arr: Object[] = [];
  arr.push("arkts");
  arr.push(1);
  return arr;
}

function createSampleArrayElement(): Object[] {
  return createSampleArrayValues();
}

function createSampleObjectMap(): Record<string, Object> {
  let longValue: number = toLongValue(123);
  let bigIntValue: bigint = 123n;

  return {
    "array": createSampleArrayElement(),
    "double": 3.14,
    "integer": 123,
    "long": longValue,
    "bigint": bigIntValue,
    "string": "arkts",
    "boolean": true
  };
}

function createSampleObjectElement(): Record<string, Object> {
  return createSampleObjectMap();
}

function createSampleRecord(): Record<string, Object> {
  return {
    "name": "arkts",
    "version": 1
  };
}

function createRemovableElement(value: Object): Record<string, Object> {
  let elem: Record<string, Object> = {};
  elem["temp"] = value;
  return elem;
}

class SerializableClass {
  name: string = "arkts";
  version: number = 1;

  toJSON(): Record<string, Object> {
    return {
      "name": this.name,
      "version": this.version
    };
  }
}

class DeserializableClass {
  name: string = "";
  version: number = 0;

  fromJSON(jsonObj: Record<string, Object>): void {
    let nameValue: Object | undefined = jsonObj["name"];
    this.name = nameValue != null ? nameValue as string : "";
    let versionValue: Object | undefined = jsonObj["version"];
    this.version = versionValue != null ? versionValue as number : 0;
  }
}

export default function JsonxPerfTest(): void {
  describe('JsonxPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_JSON_parse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Record<string, Object> | null = null;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(SAMPLE_OBJECT_JSON) as Record<string, Object>;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Record<string, Object> | null = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'parse',
          'parse(text: string, reviver?: Transformer, options?: ParseOptions): Object | null', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let source: Record<string, Object> = createSampleRecord();
        let stringifySource = (src: Record<string, Object>): string => {
          return JSON.stringify(src);
        };
        let result: string = stringifySource(source);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = stringifySource(source);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: string = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'stringify',
          'stringify(value: Object, replacer?: Transformer, space?: string | number): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_has_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: Record<string, Object> = JSON.parse(SAMPLE_OBJECT_JSON) as Record<string, Object>;
        let result: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.has(obj, 'name');
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_has_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'has',
          'has(obj: object, property: string): boolean', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_remove_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let objs: Record<string, Object>[] = [];
        for (let i: number = 0; i < BASE_COUNT; i++) {
          objs.push(JSON.parse(SAMPLE_OBJECT_JSON) as Record<string, Object>);
        }
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          JSON.remove(objs[i], 'version');
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: boolean = JSON.has(objs[0], 'name');
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_remove_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'remove',
          'remove(obj: object, property: string): void', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Jsonx_BigIntMode_DEFAULT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: JSON.BigIntMode = JSON.BigIntMode.DEFAULT;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = JSON.BigIntMode.DEFAULT;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: JSON.BigIntMode = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Jsonx_BigIntMode_DEFAULT_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'BigIntMode.DEFAULT',
          'BigIntMode.DEFAULT', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Jsonx_BigIntMode_PARSE_AS_BIGINT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: JSON.BigIntMode = JSON.BigIntMode.PARSE_AS_BIGINT;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = JSON.BigIntMode.PARSE_AS_BIGINT;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: JSON.BigIntMode = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Jsonx_BigIntMode_PARSE_AS_BIGINT_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'BigIntMode.PARSE_AS_BIGINT',
          'BigIntMode.PARSE_AS_BIGINT', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Jsonx_BigIntMode_ALWAYS_PARSE_AS_BIGINT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: JSON.BigIntMode = JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: JSON.BigIntMode = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Jsonx_BigIntMode_ALWAYS_PARSE_AS_BIGINT_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'BigIntMode.ALWAYS_PARSE_AS_BIGINT',
          'BigIntMode.ALWAYS_PARSE_AS_BIGINT', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_Jsonx_ParseOptions_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let opts: JSON.ParseOptions = { bigIntMode: JSON.BigIntMode.DEFAULT };
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          opts = { bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT };
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: JSON.ParseOptions = opts;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Jsonx_ParseOptions_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'ParseOptions',
          'interface ParseOptions { bigIntMode: BigIntMode }', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JsonElementSerializable_toJSON_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: SerializableClass = new SerializableClass();
        let elem: Record<string, Object> = obj.toJSON();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          elem = obj.toJSON();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Record<string, Object> = elem;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonElementSerializable_toJSON_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'toJSON',
          'toJSON(): Record<string, Object>', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JsonElementDeserializable_fromJSON_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: DeserializableClass = new DeserializableClass();
        let jsonObj: Record<string, Object> = createSampleRecord();
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          obj.fromJSON(jsonObj);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: DeserializableClass = obj;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JsonElementDeserializable_fromJSON_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'fromJSON',
          'fromJSON(jsonObj: Record<string, Object>): void', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parse_fullObject_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let result: Record<string, Object> | null = null;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(SAMPLE_FULL_OBJECT_JSON) as Record<string, Object>;
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: Record<string, Object> | null = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_fullObject_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'parse',
          'parse(text: string): Object | null', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_fullObject_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let source: Record<string, Object> = createSampleObjectElement();
        let stringifyFullObject = (src: Record<string, Object>): string => {
          return JSON.stringify(src);
        };
        let result: string = stringifyFullObject(source);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = stringifyFullObject(source);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1: string = result;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_fullObject_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'JSON', 'stringify',
          'stringify(value: Object): string', arkTsAveragedTime);
      done();
      });
  });
}