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

// arktsid: string_infinity
// description: If m is infinity, return the string "Infinity"

function main(): void {
    arktest.assertEQ(String(Infinity), 'Infinity', '#1: String(Infinity) === \'Infinity\'');
        arktest.assertEQ(String(Number.POSITIVE_INFINITY), 'Infinity',
        '#2: String(Number.POSITIVE_INFINITY) === \'Infinity\'');
    arktest.assertEQ(String(-Infinity), '-Infinity', '#3: String(-Infinity) === \'-Infinity\'');
        arktest.assertEQ(String(Number.NEGATIVE_INFINITY), '-Infinity',
        '#4: String(Number.NEGATIVE_INFINITY) === \'-Infinity\'');
}