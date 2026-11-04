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

// arktsid: replace_regexp_empty_pattern
// description: String.prototype.replace with an empty-pattern global RegExp inserts between every character
// Conversion notes: test262 builds the regexp with an undefined pattern (new RegExp(x, "g") with
//   hoisted var x), which per spec becomes the empty pattern; ArkTS RegExp needs an explicit
//   empty String pattern, so new RegExp("", "g") is used.

function main(): void {
    let reg: RegExp = new RegExp('', 'g');
    let result: String = 'asdf'.replace(reg, '1');
    arktest.assertEQ(result, '1a1s1d1f1', 'empty-pattern global replace inserts at every position');
}