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
  expect,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

function replaceWithEts(): string {
  return "ets";
}

export default function RegExpPerfTest(): void {
  describe('RegExpPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_RegExp_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pattern: string = "arkts";
        let result: RegExp = new RegExp(pattern);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(pattern);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(pattern: string)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pattern: string = "arkts";
        let flags: string = "g";
        let result: RegExp = new RegExp(pattern, flags);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(pattern, flags);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(pattern: string, flags: string)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_constructor_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base: RegExp = new RegExp("arkts", "g");
        let result: RegExp = new RegExp(base);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(base);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(regexp: RegExp)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_constructor_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let base: RegExp = new RegExp("arkts", "g");
        let flags: string = "i";
        let result: RegExp = new RegExp(base, flags);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(base, flags);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(regexp: RegExp, flags: string)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_flags_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "mig");
        let result: string = re.flags;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.flags;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_flags_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'flags',
          'get flags(): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_global_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: boolean = re.global;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.global;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_global_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'global',
          'get global(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_dotAll_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("a.b", "s");
        let result: boolean = re.dotAll;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.dotAll;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_dotAll_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'dotAll',
          'get dotAll(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_ignoreCase_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "i");
        let result: boolean = re.ignoreCase;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.ignoreCase;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_ignoreCase_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'ignoreCase',
          'get ignoreCase(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_multiline_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("^arkts$", "m");
        let result: boolean = re.multiline;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.multiline;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_multiline_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'multiline',
          'get multiline(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_sticky_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "y");
        let result: boolean = re.sticky;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.sticky;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_sticky_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'sticky',
          'get sticky(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_unicode_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "u");
        let result: boolean = re.unicode;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.unicode;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_unicode_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'unicode',
          'get unicode(): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_source_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: string = re.source;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.source;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_source_1200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'source',
          'get source(): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_exec_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts");
        let text: string = "hello arkts world";
        let result: RegExpExecArray | null = re.exec(text);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.exec(text);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_exec_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'exec',
          'exec(str: string): RegExpExecArray | null',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_search_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts");
        let text: string = "hello arkts world";
        let result: number = text.search(re);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.search(re);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_search_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'search',
          'search(str: string): int',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_replace_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: string = "arkts hello arkts";
        let result: string = text.replace(re, "ets");
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.replace(re, "ets");
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_replace_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'replace',
          'replace(str: string, replaceValue: string): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_replace_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: string = "arkts hello arkts";
        let result: string = text.replace(re, replaceWithEts);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.replace(re, replaceWithEts);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_replace_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'replace',
          'replace(str: string, replacer: (substr: string, args: Object[]) => string): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_split_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp(",");
        let text: string = "a,b,c,d";
        let result: string[] = text.split(re, 2);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.split(re, 2);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_split_1800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'split',
          'split(str: string, limit: Int | undefined): string[]',
          arkTsAveragedTime
        );
;
      done();
      });

    it('PerformanceTest_RegExp_match_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: string = "arkts hello arkts";
        let result: RegExpMatchArray | null = text.match(re);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.match(re);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_match_1900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'match',
          'match(str: string): RegExpMatchArray | null',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_matchAll_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: string = "arkts hello arkts";
        let result: IterableIterator<RegExpMatchArray> = text.matchAll(re);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = text.matchAll(re);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_matchAll_2000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'String',
          'matchAll',
          'matchAll(str: string): IterableIterator<RegExpMatchArray>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_test_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts");
        let text: string = "hello arkts world";
        let result: boolean = re.test(text);
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.test(text);
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_test_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'test',
          'test(str: string): boolean',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_toString_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: string = re.toString();
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.toString();
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_toString_2200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_RegExp_lastIndex_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: number = re.lastIndex;
        let Stime = systemDateTime.getTime(true);

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.lastIndex;
        }

        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_lastIndex_2300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'lastIndex',
          'lastIndex: int',
          arkTsAveragedTime
        );
      done();
      });

  });
}