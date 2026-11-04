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

// arktsid: string_fractional
// description: If 1 <= s < 1e21 or -1e21 < s < -1 and s has a fractional component, return the string consisting of the
// most significant n digits followed by a decimal point and the remaining k-n digits

function main(): void {
    arktest.assertEQ(String(1.0000001), '1.0000001', '#1: String(1.0000001) === \'1.0000001\'');
    arktest.assertEQ(String(-1.0000001), '-1.0000001', '#2: String(-1.0000001) === \'-1.0000001\'');
}