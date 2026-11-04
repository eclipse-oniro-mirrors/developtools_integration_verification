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
// arktsid: number_string_u180e_static
// description: Ensure U+180E is not recognized as whitespace, test ToNumber with static string

function main(): void {
    arktest.assertTrue(isNaN(Number('\u180E')), 'Number("\\u180E") === NaN');
    arktest.assertTrue(isNaN(Number('\u180E1234567890\u180E')), 'Number("\u180E1234567890\u180E") === NaN');
    arktest.assertTrue(isNaN(Number('\u180EInfinity\u180E')), 'Number("\u180EInfinity\u180E") === NaN');
    arktest.assertTrue(isNaN(Number('\u180E-Infinity\u180E')), 'Number("\u180E-Infinity\u180E") === NaN');
}