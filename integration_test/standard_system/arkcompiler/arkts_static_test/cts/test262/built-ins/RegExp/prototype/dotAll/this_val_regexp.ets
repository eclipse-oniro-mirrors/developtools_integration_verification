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
// description: dotAll accessor function invoked on a RegExp instance

function main(): void {
    arktest.assertFalse(new RegExp('.', '').dotAll);
    arktest.assertFalse(new RegExp('.', 'i').dotAll);
    arktest.assertFalse(new RegExp('.', 'g').dotAll);
    arktest.assertFalse(new RegExp('.', 'y').dotAll);
    arktest.assertFalse(new RegExp('.', 'm').dotAll);

    arktest.assertTrue(new RegExp('.', 's').dotAll);
    arktest.assertTrue(new RegExp('.', 'is').dotAll);
    arktest.assertTrue(new RegExp('.', 'sg').dotAll);
    arktest.assertTrue(new RegExp('.', 'sy').dotAll);
    arktest.assertTrue(new RegExp('.', 'ms').dotAll);
}