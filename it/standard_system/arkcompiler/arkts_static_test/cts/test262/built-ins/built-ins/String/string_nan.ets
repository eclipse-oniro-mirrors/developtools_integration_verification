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

// arktsid: string_nan
// description: If m is NaN, return the string "NaN"

function main(): void {
    arktest.assertEQ(String(NaN), 'NaN', '#1: String(NaN) === NaN');
    arktest.assertEQ(String(Number.NaN), 'NaN', '#2: String(Number.NaN) === NaN');
    arktest.assertEQ(String(Number('asasa')), 'NaN', '#3: String(Number(\'asasa\')) === NaN');
}