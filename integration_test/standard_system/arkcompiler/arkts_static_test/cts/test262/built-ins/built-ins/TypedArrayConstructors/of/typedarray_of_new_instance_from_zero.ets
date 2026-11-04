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

// arktsid: typedarray_of_new_instance_from_zero
// description: TypedArray.of(-0, 0) normalizes -0 to 0 for integer types
// Conversion notes: ArkTS int has no -0; -0 normalizes to 0.

function main(): void {
    let a = Int32Array.of(-0, 0);
    arktest.assertEQ(a.length, 2, 'length');
    arktest.assertEQ(a[0], 0, 'elem 0');
    arktest.assertEQ(a[1], 0, 'elem 1');
}