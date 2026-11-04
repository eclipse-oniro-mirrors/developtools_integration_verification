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

// arktsid: typedarray_float32_is_constructor
// description: Float32Array is a constructor — new Float32Array() creates a Float32Array instance

function main(): void {
    // Float32Array can be constructed with new
    let arr: Float32Array = new Float32Array(4);
    arktest.assertEQ(arr.length, 4, 'new Float32Array(4) creates Float32Array with length 4');
}