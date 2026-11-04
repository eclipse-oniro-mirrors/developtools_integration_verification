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
// arktsid: unicode_restricted_octal_escape
// description: B.1.4 is not applied for Unicode RegExp - Octal escape sequences

function main(): void {
    // DecimalEscape without leading 0 in AtomEscape
    arktest.expectThrow((): void => { new RegExp('\\1', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\2', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\3', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\4', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\5', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\6', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\7', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\8', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\9', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // DecimalEscape without leading 0 in ClassEscape
    arktest.expectThrow((): void => { new RegExp('[\\1]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\2]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\3]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\4]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\5]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\6]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\7]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\8]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\9]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // DecimalEscape with leading 0 in AtomEscape
    arktest.expectThrow((): void => { new RegExp('\\00', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\01', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\02', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\03', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\04', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\05', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\06', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\07', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\08', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('\\09', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // DecimalEscape with leading 0 in ClassEscape
    arktest.expectThrow((): void => { new RegExp('[\\00]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\01]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\02]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\03]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\04]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\05]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\06]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\07]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\08]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\09]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
}