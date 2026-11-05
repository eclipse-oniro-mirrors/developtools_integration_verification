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


function replaceWithEts(substr: String, args: Object[]): String {
  return "ets";
}

export default function RegExpPerfTest(): void {
  describe('RegExpPerfTest', () => {
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
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_RegExp_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern: String = "arkts";
        let result: RegExp = new RegExp(pattern);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(pattern);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(pattern: String)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern: String = "arkts";
        let flags: String = "g";
        let result: RegExp = new RegExp(pattern, flags);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(pattern, flags);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(pattern: String, flags: String)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_constructor_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let base: RegExp = new RegExp("arkts", "g");
        let result: RegExp = new RegExp(base);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(base);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(regexp: RegExp)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_constructor_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let base: RegExp = new RegExp("arkts", "g");
        let flags: String = "i";
        let result: RegExp = new RegExp(base, flags);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExp(base, flags);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_constructor_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'constructor',
          'constructor(regexp: RegExp, flags: String)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_flags_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "mig");
        let result: String = re.flags;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.flags;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_flags_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'flags',
          'get flags(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_global_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: boolean = re.global;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.global;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_global_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'global',
          'get global(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_dotAll_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("a.b", "s");
        let result: boolean = re.dotAll;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.dotAll;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_dotAll_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'dotAll',
          'get dotAll(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_hasIndices_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "d");
        let result: boolean = re.hasIndices;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.hasIndices;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_hasIndices_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'hasIndices',
          'get hasIndices(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_ignoreCase_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "i");
        let result: boolean = re.ignoreCase;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.ignoreCase;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_ignoreCase_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'ignoreCase',
          'get ignoreCase(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_multiline_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("^arkts$", "m");
        let result: boolean = re.multiline;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.multiline;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_multiline_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'multiline',
          'get multiline(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_sticky_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "y");
        let result: boolean = re.sticky;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.sticky;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_sticky_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'sticky',
          'get sticky(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_unicode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "u");
        let result: boolean = re.unicode;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.unicode;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_unicode_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'unicode',
          'get unicode(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_unicodeSets_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "v");
        let result: boolean = re.unicodeSets;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.unicodeSets;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_unicodeSets_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'unicodeSets',
          'get unicodeSets(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_source_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: String = re.source;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.source;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_source_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'source',
          'get source(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_exec_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts");
        let text: String = "hello arkts world";
        let result: RegExpExecArray | null = re.exec(text, 0);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.exec(text, 0);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_exec_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'exec',
          'exec(str: String, index: int): RegExpExecArray | null',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_exec_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts");
        let text: String = "hello arkts world";
        let result: RegExpExecArray | null = re.exec(text);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.exec(text);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_exec_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'exec',
          'exec(str: String): RegExpExecArray | null',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_search_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts");
        let text: String = "hello arkts world";
        let result: int = re.search(text);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.search(text);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_search_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'search',
          'search(str: String): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_replace_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: String = "arkts hello arkts";
        let result: String = re.replace(text, "ets");
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.replace(text, "ets");
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_replace_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'replace',
          'replace(str: String, replaceValue: String): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_replace_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: String = "arkts hello arkts";
        let result: String = re.replace(text, replaceWithEts);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.replace(text, replaceWithEts);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_replace_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'replace',
          'replace(str: String, replacer: (substr: String, args: Object[]) => String): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_split_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp(",");
        let text: String = "a,b,c,d";
        let result: String[] = re.split(text, 2);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.split(text, 2);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_split_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'split',
          'split(str: String, limit: Int | undefined): String[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_match_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: String = "arkts hello arkts";
        let result: RegExpMatchArray | null = re.match(text);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.match(text);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_match_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'match',
          'match(str: String): RegExpMatchArray | null',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_matchAll_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let text: String = "arkts hello arkts";
        let result: IterableIterator<RegExpMatchArray> = re.matchAll(text);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.matchAll(text);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_matchAll_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'matchAll',
          'matchAll(str: String): IterableIterator<RegExpMatchArray>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_test_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts");
        let text: String = "hello arkts world";
        let result: boolean = re.test(text);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.test(text);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_test_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'test',
          'test(str: String): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: String = re.toString();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.toString();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'toString',
          'toString(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_advanceStringIndex_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let text: String = "😊arkts";
        let result: int = RegExp.advanceStringIndex(text, 0, true);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = RegExp.advanceStringIndex(text, 0, true);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_advanceStringIndex_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'advanceStringIndex',
          'advanceStringIndex(s: String, index: int, unicode: boolean): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_$_invoke_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern: String = "arkts";
        let result: RegExp = RegExp.$_invoke(pattern);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = RegExp.$_invoke(pattern);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_$_invoke_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          '$_invoke',
          '$_invoke(pattern: String): RegExp',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_$_invoke_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern: String = "arkts";
        let flags: String = "g";
        let result: RegExp = RegExp.$_invoke(pattern, flags);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = RegExp.$_invoke(pattern, flags);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_$_invoke_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          '$_invoke',
          '$_invoke(pattern: String, flags: String): RegExp',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_$_invoke_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let base: RegExp = new RegExp("arkts", "g");
        let result: RegExp = RegExp.$_invoke(base);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = RegExp.$_invoke(base);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_$_invoke_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          '$_invoke',
          '$_invoke(pattern: RegExp): RegExp',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_$_invoke_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let base: RegExp = new RegExp("arkts", "g");
        let flags: String = "i";
        let result: RegExp = RegExp.$_invoke(base, flags);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = RegExp.$_invoke(base, flags);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_$_invoke_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          '$_invoke',
          '$_invoke(pattern: RegExp, flags: String): RegExp',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultData: Array<String | undefined> = ["arkts", "ark"];
        let indicesData: Array<Array<int>> = [[0, 5], [0, 3]];
        let input: String = "arkts";
        let result: RegExpResultArray = new RegExpResultArray(0, input, resultData, indicesData);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExpResultArray(0, input, resultData, indicesData);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'constructor',
          'constructor(index: int, input: String, result: Array<String | undefined>, indices: Array<Array<int>>)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_result_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: Array<String | undefined> = arr.result;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.result;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_result_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'result',
          'get result(): Array<String | undefined>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_$_get_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: String = arr.$_get("0");
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.$_get("0");
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_$_get_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          '$_get',
          '$_get(index: String): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_$_get_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: String | undefined = arr.$_get(0);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.$_get(0);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_$_get_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          '$_get',
          '$_get(index: int): String | undefined',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_$_set_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          arr.$_set(1, "ets");
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_$_set_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          '$_set',
          '$_set(index: int, val: String | undefined): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_indices_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: Array<Array<int>> = arr.indices;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.indices;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_indices_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'indices',
          'get indices(): Array<Array<int>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: String = arr.toString();
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.toString();
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_toString_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'toString',
          'toString(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_postExecProcessing_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let input: String = "arkts";
        arr.postExecProcessing(arr, input, 0, true);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          arr.postExecProcessing(arr, input, 0, true);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_postExecProcessing_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'postExecProcessing',
          'postExecProcessing(res: RegExpResultArray, input: String, index: int, hasIndices: boolean): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultData: Array<String | undefined> = ["arkts", "ark"];
        let indicesData: Array<Array<int>> = [[0, 5], [0, 3]];
        let input: String = "arkts";
        let result: RegExpMatchArray = new RegExpMatchArray(0, input, resultData, indicesData);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExpMatchArray(0, input, resultData, indicesData);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'constructor',
          'constructor(index: int, input: String, result: Array<String | undefined>, indices: Array<Array<int>>)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultData: Array<String | undefined> = ["arkts", "ark"];
        let input: String = "arkts";
        let result: RegExpMatchArray = new RegExpMatchArray(0, input, resultData);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExpMatchArray(0, input, resultData);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_constructor_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'constructor',
          'constructor(index: int, input: String, result: Array<String | undefined>)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_index_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpMatchArray = new RegExpMatchArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: int | undefined = arr.index;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.index;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_index_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'index',
          'get index(): int | undefined',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_input_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpMatchArray = new RegExpMatchArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: String | undefined = arr.input;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.input;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_input_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'input',
          'get input(): String | undefined',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_index_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpMatchArray = new RegExpMatchArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        arr.index = 1;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          arr.index = 1;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_index_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'index',
          'set index(val: int | undefined): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpMatchArray_input_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpMatchArray = new RegExpMatchArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        arr.input = "ets";
        let sTime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          arr.input = "ets";
        }
        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpMatchArray_input_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpMatchArray',
          'input',
          'set input(val: String | undefined): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultData: Array<String | undefined> = ["arkts", "ark"];
        let indicesData: Array<Array<int>> = [[0, 5], [0, 3]];
        let input: String = "arkts";
        let result: RegExpExecArray = new RegExpExecArray(0, input, resultData, indicesData);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExpExecArray(0, input, resultData, indicesData);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'constructor',
          'constructor(index: int, input: String, result: Array<String | undefined>, indices: Array<Array<int>>)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultData: Array<String | undefined> = ["arkts", "ark"];
        let input: String = "arkts";
        let result: RegExpExecArray = new RegExpExecArray(0, input, resultData);
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new RegExpExecArray(0, input, resultData);
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_constructor_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'constructor',
          'constructor(index: int, input: String, result: Array<String | undefined>)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_index_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpExecArray = new RegExpExecArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: int = arr.index;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.index;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_index_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'index',
          'get index(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_input_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpExecArray = new RegExpExecArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: String = arr.input;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.input;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_input_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'input',
          'get input(): String',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_index_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpExecArray = new RegExpExecArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        arr.index = 1;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          arr.index = 1;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_index_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'index',
          'set index(val: int): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpExecArray_input_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpExecArray = new RegExpExecArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        arr.input = "ets";
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          arr.input = "ets";
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = arr;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpExecArray_input_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpExecArray',
          'input',
          'set input(val: String): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExp_lastIndex_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let re: RegExp = new RegExp("arkts", "g");
        let result: int = 0;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = re.lastIndex;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExp_lastIndex_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExp',
          'lastIndex',
          'lastIndex: int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_isCorrect_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: boolean = arr.isCorrect;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.isCorrect;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_isCorrect_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'isCorrect',
          'readonly isCorrect: boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_RegExpResultArray_groups_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let arr: RegExpResultArray = new RegExpResultArray(0, "arkts", ["arkts", "ark"], [[0, 5], [0, 3]]);
        let result: Object | undefined = arr.groups;
        let sTime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = arr.groups;
        }

        let dTime = new Date().getTime() - sTime;
        let res1 = result;
        let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RegExpResultArray_groups_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'RegExpResultArray',
          'groups',
          'groups: RegExpGroupsContainer | undefined',
          arkTsAveragedTime
        );
      });
  });
}