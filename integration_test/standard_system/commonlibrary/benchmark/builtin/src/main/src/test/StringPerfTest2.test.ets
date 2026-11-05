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
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";

import performance from './Performance.util';

export default function StringPerfTest2(): void {
  describe('StringPerfTest2', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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

    // ==================== 构造函数测试（补充） ====================

    // constructor(data: FixedArray<char>)
    it('PerformanceTest_String_constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: FixedArray<char> = [c'H', c'e', c'l', c'l', c'o'] as FixedArray<char>;
      let str: String = new String(data);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        str = new String(data);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = str;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_constructor_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'constructor',
        'constructor(data: FixedArray<char>)',
        arkTsAveragedTime
      );
    })

    // constructor(data: ValueArray<char>)
    it('PerformanceTest_String_constructor_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: ValueArray<char> = [c'H', c'e', c'l', c'l', c'o'] as ValueArray<char>;
      let str: String = new String(data);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        str = new String(data);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = str;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_constructor_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'constructor',
        'constructor(data: ValueArray<char>)',
        arkTsAveragedTime
      );
    })

    // ==================== 静态工厂方法 $_invoke 测试（补充） ====================

    // $_invoke(value: byte): string
    it('PerformanceTest_String_invoke_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(127 as byte);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: byte): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: char): string
    it('PerformanceTest_String_invoke_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(c'A');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: char): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: short): string
    it('PerformanceTest_String_invoke_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(100 as short);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: short): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: long): string
    it('PerformanceTest_String_invoke_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(100 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: long): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: float): string
    it('PerformanceTest_String_invoke_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(1.5 as float);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: float): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: double): string
    it('PerformanceTest_String_invoke_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(1.5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: double): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: Any): string
    it('PerformanceTest_String_invoke_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(true as Any);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: Any): string',
        arkTsAveragedTime
      );
    })

    // ==================== 实例方法测试（补充） ====================

    // codePointCount(begin: number, end: number): number
    it('PerformanceTest_String_codePointCount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let res: number = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.codePointCount(0.0, 5.0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_codePointCount_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'codePointCount',
        'codePointCount(begin: number, end: number): number',
        arkTsAveragedTime
      );
    })

    // concat(...strings: String[]): String
    it('PerformanceTest_String_concat_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let s1: String = new String(" ");
      let s2: String = new String("World");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.concat(s1, s2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_concat_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'concat',
        'concat(...strings: String[]): String',
        arkTsAveragedTime
      );
    })

    // split(separator: RegExp, limit?: int): String[]
    it('PerformanceTest_String_split_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello,World,Test");
      let re: RegExp = new RegExp(",");
      let res: String[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.split(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_split_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'split',
        'split(separator: RegExp, limit?: int): String[]',
        arkTsAveragedTime
      );
    })

    // split(separator: StringOrRegExp, limit?: int): String[]
    it('PerformanceTest_String_split_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello,World,Test");
      let sep: String | RegExp = new String(",");
      let res: String[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.split(sep);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_split_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'split',
        'split(separator: StringOrRegExp, limit?: int): String[]',
        arkTsAveragedTime
      );
    })

    // trimLeft(remove: char[]): String
    it('PerformanceTest_String_trimLeft_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("xxHelloxx");
      let removeChars: char[] = [c'x', c'o'];
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.trimLeft(removeChars);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimLeft_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimLeft',
        'trimLeft(remove: char[]): String',
        arkTsAveragedTime
      );
    })

    // trimRight(remove: char[]): String
    it('PerformanceTest_String_trimRight_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("xxHelloxx");
      let removeChars: char[] = [c'x', c'o'];
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.trimRight(removeChars);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimRight_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimRight',
        'trimRight(remove: char[]): String',
        arkTsAveragedTime
      );
    })

    // big(): String
    it('PerformanceTest_String_big_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.big();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_big_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'big',
        'big(): String',
        arkTsAveragedTime
      );
    })

    // small(): String
    it('PerformanceTest_String_small_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.small();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_small_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'small',
        'small(): String',
        arkTsAveragedTime
      );
    })

    // blink(): String
    it('PerformanceTest_String_blink_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.blink();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_blink_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'blink',
        'blink(): String',
        arkTsAveragedTime
      );
    })

    // strike(): String
    it('PerformanceTest_String_strike_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.strike();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_strike_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'strike',
        'strike(): String',
        arkTsAveragedTime
      );
    })

    // sub(): String
    it('PerformanceTest_String_sub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.sub();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_sub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'sub',
        'sub(): String',
        arkTsAveragedTime
      );
    })

    // sup(): String
    it('PerformanceTest_String_sup_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.sup();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_sup_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'sup',
        'sup(): String',
        arkTsAveragedTime
      );
    })

    // $_iterator(): IterableIterator<String>
    it('PerformanceTest_String_iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: IterableIterator<String> = testString.$_iterator();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_iterator',
        '$_iterator(): IterableIterator<String>',
        arkTsAveragedTime
      );
    })

    // ==================== replace 重载测试（补充） ====================

    // replace(searchValue: RegExp, replaceValue: String): String
    it('PerformanceTest_String_replace_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: RegExp = new RegExp("World");
      let replaceStr: String = new String("Universe");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(re, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: RegExp, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // replace(searchValue: StringOrRegExp, replaceValue: String): String
    it('PerformanceTest_String_replace_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let sv: String | RegExp = new String("World");
      let replaceStr: String = new String("Universe");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(sv, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: StringOrRegExp, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // replace(searchValue: RegExp, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replace_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: RegExp = new RegExp("World");
      let replacer = (substr: String, args: Object[]): String => { return "Replaced"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(re, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: RegExp, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // replace(searchValue: String, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replace_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let searchStr: String = new String("World");
      let replacer = (substr: String, args: Object[]): String => { return "Replaced"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(searchStr, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: String, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // replace(searchValue: StringOrRegExp, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replace_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let sv: String | RegExp = new String("World");
      let replacer = (substr: String, args: Object[]): String => { return "Replaced"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(sv, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: StringOrRegExp, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // ==================== replaceAll 重载测试（补充） ====================

    // replaceAll(searchValue: RegExp, replaceValue: String): String
    it('PerformanceTest_String_replaceAll_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let re: RegExp = new RegExp("Hello", "g");
      let replaceStr: String = new String("Hi");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(re, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: RegExp, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // replaceAll(searchValue: StringOrRegExp, replaceValue: String): String
    it('PerformanceTest_String_replaceAll_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let sv: String | RegExp = new String("Hello");
      let replaceStr: String = new String("Hi");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(sv, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: StringOrRegExp, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // replaceAll(searchValue: RegExp, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replaceAll_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let re: RegExp = new RegExp("Hello", "g");
      let replacer = (substr: String, args: Object[]): String => { return "Hi"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(re, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: RegExp, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // replaceAll(searchValue: String, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replaceAll_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let searchStr: String = new String("Hello");
      let replacer = (substr: String, args: Object[]): String => { return "Hi"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(searchStr, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: String, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // replaceAll(searchValue: StringOrRegExp, replacer: (substr: String, args: Object[]) => String): String
    it('PerformanceTest_String_replaceAll_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let sv: String | RegExp = new String("Hello");
      let replacer = (substr: String, args: Object[]): String => { return "Hi"; };
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(sv, replacer);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: StringOrRegExp, replacer: (substr: String, args: Object[]) => String): String',
        arkTsAveragedTime
      );
    })

    // ==================== search 重载测试 ====================

    // search(implicitRegExp: String): int
    it('PerformanceTest_String_search_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.search("World");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_search_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'search',
        'search(implicitRegExp: String): int',
        arkTsAveragedTime
      );
    })

    // search(regexp: RegExp): int
    it('PerformanceTest_String_search_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: RegExp = new RegExp("World");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.search(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_search_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'search',
        'search(regexp: RegExp): int',
        arkTsAveragedTime
      );
    })

    // search(regexp: StringOrRegExp): int
    it('PerformanceTest_String_search_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: String | RegExp = new RegExp("World");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.search(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_search_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'search',
        'search(regexp: StringOrRegExp): int',
        arkTsAveragedTime
      );
    })

    // ==================== toLocaleLowerCase 重载测试 ====================

    // toLocaleLowerCase(locale: String): String
    it('PerformanceTest_String_toLocaleLowerCase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("HELLO");
      let locale: String = new String("en-US");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleLowerCase(locale);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleLowerCase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleLowerCase',
        'toLocaleLowerCase(locale: String): String',
        arkTsAveragedTime
      );
    })

    // toLocaleLowerCase(locale: String[]): String
    it('PerformanceTest_String_toLocaleLowerCase_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("HELLO");
      let locales: String[] = [new String("en-US"), new String("zh-CN")];
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleLowerCase(locales);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleLowerCase_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleLowerCase',
        'toLocaleLowerCase(locale: String[]): String',
        arkTsAveragedTime
      );
    })

    // toLocaleLowerCase(): String
    it('PerformanceTest_String_toLocaleLowerCase_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("HELLO");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleLowerCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleLowerCase_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleLowerCase',
        'toLocaleLowerCase(): String',
        arkTsAveragedTime
      );
    })

    // ==================== toLocaleUpperCase 重载测试 ====================

    // toLocaleUpperCase(locale: String): String
    it('PerformanceTest_String_toLocaleUpperCase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("hello");
      let locale: String = new String("en-US");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleUpperCase(locale);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleUpperCase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleUpperCase',
        'toLocaleUpperCase(locale: String): String',
        arkTsAveragedTime
      );
    })

    // toLocaleUpperCase(locale: String[]): String
    it('PerformanceTest_String_toLocaleUpperCase_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("hello");
      let locales: String[] = [new String("en-US"), new String("zh-CN")];
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleUpperCase(locales);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleUpperCase_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleUpperCase',
        'toLocaleUpperCase(locale: String[]): String',
        arkTsAveragedTime
      );
    })

    // toLocaleUpperCase(): String
    it('PerformanceTest_String_toLocaleUpperCase_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toLocaleUpperCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLocaleUpperCase_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLocaleUpperCase',
        'toLocaleUpperCase(): String',
        arkTsAveragedTime
      );
    })

    // ==================== match 重载测试 ====================

    // match(implicitRegExp: String): RegExpMatchArray | null
    it('PerformanceTest_String_match_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let res: RegExpMatchArray | null = testString.match("World");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.match("World");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_match_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'match',
        'match(implicitRegExp: String): RegExpMatchArray | null',
        arkTsAveragedTime
      );
    })

    // match(regexp: RegExp): RegExpMatchArray | null
    it('PerformanceTest_String_match_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: RegExp = new RegExp("World");
      let res: RegExpMatchArray | null = testString.match(re);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.match(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_match_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'match',
        'match(regexp: RegExp): RegExpMatchArray | null',
        arkTsAveragedTime
      );
    })

    // match(regexp: StringOrRegExp): RegExpMatchArray | null
    it('PerformanceTest_String_match_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let re: String | RegExp = new RegExp("World");
      let res: RegExpMatchArray | null = testString.match(re);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.match(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_match_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'match',
        'match(regexp: StringOrRegExp): RegExpMatchArray | null',
        arkTsAveragedTime
      );
    })

    // matchAll(reg: RegExp): IterableIterator<RegExpMatchArray>
    it('PerformanceTest_String_matchAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello Hello Hello");
      let re: RegExp = new RegExp("Hello", "g");
      let res: IterableIterator<RegExpMatchArray> = testString.matchAll(re);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.matchAll(re);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_matchAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'matchAll',
        'matchAll(reg: RegExp): IterableIterator<RegExpMatchArray>',
        arkTsAveragedTime
      );
    })

    // ==================== 静态方法测试（补充） ====================

    // getSubstitution(matched: String, str: String, position: int, captures: String[], namedCaptures: Record<String, String | undefined> | undefined, replacement: String): string
    it('PerformanceTest_String_getSubstitution_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let matched: String = new String("Hello");
      let str: String = new String("Hello World");
      let position: int = 0;
      let captures: String[] = [new String("capture1"), new String("capture2")];
      let replacement: String = new String("$1 $2");
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.getSubstitution(matched, str, position, captures, undefined, replacement);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_getSubstitution_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'getSubstitution',
        'getSubstitution(matched: String, str: String, position: int, captures: String[], namedCaptures: Record<String, String | undefined> | undefined, replacement: String): string',
        arkTsAveragedTime
      );
    })

  })
}
