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
// arktsid: weakmap_delete_primitive_key_returns_false
// description: WeakMap.delete returns false for primitive keys that cannot be held weakly
// Conversion notes: null/undefined/symbol variants dropped — null/undefined are not assignable to the Object key type
// in
// ArkTS and Symbol is unsupported.

function main(): void {
    let map = new WeakMap<Object, string>();
    arktest.assertTrue(map.delete(1) === false, 'delete int key returns false');
    arktest.assertTrue(map.delete('') === false, 'delete string key returns false');
    arktest.assertTrue(map.delete(NaN) === false, 'delete NaN key returns false');
    arktest.assertTrue(map.delete(true) === false, 'delete boolean key returns false');
}