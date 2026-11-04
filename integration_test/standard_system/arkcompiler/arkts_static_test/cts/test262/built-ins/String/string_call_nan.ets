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
// arktsid: string_call_nan
// description: String called as a function on NaN returns "NaN"
// Conversion notes: test262 also exercises String(1/"a") and String("b"*null)
//   which evaluate to NaN. ArkTS rejects string arithmetic (ESE0107), so only
//   the NaN constants are covered.

function main(): void {
    let s: string = String(NaN);
    arktest.assertEQ(s, 'NaN', 'String(NaN) is \'NaN\'');

    s = String(Number.NaN);
    arktest.assertEQ(s, 'NaN', 'String(Number.NaN) is \'NaN\'');
}