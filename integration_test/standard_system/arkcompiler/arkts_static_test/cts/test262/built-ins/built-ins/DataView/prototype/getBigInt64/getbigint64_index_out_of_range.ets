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

// arktsid: getbigint64_index_out_of_range
// description: Throws a RangeError if getIndex + elementSize > viewSize
// Conversion notes:
//  - getBigInt64(byteOffset: int) throws RangeError at runtime when byteOffset + 8 > viewSize;
//    the Infinity case is dropped because Infinity is not an int (compile-time type mismatch).

function expectRangeError(fn: () => void): void {
    arktest.expectThrow(
        fn,
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'Expected RangeError but got ' + e.name;
        }
    );
}

function main(): void {
    let buffer = new ArrayBuffer(12);

    let sample = new DataView(buffer, 0);
    expectRangeError(() => { sample.getBigInt64(13); });
    expectRangeError(() => { sample.getBigInt64(12); });
    expectRangeError(() => { sample.getBigInt64(11); });
    expectRangeError(() => { sample.getBigInt64(10); });
    expectRangeError(() => { sample.getBigInt64(9); });
    expectRangeError(() => { sample.getBigInt64(8); });
    expectRangeError(() => { sample.getBigInt64(7); });
    expectRangeError(() => { sample.getBigInt64(6); });
    expectRangeError(() => { sample.getBigInt64(5); });

    sample = new DataView(buffer, 8);
    expectRangeError(() => { sample.getBigInt64(1); });

    sample = new DataView(buffer, 9);
    expectRangeError(() => { sample.getBigInt64(0); });

    sample = new DataView(buffer, 0, 8);
    expectRangeError(() => { sample.getBigInt64(1); });

    sample = new DataView(buffer, 0, 7);
    expectRangeError(() => { sample.getBigInt64(0); });

    sample = new DataView(buffer, 4, 8);
    expectRangeError(() => { sample.getBigInt64(1); });

    sample = new DataView(buffer, 4, 7);
    expectRangeError(() => { sample.getBigInt64(0); });
}