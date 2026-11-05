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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

function toByteValue(value: number): number {
  return value;
}

function createByteFixedArray(): number[] {
  return [1, 2, 3];
}

function createCharFixedArray(): string[] {
  return ['a', 'b', 'c'];
}

function createBooleanFixedArray(): boolean[] {
  return [true, false, true];
}

function createSimpleRecord(): Record<string, Object> {
  return { "name": "arkts", "age": 1 };
}

function commonReviver(key: string, value: Object): Object {
  return value;
}

function jsonElementReviver(key: string, value: object): object {
  return value;
}

function createStringifyFilterFixedArray(): (number | string)[] {
  return ["name", "age"];
}

function createStringifyFilterArray(): (number | string)[] {
  return ["name", "age"];
}

class SampleJsonReplacer {
  name: string = "arkts";
  age: number = 1;
}

class SampleParsePojo {
  name: string = "";
  age: number = 0;
}

export default function JsonPerfTest(): void {
  describe('JsonPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

it('PerformanceTest_JSON_stringify_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: number = toByteValue(7);
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(number): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: string = 'a';
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(string): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: boolean = true;
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(boolean): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: number[] = createByteFixedArray();
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(number[]): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: string[] = createCharFixedArray();
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(string[]): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let d: boolean[] = createBooleanFixedArray();
        let result: string = JSON.stringify(d);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(d);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(boolean[]): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let obj: SampleJsonReplacer = new SampleJsonReplacer();
        let result: string = JSON.stringify(obj);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(object): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let obj: Record<string, Object> = createSimpleRecord();
        let result: string = JSON.stringify(obj);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(Record<string, Object>): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let obj: Record<string, Object> = createSimpleRecord();
        let result: string = JSON.stringify(obj, commonReviver, 2);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, commonReviver, 2);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(obj: Object, replacer: ((key: string, value: Object) => Object) | undefined | null, space?: number | string): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let obj: Record<string, Object> = createSimpleRecord();
        let replacer: (number | string)[] = createStringifyFilterFixedArray();
        let result: string = JSON.stringify(obj, replacer, 2);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, replacer, 2);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(Object, (number | string)[], number | string): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_stringify_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let obj: Record<string, Object> = createSimpleRecord();
        let replacer: (number | string)[] = createStringifyFilterArray();
        let result: string = JSON.stringify(obj, replacer, 2);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.stringify(obj, replacer, 2);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_stringify_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'stringify',
          'stringify(obj: Object, replacer: (number | string)[], space?: number | string): string', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parse_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let json: string = "{\"name\":\"arkts\",\"age\":1}";
        let result: SampleParsePojo | null | undefined = JSON.parse(json);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(json);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse<T>(json: string): T', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parse_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let json: string = "{\"name\":\"arkts\",\"age\":1}";
        let result: SampleParsePojo | null | undefined = JSON.parse(json, commonReviver);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(json, commonReviver);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parse_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse<T>(json: string, reviver: ((key: string, value: Object) => Object) | undefined): T', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parseJsonElement_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let result: object = JSON.parse(text);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(text);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonElement_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse(string): object', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parseJsonElement_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let result: object = JSON.parse(text, jsonElementReviver);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(text, jsonElementReviver);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonElement_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse(string, (string, object) => object): object', arkTsAveragedTime);
      done();
      });

    it('PerformanceTest_JSON_parseJsonRecord_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let text: string = "{\"name\":\"arkts\",\"age\":1}";
        let result: Record<string, Object> = JSON.parse(text);
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT; i++) {
          result = JSON.parse(text);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_parseJsonRecord_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'JSON', 'parse',
          'parse(string): Record<string, Object>', arkTsAveragedTime);
      done();
      });

  });
}