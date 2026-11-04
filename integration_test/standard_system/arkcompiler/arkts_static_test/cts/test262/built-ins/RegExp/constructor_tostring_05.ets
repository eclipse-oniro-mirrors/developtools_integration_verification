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
// arktsid: constructor_tostring_05
// description: let P be ToString(pattern) and let F be ToString(flags)

function main(): void {
    let re: RegExp = new RegExp('abc{1}', '');
    arktest.assertEQ(re.ignoreCase, false, 'ignoreCase');
    arktest.assertEQ(re.multiline, false, 'multiline');
    arktest.assertEQ(re.global, false, 'global');
    arktest.assertEQ(re.lastIndex, 0, 'lastIndex');
    arktest.assertEQ(re.source, 'abc{1}', 'source');
}