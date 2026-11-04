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
// arktsid: number_string_infinity_dynamic
// description: Compare Number('Infi'+'nity') with Number.POSITIVE_INFINITY, Infinity, Infinity and Number("Infinity")

function main(): void {
        arktest.assertEQ(Number(('Infi' + 'nity')), Number.POSITIVE_INFINITY,
        'Number(dynaString("Infi", "nity")) returns Number.POSITIVE_INFINITY');
    arktest.assertEQ(Number(('Infi' + 'nity')), Infinity, 'Number(dynaString("Infi", "nity")) must return Infinity');
    arktest.assertEQ(Number(('Infi' + 'nity')), Infinity, 'Number(dynaString("Infi", "nity")) must return Infinity');
        arktest.assertEQ(Number(('Infi' + 'nity')), Number('Infinity'),
        'Number(dynaString("Infi", "nity")) must return the same value returned by Number("Infinity")');
}