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

// arktsid: replaceAll_dollar_amp
// description: String.prototype.replaceAll treats $& as matched string
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let s: String = 'ninguém';
    let result: String = s.replaceAll('ninguém', '($&)');
    arktest.assertEQ(result, '(ninguém)', '$& is matched');
}