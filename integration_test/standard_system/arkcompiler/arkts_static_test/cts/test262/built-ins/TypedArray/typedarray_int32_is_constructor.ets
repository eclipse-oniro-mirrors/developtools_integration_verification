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

// arktsid: typedarray_int32_is_constructor
// description: Int32Array is a constructor — new Int32Array() creates an Int32Array instance

function main(): void {
    // Int32Array can be constructed with new
    let arr: Int32Array = new Int32Array(4);
    arktest.assertEQ(arr.length, 4, 'new Int32Array(4) creates Int32Array with length 4');
}