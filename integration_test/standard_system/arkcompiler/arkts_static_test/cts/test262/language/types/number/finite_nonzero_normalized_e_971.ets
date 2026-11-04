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

// arktsid: finite_nonzero_normalized_e_971
// description: Finite nonzero double values remain within the IEEE-754 range

function main(): void {
    let first: double = 1.0 * Math.pow(2.0, 52.0) * Math.pow(2.0, 971.0);
    let second: double = 1.0 * (Math.pow(2.0, 53.0) - 1.0) * Math.pow(2.0, 971.0);
    let third: double = -1.0 * Math.pow(2.0, 52.0) * Math.pow(2.0, 971.0);
    arktest.assertEQ(first, 8.98846567431158e+307);
    arktest.assertEQ(second, 1.7976931348623157e+308);
    arktest.assertEQ(third, -8.98846567431158e+307);
}
