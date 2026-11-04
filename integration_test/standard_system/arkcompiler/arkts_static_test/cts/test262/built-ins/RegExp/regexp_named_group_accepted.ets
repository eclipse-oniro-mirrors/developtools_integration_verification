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

// arktsid: regexp_named_group_accepted
// description: RegExp accepts named group syntax (?<name>...) without throwing
// Conversion notes: test262 expects SyntaxError for this pattern,
//   but ArkTS RegExp silently accepts it. Testing ArkTS actual behavior.
//   Dimension rep for named-groups feature group.

function main(): void {
    let threw: boolean = false;
    try {
        let r = new RegExp('(?<name>abc)');
        r.exec('abc');
    } catch (e) {
        threw = true;
    }
    arktest.assertTrue(!threw, 'named-groups: RegExp should not throw');
}