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

// arktsid: isarray_returns_false_primitives
// description: Array.isArray return false if its argument is not an Array

function main(): void {
    arktest.assertEQ(Array.isArray(42), false, 'Array.isArray(42) must return false');
    arktest.assertEQ(Array.isArray(true), false, 'Array.isArray(true) must return false');
    arktest.assertEQ(Array.isArray('abc'), false, "Array.isArray('abc') must return false");
    arktest.assertEQ(Array.isArray(null), false, 'Array.isArray(null) must return false');
}