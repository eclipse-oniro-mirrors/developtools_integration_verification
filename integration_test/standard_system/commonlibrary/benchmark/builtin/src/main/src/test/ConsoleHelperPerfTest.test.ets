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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

// 自定义测试类
class TestObject {
  name: string = "test";
  value: int = 123;
}

class Point2D {
  x: int = 1;
  y: int = 2;
}

class Point3D {
  x: int = 1;
  y: int = 2;
  z: int = 3;
}

export default function ConsoleHelperPerfTest(): void {
  describe('ConsoleHelperPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;
    // buffer.from
    const BASE_COUNT_MIX = 100;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ========== Formatter.format 基础类型测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%%", new Array<Any>(0));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%% escape)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%s", new Array<Any>(["hello"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%s)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%d", new Array<Any>([123]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%d)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%i", new Array<Any>([456]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%i)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%f", new Array<Any>([3.14159]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%f)', arkTsAveragedTime);
    })

    // ========== Formatter.format 混合参数测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("User: %s, Age: %d", new Array<Any>(["张三", 25]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (mixed)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("Score: %d, Name: %s, Rate: %f", new Array<Any>([90, "李四", 4.5]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (three args)', arkTsAveragedTime);
    })

    // ========== Formatter.format JSON格式化测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let obj: TestObject = new TestObject();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%j", new Array<Any>([obj]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%j)', arkTsAveragedTime);
    })

    // ========== Formatter.format 对象格式化测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let obj: Point2D = new Point2D();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%o", new Array<Any>([obj]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%o)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let obj: Point3D = new Point3D();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%O", new Array<Any>([obj]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%O)', arkTsAveragedTime);
    })

    // ========== Formatter.format 额外参数测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("Hello %s", new Array<Any>(["World", "Extra"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (extra args)', arkTsAveragedTime);
    })

    // ========== Formatter.format %c格式测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%c", new Array<Any>(["char"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (%c)', arkTsAveragedTime);
    })

    // ========== Formatter.format 空字符串测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("", new Array<Any>(["test"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (empty format)', arkTsAveragedTime);
    })

    // ========== Formatter.format BigInt测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let bigInt: BigInt = 123456789n;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%s", new Array<Any>([bigInt]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (BigInt)', arkTsAveragedTime);
    })

    // ========== Formatter.format null/undefined测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%s", new Array<Any>([null]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (null)', arkTsAveragedTime);
    })

    it('PerformanceTest_ConsoleHelper_Format_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%s", new Array<Any>([undefined]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (undefined)', arkTsAveragedTime);
    })

    // ========== Formatter.format 连续格式说明符测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("%s%d%s", new Array<Any>(["name", 100, "end"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (consecutive flags %s%d%s)', arkTsAveragedTime);
    })

    // ========== Formatter.format 带转义字符测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("Hello\nWorld", new Array<Any>(["test"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (escape char)', arkTsAveragedTime);
    })

    // ========== Formatter.format 带空格格式测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("% s", new Array<Any>(["space"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (space flag % s)', arkTsAveragedTime);
    })

    // ========== Formatter.format 连续百分号测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("100%%%", new Array<Any>(["test"]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (consecutive %%%)', arkTsAveragedTime);
    })

    // ========== Formatter.format 无效格式说明符测试 ==========
    it('PerformanceTest_ConsoleHelper_Format_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let formatter: Formatter = new Formatter();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format("value: %x", new Array<Any>([255]));
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConsoleHelper_Format_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ConsoleHelper', 'format',
        'function format(s: string, args: Array<Any>): string (invalid flag %x)', arkTsAveragedTime);
    })

  })
}
