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


// @Target 用于注解声明，限定该注解可应用的目标类型
@Target({ targets: [AnnotationTargets.CLASS] })
@interface MyClassAnnotation {
  value: string;
}

@Target({ targets: [AnnotationTargets.FUNCTION, AnnotationTargets.CLASS_METHOD] })
@interface MyMethodAnnotation {
  desc: string;
}

// 使用自定义注解的测试类
@MyClassAnnotation({ value: "test" })
class AnnotatedClass {
  @MyMethodAnnotation({ desc: "greet" })
  greet(): string {
    return "hello";
  }
}

export default function TargetPerfTest(): void {
  describe('TargetPerfTest', () => {
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

    // ========== AnnotationTargets 枚举成员访问测试 ==========

    it('PerformanceTest_Target_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.CLASS;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.CLASS;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'CLASS',
        'CLASS: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.ENUMERATION;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.ENUMERATION;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'ENUMERATION',
        'ENUMERATION: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.FUNCTION;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.FUNCTION;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'FUNCTION',
        'FUNCTION: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.FUNCTION_WITH_RECEIVER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.FUNCTION_WITH_RECEIVER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'FUNCTION_WITH_RECEIVER',
        'FUNCTION_WITH_RECEIVER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.INTERFACE;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.INTERFACE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'INTERFACE',
        'INTERFACE: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.NAMESPACE;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.NAMESPACE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'NAMESPACE',
        'NAMESPACE: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.TYPE_ALIAS;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.TYPE_ALIAS;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'TYPE_ALIAS',
        'TYPE_ALIAS: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.VARIABLE;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.VARIABLE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'VARIABLE',
        'VARIABLE: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.CLASS_FIELD;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.CLASS_FIELD;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'CLASS_FIELD',
        'CLASS_FIELD: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.CLASS_METHOD;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.CLASS_METHOD;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'CLASS_METHOD',
        'CLASS_METHOD: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.CLASS_GETTER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.CLASS_GETTER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'CLASS_GETTER',
        'CLASS_GETTER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.CLASS_SETTER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.CLASS_SETTER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'CLASS_SETTER',
        'CLASS_SETTER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.INTERFACE_PROPERTY;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.INTERFACE_PROPERTY;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'INTERFACE_PROPERTY',
        'INTERFACE_PROPERTY: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.INTERFACE_METHOD;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.INTERFACE_METHOD;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'INTERFACE_METHOD',
        'INTERFACE_METHOD: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.INTERFACE_GETTER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.INTERFACE_GETTER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'INTERFACE_GETTER',
        'INTERFACE_GETTER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.INTERFACE_SETTER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.INTERFACE_SETTER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'INTERFACE_SETTER',
        'INTERFACE_SETTER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.LAMBDA;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.LAMBDA;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'LAMBDA',
        'LAMBDA: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.PARAMETER;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.PARAMETER;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'PARAMETER',
        'PARAMETER: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.STRUCT;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.STRUCT;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'STRUCT',
        'STRUCT: AnnotationTargets', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Enum_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: AnnotationTargets = AnnotationTargets.TYPE;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = AnnotationTargets.TYPE;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Enum_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'AnnotationTargets', 'TYPE',
        'TYPE: AnnotationTargets', arkTsAveragedTime);
    })

    // ========== @interface Target 注解使用测试 ==========

    it('PerformanceTest_Target_Annotation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let targets: AnnotationTargets[] = [AnnotationTargets.CLASS];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        targets = [AnnotationTargets.CLASS];
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = targets;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Annotation_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'Target', 'targets',
        'targets: AnnotationTargets[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Target_Annotation_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let targets: AnnotationTargets[] = [AnnotationTargets.CLASS, AnnotationTargets.FUNCTION, AnnotationTargets.INTERFACE];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        targets = [AnnotationTargets.CLASS, AnnotationTargets.FUNCTION, AnnotationTargets.INTERFACE];
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = targets;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Target_Annotation_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.annotations', 'Target', 'targets',
        'targets: AnnotationTargets[] (多元素)', arkTsAveragedTime);
    })


  })
}
