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

// arktsid: early_err_modifiers_other_code_point_arbitrary
// description: It is a Syntax Error if the source text matched by RegularExpressionFlags contains any code point other
// than i, m, or s. (regular expression flags)
// Conversion notes: test262 uses RegExp("(?1:a)", "") and expects a runtime SyntaxError because
//   the modifier flag contains the digit "1", which is not i/m/s.
//   ArkTS validates RegExp at runtime via native parse() in the constructor, so it also throws SyntaxError.

function main(): void {
    arktest.expectThrow((): void => {
        new RegExp('(?1:a)', '');
    }, (e: Error): boolean => e.name === 'SyntaxError');
}