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
// arktsid: unicode_restricted_character_class_escape
// description: B.1.4 is not applied for Unicode RegExp - ClassEscape in range expression

function main(): void {
    // Leading CharacterClassEscape
    arktest.expectThrow((): void => { new RegExp('[\\d-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\D-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\s-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\S-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\w-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\W-a]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // Trailing CharacterClassEscape
    arktest.expectThrow((): void => { new RegExp('[a-\\d]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[a-\\D]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[a-\\s]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[a-\\S]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[a-\\w]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[a-\\W]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // Leading and trailing CharacterClassEscape
    arktest.expectThrow((): void => { new RegExp('[\\d-\\d]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\D-\\D]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\s-\\s]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\S-\\S]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\w-\\w]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('[\\W-\\W]', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
}