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

// arktsid: replaceAll_value_replaces_string
// description: String.prototype.replaceAll replaces all occurrences of search value
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let result1: String = 'aaab a a aac'.replaceAll('aa', 'z');
    arktest.assertEQ(result1, 'zab a a zc', 'replace aa with z');
    let result2: String = 'aaab a a aac'.replaceAll('a', 'z');
    arktest.assertEQ(result2, 'zzzb z z zzc', 'replace all a with z');
}