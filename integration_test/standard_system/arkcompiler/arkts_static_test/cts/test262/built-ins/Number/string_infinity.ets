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
// arktsid: number_string_infinity
// description: Compare Number('Infinity') with Number.POSITIVE_INFINITY, Infinity, Infinity and Number("Infinity")

function main(): void {
        arktest.assertEQ(Number('Infinity'), Number.POSITIVE_INFINITY,
        'Number("Infinity") returns Number.POSITIVE_INFINITY');
    arktest.assertEQ(Number('Infinity'), Infinity, 'Number("Infinity") must return Infinity');
    arktest.assertEQ(Number('Infinity'), Infinity, 'Number("Infinity") must return Infinity');
        arktest.assertEQ(Number('Infinity'), Infinity,
        'Number("Infinity") must return the same value returned by Number("Infinity")');
}