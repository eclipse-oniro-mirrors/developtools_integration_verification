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

// arktsid: string_replace_missing
// description: If the group doesn't exist, replace with the empty string
// Conversion notes: Replacement strings $<fth>/$<42$1>/$<$1>/$<> reference group
//   names absent from the match; getSubstitution appends the empty string for
//   namedCaptures[name] == undefined, matching the spec.

function main(): void {
    let source: String = '(?<fst>.)(?<snd>.)|(?<thd>x)';
    for (let flags of ['', 'u']) {
        let re = new RegExp(source, flags);
        arktest.assertEQ('cd', 'abcd'.replace(re, '$<42$1>'));
        arktest.assertEQ('cd', 'abcd'.replace(re, '$<fth>'));
        arktest.assertEQ('cd', 'abcd'.replace(re, '$<$1>'));
        arktest.assertEQ('cd', 'abcd'.replace(re, '$<>'));
    }
    for (let flags of ['g', 'gu']) {
        let re = new RegExp(source, flags);
        arktest.assertEQ('', 'abcd'.replace(re, '$<42$1>'));
        arktest.assertEQ('', 'abcd'.replace(re, '$<fth>'));
        arktest.assertEQ('', 'abcd'.replace(re, '$<$1>'));
        arktest.assertEQ('', 'abcd'.replace(re, '$<>'));
    }
}