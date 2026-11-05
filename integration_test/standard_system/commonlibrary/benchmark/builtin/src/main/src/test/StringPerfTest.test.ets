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

export default function StringPerfTest(): void {
  describe('StringPerfTest', () => {
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

    // ==================== 构造函数测试 ====================

    // constructor()
    it('PerformanceTest_String_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: String = new String();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        str = new String();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = str;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'constructor',
        'constructor()',
        arkTsAveragedTime
      );
    })

    // constructor(otherStr: String)
    it('PerformanceTest_String_constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: String = new String("Hello");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        str = new String("Hello");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = str;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_constructor_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'constructor',
        'constructor(otherStr: String)',
        arkTsAveragedTime
      );
    })

    // constructor(object: Any)
    it('PerformanceTest_String_constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: object = new Object();
      let str: String = new String(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        str = new String(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = str;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_constructor_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'constructor',
        'constructor(object: Any)',
        arkTsAveragedTime
      );
    })

    // ==================== 静态工厂方法 $_invoke 测试 ====================

    // $_invoke(): string
    it('PerformanceTest_String_invoke_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = String.$_invoke();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: boolean): string
    it('PerformanceTest_String_invoke_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(true);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: boolean): string',
        arkTsAveragedTime
      );
    })

    // $_invoke(value: int): string
    it('PerformanceTest_String_invoke_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = String.$_invoke(123);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.$_invoke(123);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_invoke_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_invoke',
        '$_invoke(value: int): string',
        arkTsAveragedTime
      );
    })

    // ==================== 实例方法测试 ====================

    // $_get(index: int): String
    it('PerformanceTest_String_get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = "";
      let testString: String = "hello";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.$_get(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        '$_get',
        '$_get(index: int): String',
        arkTsAveragedTime
      );
    })

    // equals(to: Any): boolean
    it('PerformanceTest_String_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = true;
      let testString1: String = "";
      let testString2: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString1.equals(testString2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'equals',
        'equals(to: Any): boolean',
        arkTsAveragedTime
      );
    })

    // getLength(): int
    it('PerformanceTest_String_getLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "";
      let res: int = testString.getLength();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.getLength();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_getLength_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'getLength',
        'getLength(): int',
        arkTsAveragedTime
      );
    })

    // get length(): int
    it('PerformanceTest_String_length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "";
      let res: int = testString.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'get length',
        'get length(): int',
        arkTsAveragedTime
      );
    })

    // charAt(index: int): char
    it('PerformanceTest_String_charAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "hello";
      let res: char = testString.charAt(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.charAt(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_charAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'charAt',
        'charAt(index: int): char',
        arkTsAveragedTime
      );
    })

    // isEmpty(): boolean
    it('PerformanceTest_String_isEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "";
      let res: boolean = testString.isEmpty();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.isEmpty();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_isEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'isEmpty',
        'isEmpty(): boolean',
        arkTsAveragedTime
      );
    })

    // codePointAt(index: int): int | undefined
    it('PerformanceTest_String_codePointAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "hello";
      let res: int | undefined = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.codePointAt(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_codePointAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'codePointAt',
        'codePointAt(index: int): int | undefined',
        arkTsAveragedTime
      );
    })

    // codePointCount(begin: int, end: int): int
    it('PerformanceTest_String_codePointCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "1234567890";
      let res: int = testString.codePointCount(0, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.codePointCount(0, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_codePointCount_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'codePointCount',
        'codePointCount(begin: int, end: int): int',
        arkTsAveragedTime
      );
    })

    // getChars(): char[]
    it('PerformanceTest_String_getChars_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "hello";
      let res: char[] = testString.getChars();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.getChars();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_getChars_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'getChars',
        'getChars(): char[]',
        arkTsAveragedTime
      );
    })

    // getChars(begin: int, end: int): char[]
    it('PerformanceTest_String_getChars_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "0123456789";
      let res: char[] = testString.getChars(0, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.getChars(0, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_getChars_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'getChars',
        'getChars(begin: int, end: int): char[]',
        arkTsAveragedTime
      );
    })

    // getBytes(begin: int, end: int): byte[]
    it('PerformanceTest_String_getBytes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "0123456789";
      let res: byte[] = testString.getBytes(0, 5);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.getBytes(0, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_getBytes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'getBytes',
        'getBytes(begin: int, end: int): byte[]',
        arkTsAveragedTime
      );
    })

    // contentEquals(sb: StringBuilder): boolean
    it('PerformanceTest_String_contentEquals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello World";
      let sb: StringBuilder = new StringBuilder("Hello World");
      let res: boolean = testString.contentEquals(sb);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.contentEquals(sb);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_contentEquals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'contentEquals',
        'contentEquals(sb: StringBuilder): boolean',
        arkTsAveragedTime
      );
    })

    // compareTo(other: String): int
    it('PerformanceTest_String_compareTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString1: String = "hello";
      let testString2: String = "hello";
      let res: int = testString1.compareTo(testString2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString1.compareTo(testString2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_compareTo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'compareTo',
        'compareTo(other: String): int',
        arkTsAveragedTime
      );
    })

    // startsWith(prefix: String, fromIndex?: int): boolean
    it('PerformanceTest_String_startsWith_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello World";
      let prefix: String = new String("Hello");
      let res: boolean = testString.startsWith(prefix);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.startsWith(prefix);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_startsWith_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'startsWith',
        'startsWith(prefix: String, fromIndex?: int): boolean',
        arkTsAveragedTime
      );
    })

    // endsWith(suffix: String, endPosition?: int): boolean
    it('PerformanceTest_String_endsWith_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello World";
      let suffix: String = new String("World");
      let res: boolean = testString.endsWith(suffix);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.endsWith(suffix);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_endsWith_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'endsWith',
        'endsWith(suffix: String, endPosition?: int): boolean',
        arkTsAveragedTime
      );
    })

    // indexOf(ch: char): int
    // FIXED: 2026.04.26
    it('PerformanceTest_String_indexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 预定义测试数据
      let testString: String = new String("Hello World");
      let searchChar: char = c'o';  // 使用 char 字面量
      let res: int = -1;

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.indexOf(searchChar);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_indexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'indexOf',
        'indexOf(ch: char): int',
        arkTsAveragedTime
      );
    })

    // indexOf(ch: char, fromIndex: int): int
    // FIXED: 2026.04.26
    it('PerformanceTest_String_indexOf_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 预定义测试数据
      let testString: String = new String("Hello World");
      let searchChar: char = c'o';
      let fromIndex: int = 5;  // 从索引5开始搜索
      let res: int = -1;

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.indexOf(searchChar, fromIndex);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_indexOf_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'indexOf',
        'indexOf(ch: char, fromIndex: int): int',
        arkTsAveragedTime
      );
    })

    // indexOf(str: String, fromIndex?: int): int
    it('PerformanceTest_String_indexOf_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello World";
      let searchStr: String = new String("World");
      let res: int = testString.indexOf(searchStr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.indexOf(searchStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_indexOf_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'indexOf',
        'indexOf(str: String, fromIndex?: int): int',
        arkTsAveragedTime
      );
    })

    // lastIndexOf(ch: char): int
    // FIXED: 2026.04.26
    it('PerformanceTest_String_lastIndexOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("oops!");
      let searchChar: char = c'o';  // 在 "oops!" 中存在
      let res: int = -1;

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.lastIndexOf(searchChar);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_lastIndexOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'lastIndexOf',
        'lastIndexOf(ch: char): int',
        arkTsAveragedTime
      );
    })

    // lastIndexOf(ch: char, fromIndex: int): int
    // FIXED: 2026.04.26
    it('PerformanceTest_String_lastIndexOf_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("go go go!");
      let searchChar: char = c'o';  // 在 "go go go!" 中存在
      let fromIndex: int = 5;  // 从索引5开始向前搜索
      let res: int = -1;

      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.lastIndexOf(searchChar, fromIndex);
      }

      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_lastIndexOf_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'lastIndexOf',
        'lastIndexOf(ch: char, fromIndex: int): int',
        arkTsAveragedTime
      );
    })

    // lastIndexOf(str: String, fromIndex?: int): int
    it('PerformanceTest_String_lastIndexOf_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello World!";
      let searchStr: String = new String("World");
      let res = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.lastIndexOf(searchStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_lastIndexOf_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'lastIndexOf',
        'lastIndexOf(str: String, fromIndex?: int): int',
        arkTsAveragedTime
      );
    })

    // substring(begin: int): String
    it('PerformanceTest_String_substring_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.substring(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_substring_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'substring',
        'substring(begin: int): String',
        arkTsAveragedTime
      );
    })

    // substring(begin: int, end: int): String
    it('PerformanceTest_String_substring_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.substring(3, 8);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_substring_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'substring',
        'substring(begin: int, end: int): String',
        arkTsAveragedTime
      );
    })

    // concat(s: String): String
    it('PerformanceTest_String_concat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let suffix: String = new String("!");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.concat(suffix);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_concat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'concat',
        'concat(s: String): String',
        arkTsAveragedTime
      );
    })

    // concat(s1: String, s2: String): String
    it('PerformanceTest_String_concat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let s1: String = new String("!");
      let s2: String = new String("!");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.concat(s1, s2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_concat_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'concat',
        'concat(s1: String, s2: String): String',
        arkTsAveragedTime
      );
    })

    // concat(s1: String, s2: String, s3: String): String
    it('PerformanceTest_String_concat_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let s1: String = new String("!");
      let s2: String = new String("!");
      let s3: String = new String("!");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.concat(s1, s2, s3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_concat_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'concat',
        'concat(s1: String, s2: String, s3: String): String',
        arkTsAveragedTime
      );
    })

    // replaceChar(oldCh: char, newCh: char): String
    it('PerformanceTest_String_replaceChar_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replaceChar(c'l', c'L');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceChar_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceChar',
        'replaceChar(oldCh: char, newCh: char): String',
        arkTsAveragedTime
      );
    })

    // contains(str: String, fromIndex: int): boolean
    it('PerformanceTest_String_contains_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let searchStr: String = new String("World");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.contains(searchStr, 0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_contains_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'contains',
        'contains(str: String, fromIndex: int): boolean',
        arkTsAveragedTime
      );
    })

    // split(separator: String, limit?: int): String[]
    it('PerformanceTest_String_split_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("1 2 3 4 5");
      let sep: String = new String(" ");
      let res: String[] = testString.split(sep);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.split(sep);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_split_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'split',
        'split(separator: String, limit?: int): String[]',
        arkTsAveragedTime
      );
    })

    // toLowerCase(): String
    it('PerformanceTest_String_toLowerCase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let upper: String = new String("HELLO WORLD");
      let res: String = upper.toLowerCase();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = upper.toLowerCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toLowerCase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toLowerCase',
        'toLowerCase(): String',
        arkTsAveragedTime
      );
    })

    // toUpperCase(): String
    it('PerformanceTest_String_toUpperCase_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = testString.toUpperCase();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toUpperCase();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toUpperCase_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toUpperCase',
        'toUpperCase(): String',
        arkTsAveragedTime
      );
    })

    // trim(): String
    it('PerformanceTest_String_trim_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let spaced: String = new String("  Hello World  ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = spaced.trim();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trim_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trim',
        'trim(): String',
        arkTsAveragedTime
      );
    })

    // trimLeft(): String
    it('PerformanceTest_String_trimLeft_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let spaced: String = new String("  Hello World  ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = spaced.trimLeft();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimLeft_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimLeft',
        'trimLeft(): String',
        arkTsAveragedTime
      );
    })

    // trimRight(): String
    it('PerformanceTest_String_trimRight_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let spaced: String = new String("  Hello World  ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = spaced.trimRight();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimRight_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimRight',
        'trimRight(): String',
        arkTsAveragedTime
      );
    })

    // padLeft(pad: char, count: int): String
    it('PerformanceTest_String_padLeft_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let padChar: char = c'*';
      let res: String = testString.padLeft(padChar, 15);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padLeft(padChar, 15);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padLeft_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padLeft',
        'padLeft(pad: char, count: int): String',
        arkTsAveragedTime
      );
    })

    // padRight(pad: char, count: int): String
    it('PerformanceTest_String_padRight_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let padChar: char = c'*';
      let res: String = testString.padRight(padChar, 15);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padRight(padChar, 15);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padRight_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padRight',
        'padRight(pad: char, count: int): String',
        arkTsAveragedTime
      );
    })

    // repeat(count: int): String
    it('PerformanceTest_String_repeat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("x");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.repeat(3);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_repeat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'repeat',
        'repeat(count: int): String',
        arkTsAveragedTime
      );
    })

    // toString(): String
    it('PerformanceTest_String_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = testString.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toString',
        'toString(): String',
        arkTsAveragedTime
      );
    })

    // at(index: int): string | undefined
    it('PerformanceTest_String_at_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: string | undefined = testString.at(0);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.at(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_at_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'at',
        'at(index: int): string | undefined',
        arkTsAveragedTime
      );
    })

    // anchor(name: String): String
    it('PerformanceTest_String_anchor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let name: String = new String("myAnchor");
      let res: String = testString.anchor(name);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.anchor(name);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_anchor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'anchor',
        'anchor(name: String): String',
        arkTsAveragedTime
      );
    })

    // bold(): String
    it('PerformanceTest_String_bold_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = testString.bold();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.bold();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_bold_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'bold',
        'bold(): String',
        arkTsAveragedTime
      );
    })

    // italics(): String
    it('PerformanceTest_String_italics_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = testString.italics();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.italics();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_italics_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'italics',
        'italics(): String',
        arkTsAveragedTime
      );
    })

    // fixed(): String
    it('PerformanceTest_String_fixed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = "Hello";
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.fixed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fixed_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fixed',
        'fixed(): String',
        arkTsAveragedTime
      );
    })

    // fontcolor(color: String): String
    it('PerformanceTest_String_fontcolor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let color: String = new String("red");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.fontcolor(color);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fontcolor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fontcolor',
        'fontcolor(color: String): String',
        arkTsAveragedTime
      );
    })

    // fontsize(size: int): String
    it('PerformanceTest_String_fontsize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.fontsize(5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fontsize_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fontsize',
        'fontsize(size: int): String',
        arkTsAveragedTime
      );
    })

    // fontsize(size: String): String
    it('PerformanceTest_String_fontsize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.fontsize("5");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fontsize_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fontsize',
        'fontsize(size: String): String',
        arkTsAveragedTime
      );
    })

    // link(link: String): String
    it('PerformanceTest_String_link_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("visit");
      let url: String = new String("https://example.com");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.link(url);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_link_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'link',
        'link(link: String): String',
        arkTsAveragedTime
      );
    })

    // charCodeAt(index: int): int
    it('PerformanceTest_String_charCodeAt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.charCodeAt(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_charCodeAt_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'charCodeAt',
        'charCodeAt(index: int): int',
        arkTsAveragedTime
      );
    })

    // valueOf(): String
    it('PerformanceTest_String_valueOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.valueOf();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_valueOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'valueOf',
        'valueOf(): String',
        arkTsAveragedTime
      );
    })

    // includes(searchString: String, position?: int): boolean
    it('PerformanceTest_String_includes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let searchStr: String = new String("World");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.includes(searchStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_includes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'includes',
        'includes(searchString: String, position?: int): boolean',
        arkTsAveragedTime
      );
    })

    // padEnd(end: int): String
    it('PerformanceTest_String_padEnd_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padEnd(15);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padEnd_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padEnd',
        'padEnd(end: int): String',
        arkTsAveragedTime
      );
    })

    // padEnd(end: int, ch: char): String
    it('PerformanceTest_String_padEnd_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let padChar: char = c'*';
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padEnd(15, padChar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padEnd_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padEnd',
        'padEnd(end: int, ch: char): String',
        arkTsAveragedTime
      );
    })

    // padEnd(end: int, fillString?: String): String
    it('PerformanceTest_String_padEnd_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let fill: String = new String("*-");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padEnd(15, fill);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padEnd_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padEnd',
        'padEnd(end: int, fillString?: String): String',
        arkTsAveragedTime
      );
    })

    // padStart(end: int, ch: char): String
    it('PerformanceTest_String_padStart_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let padChar: char = c'*';
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padStart(15, padChar);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padStart_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padStart',
        'padStart(end: int, ch: char): String',
        arkTsAveragedTime
      );
    })

    // padStart(end: int, fillString?: String): String
    it('PerformanceTest_String_padStart_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let fill: String = new String("*-");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.padStart(15, fill);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_padStart_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'padStart',
        'padStart(end: int, fillString?: String): String',
        arkTsAveragedTime
      );
    })

    // substr(begin: int, length?: int): String
    it('PerformanceTest_String_substr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.substr(3, 5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_substr_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'substr',
        'substr(begin: int, length?: int): String',
        arkTsAveragedTime
      );
    })

    // trimEnd(): String
    it('PerformanceTest_String_trimEnd_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let spaced: String = new String("  Hello World  ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = spaced.trimEnd();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimEnd_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimEnd',
        'trimEnd(): String',
        arkTsAveragedTime
      );
    })

    // trimStart(): String
    it('PerformanceTest_String_trimStart_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let spaced: String = new String("  Hello World  ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = spaced.trimStart();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trimStart_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trimStart',
        'trimStart(): String',
        arkTsAveragedTime
      );
    })

    // slice(begin?: int, end?: int): String
    it('PerformanceTest_String_slice_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.slice(3, 8);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_slice_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'slice',
        'slice(begin?: int, end?: int): String',
        arkTsAveragedTime
      );
    })

    // replace(searchValue: String, replaceValue: String): String
    it('PerformanceTest_String_replace_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let searchStr: String = new String("World");
      let replaceStr: String = new String("Universe");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.replace(searchStr, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replace_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replace',
        'replace(searchValue: String, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // replaceAll(searchValue: String, replaceValue: String): String
    it('PerformanceTest_String_replaceAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testStr: String = new String("Hello Hello Hello");
      let searchStr: String = new String("Hello");
      let replaceStr: String = new String("Hi");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testStr.replaceAll(searchStr, replaceStr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_replaceAll_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'replaceAll',
        'replaceAll(searchValue: String, replaceValue: String): String',
        arkTsAveragedTime
      );
    })

    // normalize(form?: String): String
    it('PerformanceTest_String_normalize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.normalize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_normalize_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'normalize',
        'normalize(form?: String): String',
        arkTsAveragedTime
      );
    })

    // toWellFormed(): string
    it('PerformanceTest_String_toWellFormed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.toWellFormed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_toWellFormed_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'toWellFormed',
        'toWellFormed(): string',
        arkTsAveragedTime
      );
    })

    // isWellFormed(): boolean
    it('PerformanceTest_String_isWellFormed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.isWellFormed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_isWellFormed_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'isWellFormed',
        'isWellFormed(): boolean',
        arkTsAveragedTime
      );
    })

    // isCompressed(): boolean
    it('PerformanceTest_String_isCompressed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.isCompressed();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_isCompressed_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'isCompressed',
        'isCompressed(): boolean',
        arkTsAveragedTime
      );
    })

    // ==================== 静态方法测试 ====================

    // join(strings: String[], delim: String): String
    it('PerformanceTest_String_join_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: String[] = [new String("A"), new String("B"), new String("C")];
      let delim: String = new String(", ");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.join(arr, delim);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_join_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'join',
        'join(strings: String[], delim: String): String',
        arkTsAveragedTime
      );
    })

    // join(strings: String[], delim: String, prefix: String, suffix: String): String
    it('PerformanceTest_String_join_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: String[] = [new String("A"), new String("B"), new String("C")];
      let delim: String = new String(", ");
      let prefix: String = new String("[");
      let suffix: String = new String("]");
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.join(arr, delim, prefix, suffix);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_join_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'join',
        'join(strings: String[], delim: String, prefix: String, suffix: String): String',
        arkTsAveragedTime
      );
    })

    // fromCharCode(code: int): String
    it('PerformanceTest_String_fromCharCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.fromCharCode(65);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fromCharCode_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fromCharCode',
        'fromCharCode(code: int): String',
        arkTsAveragedTime
      );
    })

    // fromCharCode(...codes: int[]): String
    it('PerformanceTest_String_fromCharCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.fromCharCode(65, 66, 67);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fromCharCode_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fromCharCode',
        'fromCharCode(...codes: int[]): String',
        arkTsAveragedTime
      );
    })

    // fromCodePoint(...codePoints: int[]): String
    it('PerformanceTest_String_fromCodePoint_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = String.fromCodePoint(65, 66, 67);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_fromCodePoint_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'fromCodePoint',
        'fromCodePoint(...codePoints: int[]): String',
        arkTsAveragedTime
      );
    })

    // localeCompare(other: String): int
    it('PerformanceTest_String_localeCompare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("hello");
      let other: String = new String("world");
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.localeCompare(other);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_localeCompare_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'localeCompare',
        'localeCompare(other: String): int',
        arkTsAveragedTime
      );
    })

    // contains(str: String, fromIndex: number): boolean
    it('PerformanceTest_String_contains_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("Hello World");
      let searchStr: String = new String("World");
      let fromIdx: number = 6.0;
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.contains(searchStr, fromIdx);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_contains_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'contains',
        'contains(str: String, fromIndex: number): boolean',
        arkTsAveragedTime
      );
    })

    // trim(remove: char[]): String
    it('PerformanceTest_String_trim_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testString: String = new String("xxHelloxx");
      let removeChars: char[] = [c'x', c'o'];
      let res: String = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testString.trim(removeChars);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_String_trim_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt(
        'std.core',
        'String',
        'trim',
        'trim(remove: char[]): String',
        arkTsAveragedTime
      );
    })

  })
}