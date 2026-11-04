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
// description: `unicodeSets` accessor function invoked on a RegExp instance

function main(): void {
    arktest.assertFalse(new RegExp('.', '').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'd').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'g').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'i').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'm').unicodeSets);
    arktest.assertFalse(new RegExp('.', 's').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'u').unicodeSets);
    arktest.assertFalse(new RegExp('.', 'y').unicodeSets);

    arktest.assertTrue(new RegExp('.', 'v').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vd').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vg').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vi').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vm').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vs').unicodeSets);
    arktest.assertTrue(new RegExp('.', 'vy').unicodeSets);
}