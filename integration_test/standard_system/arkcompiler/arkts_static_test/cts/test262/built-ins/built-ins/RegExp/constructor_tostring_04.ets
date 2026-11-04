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
// arktsid: constructor_tostring_04
// description: RegExp constructed with flags "mig" sets ignoreCase/multiline/global to true and lastIndex to 0, source
// is preserved

function main(): void {
    let re: RegExp = new RegExp('[z-z]', 'mig');
    arktest.assertEQ(re.ignoreCase, true, 'The value of re.ignoreCase is expected to be true');
    arktest.assertEQ(re.multiline, true, 'The value of re.multiline is expected to be true');
    arktest.assertEQ(re.global, true, 'The value of re.global is expected to be true');
    arktest.assertEQ(re.lastIndex, 0, 'The value of re.lastIndex is expected to be 0');
    arktest.assertEQ(re.source, '[z-z]', 'The value of re.source is expected to be [z-z]');
}