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
  afterAll,
  beforeEach
} from "../../../hypium/index";
import performance from './Performance.util';

class ObjectFieldsHelper {
  public name: String = "arkts";
  public version: int = 24;
}

class ObjectAssignSourceA {
  public first: String = "one";
}

class ObjectAssignSourceB {
  public second: String = "two";
}

export default function ObjectPerfTest(): void {
  describe('ObjectPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Object_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Object = new Object();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new Object();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_ToString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new Object();
        let result: String = classnull.toString();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = classnull.toString();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_ToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'toString',
          'toString(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_ToLocaleString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new Object();
        let result: String = classnull.toLocaleString();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = classnull.toLocaleString();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_ToLocaleString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'toLocaleString',
          'toLocaleString(locales?: Intl.LocalesArgument, options?: object): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_HashCode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new Object();
        let result: int = classnull.$_hashCode();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = classnull.$_hashCode();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_HashCode_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          '$_hashCode',
          '$_hashCode(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Keys_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull = new Record<string, Any>();
        classnull.set("name", "arkts");
        classnull.set("version", 24);

        let result: string[] = Object.keys(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.keys(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Keys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'keys',
          'static keys(rec: Record<PropertyKey, Any>): string[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Keys_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: string[] = Object.keys(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.keys(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Keys_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'keys',
          'static keys(o: Object): string[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Values_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull = new Record<string, Any>();
        classnull.set("name", "arkts");
        classnull.set("version", 24);

        let result: Any[] = Object.values(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.values(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Values_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'values',
          'static values(rec: Record<PropertyKey, Any>): Any[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Values_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: Any[] = Object.values(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.values(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Values_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'values',
          'static values(o: Object): Any[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Entries_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull = new Record<string, Any>();
        classnull.set("name", "arkts");
        classnull.set("version", 24);

        let result: Any = Object.entries(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.entries(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Entries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'entries',
          'static entries(rec: Record<PropertyKey, Any>): NullishEntryType[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Entries_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: Any = Object.entries(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.entries(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Entries_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'entries',
          'static entries(o: Object): NullishEntryType[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_GetOwnPropertyNames_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull = new Record<string, Any>();
        classnull.set("name", "arkts");
        classnull.set("version", 24);

        let result: string[] = Object.getOwnPropertyNames(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.getOwnPropertyNames(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_GetOwnPropertyNames_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'getOwnPropertyNames',
          'static getOwnPropertyNames(rec: Record<PropertyKey, Any>): string[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_GetOwnPropertyNames_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: string[] = Object.getOwnPropertyNames(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.getOwnPropertyNames(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_GetOwnPropertyNames_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'getOwnPropertyNames',
          'static getOwnPropertyNames(o: Object): string[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_HasOwnProperty_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Array<int> = [1, 2, 3];
        let result: boolean = classnull.hasOwnProperty(1);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = classnull.hasOwnProperty(1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_HasOwnProperty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'hasOwnProperty',
          'hasOwnProperty(index: number): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_HasOwnProperty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: boolean = classnull.hasOwnProperty("name");
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = classnull.hasOwnProperty("name");
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_HasOwnProperty_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'hasOwnProperty',
          'hasOwnProperty(key: string): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_HasOwn_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Object = new ObjectFieldsHelper();
        let result: boolean = Object.hasOwn(classnull, "name");
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.hasOwn(classnull, "name");
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_HasOwn_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'hasOwn',
          'static hasOwn(target: Object, key: PropertyKey): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_HasOwn_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: Array<int> = [1, 2, 3];
        let result: boolean = Object.hasOwn(classnull, 1);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.hasOwn(classnull, 1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_HasOwn_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'hasOwn',
          'static hasOwn(target: Object, index: number): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_FromEntries_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classnull: [string, String][] = [["name", "arkts"], ["lang", "ets"]];
        let result: Record<string, String> = Object.fromEntries<String>(classnull);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.fromEntries<String>(classnull);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_FromEntries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'fromEntries',
          'static fromEntries<T = Any>(entries: Iterable<[PropertyKey, T]>): Record<PropertyKey, T>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Object_Assign_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let target = new Record<string, Any>();
        let source1: Object = new ObjectAssignSourceA();
        let source2: Object = new ObjectAssignSourceB();
        let result: Record<string, Any> = Object.assign(target, source1, source2);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = Object.assign(target, source1, source2);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Object_Assign_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Object',
          'assign',
          'static assign(target: Record<PropertyKey, Any>, ...source: FixedArray<Object>): Record<PropertyKey, Any>',
          arkTsAveragedTime
        );
      });
  })
}