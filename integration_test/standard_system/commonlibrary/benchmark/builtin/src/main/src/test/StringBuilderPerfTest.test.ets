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

const BASE_COUNT = 50000;
const UNIT_TIME = 1000000;

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

function createStringValue(value: string): String {
  return new String(value);
}

function createFixedCharArray(): FixedArray<char> {
  return [c'a', c'a', c'a'] as FixedArray<char>;
}

function createCharArray(): char[] {
  return [c'a', c'b', c'c'] as char[];
}

function createValueArrayChar(): ValueArray<char> {
  let arr: ValueArray<char> = GC.allocatePinnedCharArray(3);
  arr[0] = c'a';
  arr[1] = c'b';
  arr[2] = c'c';
  return arr;
}

function createObjectValue(): Object {
  return new Object();
}

function createBuilderWithTestString(): StringBuilder {
  let sb = new StringBuilder();
  sb.append(createStringValue("test"));
  return sb;
}

export default function StringBuilderPerfTest(): void {
  describe('StringBuilderPerfTest', () => {

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_StringBuilder_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result = new StringBuilder();

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringBuilder();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder constructor: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'constructor',
          'constructor()', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fromChars: FixedArray<char> = createFixedCharArray();
        let result = new StringBuilder(fromChars);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringBuilder(fromChars);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder constructor: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'constructor',
          'constructor(fromChars: FixedArray<char>)', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_constructor_0250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fromChars: ValueArray<char> = createValueArrayChar();
        let result = new StringBuilder(fromChars);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringBuilder(fromChars);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder constructor: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'constructor',
          'constructor(fromChars: ValueArray<char>)', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_constructor_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let fromChars: char[] = createCharArray();
        let result = new StringBuilder(fromChars);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringBuilder(fromChars);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder constructor: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'constructor',
          'constructor(fromChars: char[])', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_constructor_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testStr: String = createStringValue("test");
        let result = new StringBuilder(testStr);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StringBuilder(testStr);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder constructor: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'constructor',
          'constructor(s: String)', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_stringLength_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let sb: StringBuilder = createBuilderWithTestString();
        let result: int = sb.stringLength;

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = sb.stringLength;
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder stringLength: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'stringLength',
          'get stringLength(): int', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_concatStrings_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let lhs: String = createStringValue("Hello");
        let rhs: String = createStringValue("World");
        let result: String = StringBuilder.concatStrings(lhs, rhs);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.concatStrings(lhs, rhs);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder concatStrings: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'concatStrings',
          'static concatStrings(lhs: String, rhs: String): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testStr: String = createStringValue("test");
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testStr);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testStr);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(s: String): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: boolean = true;
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: boolean): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: byte = toByteValue(127);
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: byte): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: char = c'a';
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: char): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: short = toShortValue(32767);
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: short): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: int = 2147483647;
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: int): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: long = toLongValue(123456789);
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: long): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: float = toFloatValue(3.14159);
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: float): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: double = 3.141592653589793;
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(i: double): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_append_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testObj: Object = createObjectValue();
        let pool: StringBuilder[] = new Array<StringBuilder>();
        for (let j = 0; j < BASE_COUNT; j++) {
          pool[j] = new StringBuilder();
        }
        let result: StringBuilder = new StringBuilder().append(testObj);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = pool[i].append(testObj);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder append: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'append',
          'append(o: Object): StringBuilder', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let sb: StringBuilder = createBuilderWithTestString();
        let result: String = sb.toString();

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = sb.toString();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'override toString(): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: boolean = true;
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: boolean): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: byte = toByteValue(127);
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: byte): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: char = c'a';
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: char): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: short = toShortValue(32767);
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: short): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: int = 2147483647;
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: int): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: long = toLongValue(123456789);
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(i: long): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: float = toFloatValue(3.14159);
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(f: float): String', arkTsAveragedTime);
      });

    it('PerformanceTest_StringBuilder_toString_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let testValue: double = 3.141592653589793;
        let result: String = StringBuilder.toString(testValue);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          result = StringBuilder.toString(testValue);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest StringBuilder toString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'StringBuilder', 'toString',
          'static toString(d: double): String', arkTsAveragedTime);
      });
  });
}
