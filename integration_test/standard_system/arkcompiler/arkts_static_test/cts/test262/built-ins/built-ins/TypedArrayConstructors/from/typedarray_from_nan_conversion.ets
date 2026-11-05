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

// arktsid: typedarray_from_nan_conversion
// description: TypedArray.from converts NaN to 0 for integer types, preserves NaN for float types
// Conversion notes: JS undefined-element case dropped (not typeable as number).

function main(): void {
    arktest.assertEQ(Int32Array.from([NaN])[0], 0, 'Int32 from(NaN) => 0');
    arktest.assertTrue(isNaN(Float64Array.from([NaN])[0]!.valueOf()), 'Float64 from(NaN) is NaN');
}