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

// arktsid: parsefloat_infinity
// description: parseFloat("Infinity"), parseFloat("+Infinity"), parseFloat("-Infinity") return the respective Infinity
// values
// Migrated from test262: built-ins/parseFloat/S15.1.2.3_A5_T1.js

function main(): void {
    arktest.assertEQ(parseFloat('Infinity'), Number.POSITIVE_INFINITY);
    arktest.assertEQ(parseFloat('+Infinity'), Number.POSITIVE_INFINITY);
    arktest.assertEQ(parseFloat('-Infinity'), Number.NEGATIVE_INFINITY);
}