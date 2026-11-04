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

// arktsid: match_with_regexp_object
// description: String.prototype.match called with a RegExp object as argument returns the first match
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let reg: RegExp = new RegExp('77');
    let result: RegExpMatchArray | null = 'ABBABABAB77BBAA'.match(reg);
    if (result != null) {
        arktest.assertEQ(result[0], '77', 'first match is 77');
    } else {
        arktest.assertTrue(false, 'match should return a result');
    }
}