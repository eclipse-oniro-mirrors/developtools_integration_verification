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
// arktsid: constructor_from_regexp_02
// description: Pattern is /\t/m and RegExp is new RegExp(pattern, x), where x is undefined variable

function main(): void {
    let pattern: RegExp = new RegExp('\\t', 'm');
    let re: RegExp = new RegExp(pattern);

    arktest.assertEQ(re.source, pattern.source);
    arktest.assertEQ(re.multiline, pattern.multiline);
    arktest.assertEQ(re.global, pattern.global);
    arktest.assertEQ(re.ignoreCase, pattern.ignoreCase);
}