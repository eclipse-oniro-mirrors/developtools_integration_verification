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
// description: `unicode` accessor function invoked on a RegExp instance

function main(): void {
    arktest.assertFalse(new RegExp('.', '').unicode);
    arktest.assertFalse(new RegExp('.', 'i').unicode);
    arktest.assertFalse(new RegExp('.', 'g').unicode);
    arktest.assertFalse(new RegExp('.', 'gi').unicode);

    arktest.assertTrue(new RegExp('.', 'u').unicode);
    arktest.assertTrue(new RegExp('.', 'iu').unicode);
    arktest.assertTrue(new RegExp('.', 'ug').unicode);
    arktest.assertTrue(new RegExp('.', 'iug').unicode);
}