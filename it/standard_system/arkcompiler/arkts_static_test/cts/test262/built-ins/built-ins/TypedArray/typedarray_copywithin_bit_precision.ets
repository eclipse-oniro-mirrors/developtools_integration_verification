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

// arktsid: typedarray_copywithin_bit_precision
// description: copyWithin preserves the bit-level encoding of elements (e.g. NaN)
// Conversion notes: raw bytes compared via a Uint8Array view; representative Float64Array used.

function main(): void {
    let subject = new Float64Array(3);
    subject[0] = 1.0;
    subject[1] = NaN;
    subject[2] = 2.0;
    subject.copyWithin(2, 1);
    // element 2 should now hold the same bytes as element 1 (NaN)
    let bytes = new Uint8Array(subject.buffer);
    let match: boolean = true;
    for (let i: int = 0; i < 8; i++) {
        if (bytes[8 + i] != bytes[16 + i]) { match = false; }
    }
    arktest.assertTrue(match, 'copyWithin preserves NaN bytes');
}