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
// arktsid: encodeuricomponent_english_alphabet
// description: encodeURIComponent encoding of English alphabet, digits, and special characters

function main(): void {
    // CHECK#1: URL with digits — all special chars are percent-encoded
    arktest.assertEQ(encodeURIComponent('http://' + 'example.com/0123456789'),
        'http%3A%2F%2F' + 'example.com%2F0123456789',
        'URL special characters percent-encoded');

    // CHECK#2: English alphabet letters remain unescaped
    arktest.assertEQ(encodeURIComponent('aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'),
        'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ',
        'English alphabet letters unchanged');

    // CHECK#3: ;/?:@&=+$, are all percent-encoded
    arktest.assertEQ(encodeURIComponent(';/?:@&=+$,'), '%3B%2F%3F%3A%40%26%3D%2B%24%2C',
        'URI syntax characters percent-encoded');
}