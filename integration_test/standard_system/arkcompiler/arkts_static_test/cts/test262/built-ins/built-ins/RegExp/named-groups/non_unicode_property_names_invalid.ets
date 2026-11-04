/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: non_unicode_property_names_invalid
// description: Invalid exotic named group names in non-Unicode RegExps

function main(): void {
    arktest.expectThrow((): void => {
        new RegExp('(?<🦊>fox)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<\u{1f98a}>fox)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<🦊>fox)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<🐕>dog)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<\u{1f415}>dog)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<\ud83d \udc15>dog)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<𝟚the>the)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<\u{1d7da}the>the)');
    }, (e: Error): boolean => e.name === 'SyntaxError');

    arktest.expectThrow((): void => {
        new RegExp('(?<𝟚the>the)');
    }, (e: Error): boolean => e.name === 'SyntaxError');
}