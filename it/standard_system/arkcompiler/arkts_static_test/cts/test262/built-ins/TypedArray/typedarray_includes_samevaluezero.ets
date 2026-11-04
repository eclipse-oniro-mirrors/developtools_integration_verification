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

// arktsid: typedarray_includes_samevaluezero
// description: includes compares the search element using SameValueZero (-0 matches 0, NaN matches NaN)
// Conversion notes: JS coercion cases (string/bool/null search elements) dropped; only SameValueZero -0/NaN semantics
// retained.

function main(): void {
    let i32 = new Int32Array(2);
    i32[0] = 42; i32[1] = 0;
    arktest.assertTrue(i32.includes(0), 'Int32Array includes 0');
    arktest.assertTrue(i32.includes(-0), 'Int32Array includes -0 (SameValueZero)');
    arktest.assertFalse(i32.includes(NaN), 'Int32Array includes NaN false');
    let f64 = new Float64Array(3);
    f64[0] = 42; f64[1] = 0; f64[2] = NaN;
    arktest.assertTrue(f64.includes(NaN), 'Float64Array includes NaN (SameValueZero)');
    arktest.assertTrue(f64.includes(-0), 'Float64Array includes -0');
}