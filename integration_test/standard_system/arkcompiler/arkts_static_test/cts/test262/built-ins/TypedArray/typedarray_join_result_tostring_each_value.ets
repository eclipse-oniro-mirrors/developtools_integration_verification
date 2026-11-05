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

// arktsid: typedarray_join_result_tostring_each_value
// description: join concatenates the toString of each element, including special numeric values
// Conversion notes: Float64Array used so special values (Infinity/NaN/-Infinity) are preserved; integer-type wrapping
// cases dropped.

function main(): void {
    let ta = new Float64Array(6);
    ta[0] = -2;
    ta[1] = Infinity;
    ta[2] = NaN;
    ta[3] = -Infinity;
    ta[4] = 0.6;
    ta[5] = 9007199254740992;
    arktest.assertEQ(ta.join(), '-2,Infinity,NaN,-Infinity,0.6,9007199254740992', 'join special values');
    arktest.assertEQ(ta.join('|'), '-2|Infinity|NaN|-Infinity|0.6|9007199254740992', 'join special values custom sep');
}