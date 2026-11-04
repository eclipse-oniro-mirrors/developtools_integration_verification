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
// arktsid: remove_multiline_does_not_affect_alternatives_outside
// description: Removing multiline (`m`) modifier should not affect alternatives outside.

function main(): void {
    let re1 = new RegExp('^a$|^b$|(?-m:^c$)|^d$|^e$', 'm');
    arktest.assertTrue(re1.test('\na\n'));
    arktest.assertTrue(re1.test('\nb\n'));
    arktest.assertTrue(!re1.test('\nc\n'));
    arktest.assertTrue(re1.test('\nd\n'));
    arktest.assertTrue(re1.test('\ne\n'));

    let re2 = new RegExp('(^a$)|(?:^b$)|(?-m:^c$)|(?:^d$)|(^e$)', 'm');
    arktest.assertTrue(re2.test('\na\n'));
    arktest.assertTrue(re2.test('\nb\n'));
    arktest.assertTrue(!re2.test('\nc\n'));
    arktest.assertTrue(re2.test('\nd\n'));
    arktest.assertTrue(re2.test('\ne\n'));
}