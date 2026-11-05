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
// arktsid: math_cosh_special_vals
// description: Math.cosh special values: NaN, 0/-0 -> 1, +/-Infinity -> +Infinity

function main(): void {
    arktest.assertTrue(isNaN(Math.cosh(NaN)), 'cosh(NaN)');
    arktest.assertEQ(Math.cosh(0), 1, 'cosh(0) is 1');
    arktest.assertEQ(Math.cosh(-0.0), 1, 'cosh(-0) is 1');
    arktest.assertEQ(Math.cosh(-Infinity), Infinity, 'cosh(-Infinity)');
    arktest.assertEQ(Math.cosh(Infinity), Infinity, 'cosh(+Infinity)');
}