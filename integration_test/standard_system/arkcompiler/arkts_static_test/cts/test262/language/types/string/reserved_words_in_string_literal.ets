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

// arktsid: reserved_words_in_string_literal
// description: Reserved words may occur as contents of string literals

function main(): void {
                let reservedWords: string = ' break else new var case finally return void catch for switch while co' +
            'ntinue function this with defa' +
        'ult if throw delete in try do instanceof typeof ';
                arktest.assertEQ(reservedWords, ' break else new var case finally return void catch for swi' +
                    'tch while continue function this with defa' +
            'ult if throw delete in try do instanceof typeof ',
        'reserved words string literal');
}