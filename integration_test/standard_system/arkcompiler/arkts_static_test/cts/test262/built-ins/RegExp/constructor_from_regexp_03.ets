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
// arktsid: constructor_from_regexp_03
// description: Pattern is /[a-b]/g and new RegExp(pattern) with flags omitted copies the pattern's source and g flag

function main(): void {
    let pattern = new RegExp('[a-b]', 'g');
    let re = new RegExp(pattern);

    arktest.assertEQ(re.source, pattern.source, 'source');
    arktest.assertEQ(re.multiline, pattern.multiline, 'multiline');
    arktest.assertEQ(re.global, pattern.global, 'global');
    arktest.assertEQ(re.ignoreCase, pattern.ignoreCase, 'ignoreCase');
}