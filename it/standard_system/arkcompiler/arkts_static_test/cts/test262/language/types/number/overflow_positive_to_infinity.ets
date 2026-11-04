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

// arktsid: overflow_positive_to_infinity
// description: Positive overflow produces infinity

function main(): void {
    let value: double = 1e+308 * 2.0;
    arktest.assertEQ(value, 1.0 / 0.0);
    let powerValue: double = 1.0 * Math.pow(2.0, 53.0) * Math.pow(2.0, 971.0);
    arktest.assertEQ(powerValue, 1.0 / 0.0);
}
