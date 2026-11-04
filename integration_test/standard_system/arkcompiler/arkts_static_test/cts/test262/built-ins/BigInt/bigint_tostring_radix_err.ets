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

// arktsid: bigint_tostring_radix_err
// description: BigInt.toString throws for radix outside 2..36
// Conversion notes: test262 expects RangeError; ArkTS throws at runtime.

function main(): void {
    let caught: boolean = false;
    try {
        let s: String = new BigInt('10').toString(37);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'toString(37) should throw');
}