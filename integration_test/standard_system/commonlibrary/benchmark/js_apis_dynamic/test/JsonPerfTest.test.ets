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
  describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach
} from "@ohos/hypium";
import { JSON as JSONUTIL } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function JsonPerfTest(): void {
  describe('JsonPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. parse ====================

    it('PerformanceTest_JSON_Parse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let res: Object | null = JSONUTIL.parse(jsonText);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = JSONUTIL.parse(jsonText);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_Parse_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'JSON', 'parse',
          'parse(text: string, reviver?: Transformer, options?: ParseOptions): Object | null', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. stringify ====================

    it('PerformanceTest_JSON_Stringify_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: Object | null = JSONUTIL.parse('{"name": "John", "age": 30, "city": "ChongQing"}');
        let res: string = JSONUTIL.stringify(obj);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = JSONUTIL.stringify(obj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_Stringify_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'JSON', 'stringify',
          'stringify(value: Object, replacer?: (number | string)[] | null, space?: string | number): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. stringify (replacer transformer) ====================

    it('PerformanceTest_JSON_Stringify_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let obj: Object | null = JSONUTIL.parse('{"name": "John", "age": 30, "city": "ChongQing"}');
        let replacer = (key: string, value: Object): Object => { return value; };
        let res: string = JSONUTIL.stringify(obj, replacer);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = JSONUTIL.stringify(obj, replacer);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_Stringify_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'JSON', 'stringify',
          'stringify(value: Object, replacer?: Transformer, space?: string | number): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. has ====================

    it('PerformanceTest_JSON_Has_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let obj = JSONUTIL.parse(jsonText);
        let res: boolean = JSONUTIL.has(obj, "name");
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = JSONUTIL.has(obj, "name");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_Has_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'JSON', 'has',
          'has(obj: object, property: string): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. remove ====================

    it('PerformanceTest_JSON_Remove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let objs: Object[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          objs.push(JSONUTIL.parse('{"name": "John", "age": 30}')!);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          JSONUTIL.remove(objs[i], "name");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_JSON_Remove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'JSON', 'remove',
          'remove(obj: object, property: string): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
