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
// arktsid: math_pow_int32_min_exponent
// description: Math.pow with -(2**31) exponent underflows to +0; pow(1, ..) is 1

function main(): void {
    let int32Min: double = -2147483648.0;
    arktest.assertPositiveZero(Math.pow(2.0, int32Min), 'pow(2, INT32_MIN) is +0');
    arktest.assertEQ(Math.pow(1.0, int32Min), 1, 'pow(1, INT32_MIN) is 1');
}