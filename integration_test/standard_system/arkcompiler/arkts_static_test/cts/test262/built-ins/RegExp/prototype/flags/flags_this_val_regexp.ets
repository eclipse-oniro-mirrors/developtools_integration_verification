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
// arktsid: flags_this_val_regexp
// description: RegExp.prototype.flags returns RegExp flags as a string

function main(): void {
    arktest.assertEQ(new RegExp('.', '').flags, '', 'no flags');
    arktest.assertEQ(new RegExp('.', 'd').flags, 'd', 'hasIndices');
    arktest.assertEQ(new RegExp('.', 'g').flags, 'g', 'global');
    arktest.assertEQ(new RegExp('.', 'i').flags, 'i', 'ignoreCase');
    arktest.assertEQ(new RegExp('.', 'm').flags, 'm', 'multiline');
    arktest.assertEQ(new RegExp('.', 's').flags, 's', 'dotAll');
    arktest.assertEQ(new RegExp('.', 'u').flags, 'u', 'unicode');
    arktest.assertEQ(new RegExp('.', 'v').flags, 'v', 'unicodeSets');
    arktest.assertEQ(new RegExp('.', 'y').flags, 'y', 'sticky');
}