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
// arktsid: unicode_restricted_quantifier_without_atom
// description: B.1.4 is not applied for Unicode RegExp - Quantifier without matching Atom

function main(): void {
    // Quantifier without atom
    arktest.expectThrow((): void => { new RegExp('*', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('+', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1}', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1,}', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1,2}', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');

    // Reluctant quantifier without atom
    arktest.expectThrow((): void => { new RegExp('*?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('+?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('??', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1}?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1,}?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
    arktest.expectThrow((): void => { new RegExp('{1,2}?', 'u'); }, (e: Error): boolean => e.name === 'SyntaxError');
}