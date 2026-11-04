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

// arktsid: number_extended_precision_2_power_53
// description: The 2^53 computation remains a number

function main(): void {
    let x: double = 9007199254740994.0;
    let y: double = 1.0 - 1.0 / 65536.0;
    let z: double = x + y;
    let d: double = z - x;
    arktest.assertNE(d, 2.0);
}
