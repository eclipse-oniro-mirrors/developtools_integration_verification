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

// arktsid: string_replace_undefined
// description: If a named group was not reached, it is replaced by the empty string
// Conversion notes:
//  - The named group <thd> never participates in a match; String.replace's GetSubstitution
//    substitutes an unreached named group reference ($<thd>) with the empty string.

function main(): void {
    let source: string = '(?<fst>.)(?<snd>.)|(?<thd>x)';
    let globalFlags: string[] = ['g', 'gu'];
    for (let flags of globalFlags) {
        let re: RegExp = new RegExp(source, flags);
        arktest.assertEQ('', 'abcd'.replace(re, '$<thd>'), 'flags=' + flags);
    }
    let nonGlobalFlags: string[] = ['', 'u'];
    for (let flags of nonGlobalFlags) {
        let re: RegExp = new RegExp(source, flags);
        arktest.assertEQ('cd', 'abcd'.replace(re, '$<thd>'), 'flags=' + flags);
    }
}