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

// arktsid: typedarray_int16_is_constructor
// description: Int16Array is a constructor — new Int16Array() creates an Int16Array instance

function main(): void {
    // Int16Array can be constructed with new
    let arr: Int16Array = new Int16Array(4);
    arktest.assertEQ(arr.length, 4, 'new Int16Array(4) creates Int16Array with length 4');
}