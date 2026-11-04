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

// arktsid: isarray_array_like_object
// description: Array.isArray returns false for non-array objects (plain Object)

function main(): void {
    // Array.isArray returns false for any non-array object
    let obj: Object = {};
    arktest.assertEQ(Array.isArray(obj), false,
        'Array.isArray on plain Object returns false');

    // Also false for a number
    arktest.assertEQ(Array.isArray(42), false,
        'Array.isArray on number returns false');
}