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

// arktsid: typedarray_uint8clamped_is_constructor
// description: Uint8ClampedArray is a constructor — new Uint8ClampedArray() creates a Uint8ClampedArray instance

function main(): void {
    // Uint8ClampedArray can be constructed with new
    let arr: Uint8ClampedArray = new Uint8ClampedArray(4);
    arktest.assertEQ(arr.length, 4, 'new Uint8ClampedArray(4) creates Uint8ClampedArray with length 4');
}