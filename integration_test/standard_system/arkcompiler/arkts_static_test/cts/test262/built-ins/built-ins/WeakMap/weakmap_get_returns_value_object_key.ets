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

// arktsid: weakmap_get_returns_value_object_key
// description: WeakMap.get returns value for Object key
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let map = new WeakMap<Object, int>();
    let foo: Object = {};
    let bar: Object = {};
    map.set(foo, 0);
    map.set(bar, 42);
    arktest.assertEQ(map.get(foo), 0, 'get foo');
    arktest.assertEQ(map.get(bar), 42, 'get bar');
}