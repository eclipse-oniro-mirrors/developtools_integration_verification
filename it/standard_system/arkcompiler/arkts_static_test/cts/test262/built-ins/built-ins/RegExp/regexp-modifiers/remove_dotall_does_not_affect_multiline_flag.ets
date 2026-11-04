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
// arktsid: remove_dotall_does_not_affect_multiline_flag
// description: Removing dotAll (`s`) modifier in group should not affect multiline (`m`) flag.

function main(): void {
    let re1: RegExp = new RegExp('(?-s:.es$)', 's');
    arktest.assertTrue(re1.test('aes'));
    arktest.assertTrue(!re1.test('aes\nz'));
    arktest.assertTrue(!re1.test('\nes'));
    arktest.assertTrue(!re1.test('\nes\nz'));

    let re2: RegExp = new RegExp('(?-s:.es$)', 'sm');
    arktest.assertTrue(re2.test('aes'));
    arktest.assertTrue(re2.test('aes\nz'));
    arktest.assertTrue(!re2.test('\nes'));
    arktest.assertTrue(!re2.test('\nes\nz'));
}