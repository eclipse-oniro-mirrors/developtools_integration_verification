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
// arktsid: math_ceil_small_negative_zero
// description: Math.ceil of small negative values rounds to -0

function main(): void {
    arktest.assertNegativeZero(Math.ceil(-0.000000000000001), '-0.000000000000001');
    arktest.assertNegativeZero(Math.ceil(-0.999999999999999), '-0.999999999999999');
    arktest.assertNegativeZero(Math.ceil(-0.5), '-0.5');
}