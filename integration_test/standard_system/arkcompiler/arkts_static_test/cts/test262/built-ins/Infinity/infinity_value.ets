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

// arktsid: infinity_value
// description: Infinity equals Number.POSITIVE_INFINITY, isFinite(Infinity)=false, isNaN(Infinity)=false
// Migrated from test262: built-ins/Infinity/S15.1.1.2_A1.js

function main(): void {
    // Infinity equals POSITIVE_INFINITY
    arktest.assertEQ(Infinity, Number.POSITIVE_INFINITY);

    // isFinite(Infinity) returns false
    arktest.assertEQ(isFinite(Infinity), false);

    // isNaN(Infinity) returns false
    arktest.assertEQ(isNaN(Infinity), false);
}
