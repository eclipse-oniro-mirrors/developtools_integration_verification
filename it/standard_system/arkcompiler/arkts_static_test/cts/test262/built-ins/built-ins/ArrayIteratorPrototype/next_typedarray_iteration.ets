/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: next_typedarray_iteration
// description: TypedArray (Int32Array) iterator .next() visits each element in order and sets done when exhausted;
// repeated next() stays done
// Conversion notes: array[Symbol.iterator]() replaced with array.values(); Int32Array used as representative for all 9
// TypedArray variants (Float32/Float64/Int8/Int16/Int32/Uint8/Uint16/Uint32/Uint8Clamped) which test identical
// iteration
// behavior.

function main(): void {
    let array: Int32Array = new Int32Array([3, 1, 2]);
    let it: IterableIterator<number> = array.values();
    let r1: IteratorResult<number> = it.next();
    arktest.assertTrue(r1.value === 3);
    arktest.assertTrue(r1.done === false);
    let r2: IteratorResult<number> = it.next();
    arktest.assertTrue(r2.value === 1);
    arktest.assertTrue(r2.done === false);
    let r3: IteratorResult<number> = it.next();
    arktest.assertTrue(r3.value === 2);
    arktest.assertTrue(r3.done === false);
    let r4: IteratorResult<number> = it.next();
    arktest.assertTrue(r4.value === undefined);
    arktest.assertTrue(r4.done === true);
    let r5: IteratorResult<number> = it.next();
    arktest.assertTrue(r5.value === undefined);
    arktest.assertTrue(r5.done === true);
}