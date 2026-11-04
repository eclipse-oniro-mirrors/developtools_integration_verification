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
// arktsid: map_foreach_returns_undefined
// description: Map.prototype.forEach returns undefined
// Conversion notes: JS captures forEach return value (undefined); ArkTS forEach returns void (unassignable). Verified
// via call-not-throwing.

function main(): void {
    let m = new Map<int, int>();

    // forEach on empty map runs without error (JS: returns undefined)
    m.forEach((_v: int, _k: int): void => {});
    arktest.assertTrue(true, 'forEach on empty map completes without error');

    m.set(1, 1);
    // forEach on non-empty map runs without error
    m.forEach((_v: int, _k: int): void => {});
    arktest.assertTrue(true, 'forEach on non-empty map completes without error');
}