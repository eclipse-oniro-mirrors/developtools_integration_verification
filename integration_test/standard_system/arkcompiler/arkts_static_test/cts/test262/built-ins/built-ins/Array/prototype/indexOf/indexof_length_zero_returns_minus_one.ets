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

// arktsid: indexof_length_zero_returns_minus_one
// description: Array.prototype.indexOf returns -1 when length is 0, even with a fromIndex
// Conversion notes: test262 uses a valueOf-throwing object as fromIndex to prove
//   length is checked first; ArkTS uses a plain int fromIndex, purpose unchanged.

function main(): void {
    arktest.assertEQ(([] as int[]).indexOf(1), -1, 'empty indexOf(1)');
    arktest.assertEQ(([] as int[]).indexOf(2, 5), -1, 'empty indexOf(2, 5)');
}