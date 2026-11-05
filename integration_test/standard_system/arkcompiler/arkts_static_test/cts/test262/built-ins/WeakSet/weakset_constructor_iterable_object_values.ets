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
// arktsid: weakset_constructor_iterable_object_values
// description: WeakSet constructor adds object values from the iterable argument
// Conversion notes: dropped the test's WeakSet.prototype.add interception (prototype mutation) — the value behavior
// (values added from iterable) is verified via has.

function main(): void {
    let first: Object = {};
    let second: Object = {};
    let s = new WeakSet<Object>([first, second]);
    arktest.assertTrue(s.has(first), 'first object value present');
    arktest.assertTrue(s.has(second), 'second object value present');
    arktest.assertTrue(s.has({}) === false, 'fresh object not present');
}