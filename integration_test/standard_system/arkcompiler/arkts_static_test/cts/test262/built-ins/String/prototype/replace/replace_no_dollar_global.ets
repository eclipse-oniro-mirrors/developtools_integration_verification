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

// arktsid: replace_no_dollar_global
// description: String.prototype.replace with /sh/g and a plain replacement string without $ replaces all matches
// Conversion notes: test262 B|direct, 1:1 migration. RegExp literal /sh/g converted to new RegExp("sh", "g").

function main(): void {
    let str: string = 'She sells seashells by the seashore.';
    let re: RegExp = new RegExp('sh', 'g');
    arktest.assertEQ(str.replace(re, 'sch'), 'She sells seaschells by the seaschore.',
        'replace /sh/g with sch replaces all matches');
}