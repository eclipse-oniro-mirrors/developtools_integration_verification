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

// arktsid: isWellFormed_returns_boolean
// description: The method should return a boolean.
// Conversion notes: test262 B|direct, 1:1 migration. String.prototype.isWellFormed is natively supported by ArkTS
// stdlib.

function main(): void {
    const leadingPoo: string = '\uD83D';
    const trailingPoo: string = '\uDCA9';
    const wholePoo: string = leadingPoo + trailingPoo;

    arktest.assertEQ(('a' + leadingPoo + 'c' + leadingPoo + 'e').isWellFormed(), false,
        'lone leading surrogates are not well-formed');
    arktest.assertEQ(('a' + trailingPoo + 'c' + trailingPoo + 'e').isWellFormed(), false,
        'lone trailing surrogates are not well-formed');
    arktest.assertEQ(('a' + trailingPoo + leadingPoo + 'd').isWellFormed(), false,
        'a wrong-ordered surrogate pair is not well-formed');
    arktest.assertEQ('a💩c'.isWellFormed(), true, 'a surrogate pair using a literal code point is well-formed');
        arktest.assertEQ('a\uD83D\uDCA9c'.isWellFormed(), true,
        'a surrogate pair formed by escape sequences is well-formed');
    arktest.assertEQ(('a' + leadingPoo + trailingPoo + 'd').isWellFormed(), true,
        'a surrogate pair formed by concatenation is well-formed');
    arktest.assertEQ(wholePoo.slice(0, 1).isWellFormed(), false,
        'a surrogate pair sliced to the leading surrogate is not well-formed');
    arktest.assertEQ(wholePoo.slice(1).isWellFormed(), false,
        'a surrogate pair sliced to the trailing surrogate is not well-formed');
    arktest.assertEQ('abc'.isWellFormed(), true, 'a latin-1 string is well-formed');
    arktest.assertEQ('a▨c'.isWellFormed(), true, 'a non-ASCII character is well-formed');
}