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

class MyClass {
    num: int = 1;
    name: string = "test";
}

export default function FieldPerfTest(): void {
  describe('FieldPerfTest', () => {
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


    it('PerformanceTest_Field_getType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let classType: ClassType = Type.of(new MyClass()) as ClassType;
        let fieldNum: Field = classType.getField(0); 
        let res: Type = fieldNum.getType();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            res = fieldNum.getType()
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getType_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getType',
            'getType(): Type', arkTsAveragedTime);
    })

    it('PerformanceTest_Field_getOwnerType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: Type = field.getOwnerType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.getOwnerType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getOwnerType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getOwnerType',
        'getOwnerType(): Type', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: String = field.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getName',
        'getName(): String', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_getAttributes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: int = field.getAttributes();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.getAttributes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getAttributes_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getAttributes',
        'getAttributes(): int', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_getAccessModifier_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0);
      let res = field.getAccessModifier();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.getAccessModifier();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getAccessModifier_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getAccessModifier',
        'getAccessModifier(): byte', arkTsAveragedTime);
    })


    // it('PerformanceTest_Field_getStaticValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let classType: ClassType = Type.of(new MyClass()) as ClassType;
    //   let field: Field = classType.getField(0); 
    //   let res: Any = field.getStaticValue();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = field.getStaticValue();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_getStaticValue_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'getStaticValue',
    //     'getStaticValue(): Any', arkTsAveragedTime);
    // })


    // it('PerformanceTest_Field_setStaticValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let classType: ClassType = Type.of(new MyClass()) as ClassType;
    //   let field: Field = classType.getField(0); 
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     field.setStaticValue(200);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_setStaticValue_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'setStaticValue',
    //     'setStaticValue(v: Any): void', arkTsAveragedTime);
    // })


    it('PerformanceTest_Field_isStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: boolean = field.isStatic();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.isStatic();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_isStatic_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'isStatic',
        'isStatic(): boolean', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_isReadonly_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: boolean = field.isReadonly();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.isReadonly();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_isReadonly_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'isReadonly',
        'isReadonly(): boolean', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field: Field = classType.getField(0); 
      let res: string = field.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_toString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'toString',
        'toString(): string', arkTsAveragedTime);
    })


    it('PerformanceTest_Field_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let classType: ClassType = Type.of(new MyClass()) as ClassType;
      let field1: Field = classType.getField(0); 
      let field2: Field = classType.getField(0);
      let res: boolean = field1.equals(field2);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field1.equals(field2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Field_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Field', 'equals',
        'equals(oth: Any): boolean', arkTsAveragedTime);
    })

  })
}
