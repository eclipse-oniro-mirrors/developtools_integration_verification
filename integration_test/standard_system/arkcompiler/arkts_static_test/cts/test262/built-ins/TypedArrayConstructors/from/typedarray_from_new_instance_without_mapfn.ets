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

// arktsid: typedarray_from_new_instance_without_mapfn
// description: TypedArray.from(src) copies the source elements
// Conversion notes: Int32Array used.

function main(): void {
    let a = Int32Array.from([42, 43, 42]);
    arktest.assertEQ(a.length, 3, 'length');
    arktest.assertEQ(a[0], 42, 'elem 0');
    arktest.assertEQ(a[1], 43, 'elem 1');
    arktest.assertEQ(a[2], 42, 'elem 2');
}