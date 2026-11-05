'use static'
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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";
import performance from './Performance.util';
import { util } from '@kit.ArkTS';
interface Person {
  name: string;
  age: number;
}
class ChildLRUCache extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  createDefault(key: int): int {
    return key;
  }
}
class Temperature implements util.ScopeComparable<Temperature> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: Temperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export default function UtilPerfTest01(): void {
  describe('UtilPerfTest01', (): void => {
    const BASE_COUNT = 1000;
    beforeEach((): void => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll((): void => {
      performance.save('apiPerformance.txt');
    });

    it('UtilPerfTest01_string_format_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let name = 'John';
      let age = 20;
      let res = util.format('My name is %s and I am %s years old', name, age);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.format('My name is %s and I am %s years old', name, age);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_string_format_0100: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'format',
        'format(format: string, ...args: Object[]): string', arkTsAveragedTime);
    });

    it('UtilPerfTest01_string_errnoToString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errnum = -1;
      let res = util.errnoToString(errnum);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.errnoToString(errnum);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_string_errnoToString_0200: ' + arkTsAveragedTime +
        'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'errnoToString',
        'errnoToString(errno: number): string', arkTsAveragedTime);
    });

    it('UtilPerfTest01_Function_callbackWrapper_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let fn = async (): Promise<string> =>{
        return 'hello world';
      }
      let res = util.callbackWrapper(fn);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.callbackWrapper(fn);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Function_callbackWrapper_0300: ' +
        arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'callbackWrapper',
        'callbackWrapper(original: Function): (err: Object, value: Object) => void', arkTsAveragedTime);
    });

    it('UtilPerfTest01_Function_promisify_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let func: Function = (val: Object, callback: (err: Error | null, ...value: Object[]) => void) => {
        callback(null, val);
      };
      let res = util.promisify(func);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.promisify(func);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Function_promisify_0400: ' + arkTsAveragedTime +
        'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'promisify',
        'promisify(original: Function): PromisifiedFunc', arkTsAveragedTime);
    });

    it('UtilPerfTest01_string_generateRandomUUID_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res = util.generateRandomUUID(true);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.generateRandomUUID(true);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_string_generateRandomUUID_0500: ' +
        arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'generateRandomUUID',
        'generateRandomUUID(entropyCache?: boolean): string', arkTsAveragedTime);
    });

    it('UtilPerfTest01_Uint8Array_generateRandomBinaryUUID_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
      let res = util.generateRandomBinaryUUID(true);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.generateRandomBinaryUUID(true);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_generateRandomBinaryUUID_0600: ' +
        arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'generateRandomBinaryUUID',
        'generateRandomBinaryUUID(entropyCache?: boolean): Uint8Array', arkTsAveragedTime);
    });

    it('UtilPerfTest01_Uint8Array_parseUUID_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_Uint8Array_parseUUID_0700: ' + arkTsAveragedTime
        + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'parseUUID',
        'parseUUID(uuid: string): Uint8Array', arkTsAveragedTime);
    });

    it('UtilPerfTest01_number_getHash_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let obj: Person = { name: 'Jack', age: 20 };
      let res = util.getHash(obj);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = util.getHash(obj);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest01 arkTsAveragedTime UtilPerfTest01_number_getHash_0800: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'getHash',
        'getHash(object: object): number', arkTsAveragedTime);
    });
  });
}
