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
// arktsid: weakmap_constructor_iterable_object_keys
// description: WeakMap constructor adds entries with object keys from the iterable argument
// Conversion notes: dropped the test's WeakMap.prototype.set interception (prototype mutation) — the value behavior
// (entries added from iterable) is verified via get/has.

function main(): void {
    let first: Object = {};
    let second: Object = {};
    let map = new WeakMap<Object, int>([[first, 42], [second, 43]]);
    arktest.assertEQ(map.get(first), 42, 'first object key value');
    arktest.assertEQ(map.get(second), 43, 'second object key value');
    arktest.assertTrue(map.has(first), 'first object key present');
    arktest.assertTrue(map.has(second), 'second object key present');
}