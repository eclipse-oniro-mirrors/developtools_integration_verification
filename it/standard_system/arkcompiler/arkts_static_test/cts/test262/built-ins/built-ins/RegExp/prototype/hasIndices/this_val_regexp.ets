/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: this_val_regexp
// description: `hasIndices` accessor function invoked on a RegExp instance

function main(): void {
    arktest.assertFalse(new RegExp('.', '').hasIndices);
    arktest.assertFalse(new RegExp('.', 'i').hasIndices);
    arktest.assertFalse(new RegExp('.', 'g').hasIndices);
    arktest.assertFalse(new RegExp('.', 'y').hasIndices);
    arktest.assertFalse(new RegExp('.', 'm').hasIndices);
    arktest.assertFalse(new RegExp('.', 's').hasIndices);
    arktest.assertFalse(new RegExp('.', 'u').hasIndices);

    arktest.assertTrue(new RegExp('.', 'd').hasIndices);
    arktest.assertTrue(new RegExp('.', 'di').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dg').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dy').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dm').hasIndices);
    arktest.assertTrue(new RegExp('.', 'ds').hasIndices);
    arktest.assertTrue(new RegExp('.', 'du').hasIndices);

    arktest.assertFalse(new RegExp('.', '').hasIndices);
    arktest.assertFalse(new RegExp('.', 'i').hasIndices);
    arktest.assertFalse(new RegExp('.', 'g').hasIndices);
    arktest.assertFalse(new RegExp('.', 'y').hasIndices);
    arktest.assertFalse(new RegExp('.', 'm').hasIndices);
    arktest.assertFalse(new RegExp('.', 's').hasIndices);
    arktest.assertFalse(new RegExp('.', 'u').hasIndices);

    arktest.assertTrue(new RegExp('.', 'd').hasIndices);
    arktest.assertTrue(new RegExp('.', 'di').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dg').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dy').hasIndices);
    arktest.assertTrue(new RegExp('.', 'dm').hasIndices);
    arktest.assertTrue(new RegExp('.', 'ds').hasIndices);
    arktest.assertTrue(new RegExp('.', 'du').hasIndices);
}