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

export default function MapPerfTest(): void {
  describe('MapPerfTest', () => {
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

    it('PerformanceTest_Map_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let b = new Map<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = new Map<string, object>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'constructor',
        'constructor()', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_Constructor_InitialCapacity_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let b = new Map<string, object>(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = new Map<string, object>(10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Constructor_InitialCapacity_0110: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'constructor',
        'constructor(initialCapacity: int)', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_set_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.set("a", 1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_set_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'set',
        'set(key: K, val: V)', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_get_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      map.set("a", 1);
      let result = map.get("a");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.get("a");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_get_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'get',
        'get(key: K)', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_has_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      map.set("a", 1);
      let result = map.has("a");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.has("a");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_has_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'has',
        'has(key: K)', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_delete_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maps: Map<string, object>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let m = new Map<string, object>();
        m.set("a", 1);
        maps.push(m);
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = maps[i].delete("a");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_delete_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'delete',
        'delete(key: K)', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_clear_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.clear();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_clear_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'clear',
        'clear()', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_size_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let s = map.size;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        s = map.size;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = s;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_size_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'size',
        'size(): int', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_keys_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let result = map.keys();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.keys();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_keys_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'keys',
        'keys(): IterableIterator<K>', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_values_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let result = map.values();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.values();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_values_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'values',
        'values(): IterableIterator<V>', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_entries_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let result = map.entries();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.entries();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_entries_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'entries',
        'entries(): IterableIterator<[K,V]>', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_forEach_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map.forEach(() => {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_forEach_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'forEach',
        'forEach(callbackfn: Function): void', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_keySet_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
	  let map = new Map<string, object>();
      let result = map.keySet();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.keySet();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_keySet_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'keySet',
        'keySet(): Set<K>', arkTsAveragedTime);
    });

    it('PerformanceTest_Map_toString_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
	  let map = new Map<string, object>();
	  let result = map.toString();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_toString_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'toString',
        'toString(): String', arkTsAveragedTime);
    });


    it('PerformanceTest_Map_Constructor_Array_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = new Array<[string, object]>();
      let map = new Map<string, object>(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new Map<string, object>(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Constructor_Array_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'constructor', 'constructor(entries: Array<[K,V]>)', arkTsAveragedTime);
    });


    it('PerformanceTest_Map_Constructor_Map_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let temp = new Map<string, object>();
      let map = new Map<string, object>(temp);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        map = new Map<string, object>(temp);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = map;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Constructor_Map_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'constructor', 'constructor(map: Map<K,V>)', arkTsAveragedTime);
    });


    it('PerformanceTest_Map_get_Default_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map = new Map<string, object>();
      let defaultValue: object = {};
      let result = map.get("key", defaultValue);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.get("key", defaultValue);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_get_Default_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', 'get', 'get(key: K, def: V): V', arkTsAveragedTime);
    });


    it('PerformanceTest_Map_Iterator_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
	  let map = new Map<string, object>();
	  let result = map.$_iterator();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = map.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Iterator_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Map', '$_iterator', '$_iterator(): IterableIterator<[K,V]>', arkTsAveragedTime);
    });


    it('PerformanceTest_Record_Constructor_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rec = new Record<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        rec = new Record<string, object>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = rec;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Record_Constructor_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Record', 'constructor', 'constructor()', arkTsAveragedTime);
    });


    it('PerformanceTest_Record__get_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rec = new Record<string, object>();
	  let result = rec.$_get("key");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = rec.$_get("key");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Record__get_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Record', '$_get', '$_get(k: K): V | undefined', arkTsAveragedTime);
    });


    it('PerformanceTest_Record__set_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rec = new Record<string, object>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        rec.$_set("key", {});
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = rec;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Record__set_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Record', '$_set', '$_set(k: K, v: V): void', arkTsAveragedTime);
    });


    it('PerformanceTest_Map_Constructor_FixedArray_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pair1: [string, object] = ['key1', new Object() as object];
        let pair2: [string, object] = ['key2', new Object() as object];
        let values: FixedArray<[string, object]> = [pair1, pair2] as FixedArray<[string, object]>;

        let m: Map<string, object> = new Map<string, object>(values);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          m = new Map<string, object>(values);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = m;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Map_Constructor_FixedArray_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Map',
          'constructor',
          'constructor(values: FixedArray<[K,V]>)',
          arkTsAveragedTime
        );
      });

  })
}
