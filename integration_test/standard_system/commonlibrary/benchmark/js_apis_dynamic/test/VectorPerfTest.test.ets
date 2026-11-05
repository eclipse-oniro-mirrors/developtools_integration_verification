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
  describe, it, TestType, Size, Level, beforeEach, afterAll, expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { Vector } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function VectorPerfTest(): void {
  describe('VectorPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('VectorPerfTest_number_length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      let res = vector.length;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.length;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime =  Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_length_0100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'length',
        'get length(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_Vector_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let res = new Vector<string | number | Array<number>>();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Vector<string | number | Array<number>>();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_Vector_Constructor_0200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'constructor',
        'constructor();', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_boolean_add_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<string | number | Array<number>>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        vectors.push(new Vector<string | number | Array<number>>());
      }
      let res = vectors[0].add(0);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].add(i);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_boolean_add_0300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'add',
        'add(element: T): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_insert_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<string | number | boolean>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<string | number | boolean>();
        v.add(0);
        vectors.push(v);
      }
      let res: void = vectors[0].insert(0, 1);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].insert(0, 1);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_insert_0400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'insert',
        'insert(element: T, index: number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_boolean_has_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<string>();
      vector.add("squirrel");
      let res = vector.has("squirrel");
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.has("squirrel");
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_boolean_has_0500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'has',
        'has(element: T): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getIndexOf_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(2);
      vector.add(1);
      vector.add(2);
      vector.add(4);
      let res = vector.getIndexOf(2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getIndexOf(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getIndexOf_0600: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getIndexOf',
        'getIndexOf(element: T): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_removeByIndex_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let vector = new Vector<number>();
        vector.add(0);
        vector.add(1);
        vectors.push(vector);
      }
      let res = vectors[0].get(1);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].removeByIndex(1);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_removeByIndex_0700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'removeByIndex',
        'removeByIndex(index: number): T;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_boolean_remove_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let vector = new Vector<number>();
        vector.add(2);
        vector.add(4);
        vectors.push(vector);
      }
      let res = vectors[0].has(2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].remove(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_boolean_remove_0800: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'remove',
        'remove(element: T): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_removeByRange_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let vector = new Vector<number>();
        vector.add(0);
        vector.add(1);
        vector.add(2);
        vectors.push(vector);
      }
      let res: void = vectors[0].removeByRange(1, 2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].removeByRange(1, 2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_removeByRange_0900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'removeByRange',
        'removeByRange(fromIndex: number, toIndex: number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_replaceAllElements_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let cb = (value: number): number => {
        return value;
      };
      let res = vectors[0].replaceAllElements(cb);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].replaceAllElements(cb);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_replaceAllElements_1000: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'replaceAllElements',
        'replaceAllElements(callbackFn: (value: T, index?: number, vector?: Vector<T>) => T, thisArg?: Object): void;',
        arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_forEach_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let cb = (value: number, index?: number): void => {};
      let res = vector.forEach(cb);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.forEach(cb);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_forEach_1100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'forEach',
        'forEach(callbackFn: (value: T, index?: number, vector?: Vector<T>) => void, thisArg?: Object): void;',
        arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_sort_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let res = vectors[0].sort((a: number, b: number) => a - b);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].sort((a: number, b: number) => a - b);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_sort_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'sort',
        'sort(comparator?: (firstValue: T, secondValue: T) => number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_Vector_subVector_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      vector.add(6);
      vector.add(8);
      let res = vector.subVector(0, 4);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.subVector(0, 4);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_Vector_subVector_1300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'subVector',
        'subVector(fromIndex: number, toIndex: number): Vector<T>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_clear_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        let vector = new Vector<number>();
        vector.add(2);
        vector.add(4);
        vectors.push(vector);
      }
      let res = vectors[0].clear();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].clear();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_clear_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'clear', 'clear(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_Vector_clone_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.clone();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.clone();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_Vector_clone_1500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'clone', 'clone(): Vector<T>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getCapacity_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.getCapacity();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getCapacity();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getCapacity_1600: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getCapacity',
        'getCapacity(): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_Array_convertToArray_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.convertToArray();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.convertToArray();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_Array_convertToArray_1700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'convertToArray',
        'convertToArray(): Array<T>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_boolean_isEmpty_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.isEmpty();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.isEmpty();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_boolean_isEmpty_1700: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'isEmpty',
        'isEmpty(): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_increaseCapacityTo_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let res = vectors[0].increaseCapacityTo(12);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].increaseCapacityTo(12);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_increaseCapacityTo_1800: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'increaseCapacityTo',
        'increaseCapacityTo(newCapacity: number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_trimToCurrentLength_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let res = vectors[0].trimToCurrentLength();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].trimToCurrentLength();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_trimToCurrentLength_1900: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'trimToCurrentLength',
        'trimToCurrentLength(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_string_toString_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.toString();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_string_toString_2000: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_copyToArray_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let targetArray: Array<number> = new Array<number>(4);
      let res = vector.copyToArray(targetArray);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.copyToArray(targetArray);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_copyToArray_2100: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'copyToArray',
        'copyToArray(array: Array<T>): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getFirstElement_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.getFirstElement();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getFirstElement();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getFirstElement_2200: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getFirstElement',
        'getFirstElement(): T;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getLastElement_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.getLastElement();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getLastElement();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getLastElement_2300: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getLastElement',
        'getLastElement(): T;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getLastIndexFrom_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.getLastIndexFrom(4, 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getLastIndexFrom(4, 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getLastIndexFrom_2400: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getLastIndexFrom',
        'getLastIndexFrom(element: T, index: number): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_getIndexFrom_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.getIndexFrom(4, 3);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.getIndexFrom(4, 3);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_getIndexFrom_2500: ' +
        arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'getIndexFrom',
        'getIndexFrom(element: T, index: number): number;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_void_setLength_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let res = vectors[0].setLength(8);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].setLength(8);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_void_setLength_2600: ' + arkTsAveragedTime +
        'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'setLength',
        'setLength(newSize: number): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_get_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector.get(2);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector.get(2);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_get_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'get',
        'get(index: number): T;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_number_set_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vectors: Vector<number>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let v = new Vector<number>();
        v.add(2);
        v.add(4);
        v.add(5);
        v.add(4);
        vectors.push(v);
      }
      let res = vectors[0].set(2, 10);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vectors[i].set(2, 10);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_number_set_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'set',
        'set(index: number, element: T): T;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('VectorPerfTest_Vector_iterator_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let vector = new Vector<number>();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      let res = vector[Symbol.iterator]();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = vector[Symbol.iterator]();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info(
        'arkTsVectorPerfTest arkTsAveragedTime VectorPerfTest_Vector_iterator_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.vector', 'Vector', 'Symbol.iterator',
        '[Symbol.iterator](): IterableIterator<T>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })
  })
}