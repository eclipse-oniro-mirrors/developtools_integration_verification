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

// arktsid: weakmap_is_constructor
// description: WeakMap is a constructor — new WeakMap() creates a WeakMap instance

function main(): void {
    // WeakMap can be constructed with new
    let wm: WeakMap<Object, int> = new WeakMap<Object, int>();
    arktest.assertNE(wm, null, 'new WeakMap() creates a non-null WeakMap instance');

    let key: Object = {};
    wm.set(key, 42);
    arktest.assertTrue(wm.has(key), 'WeakMap has entry after set');
}