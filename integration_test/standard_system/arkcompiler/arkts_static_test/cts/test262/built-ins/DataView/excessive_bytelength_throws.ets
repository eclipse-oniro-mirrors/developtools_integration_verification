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

// arktsid: excessive_bytelength_throws
// description: Throws RangeError if offset + viewByteLength > bufferByteLength

function main(): void {
    let buffer = new ArrayBuffer(3);

    arktest.expectThrow(
        () => { new DataView(buffer, 0, 4); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 0, length: 4: Expected RangeError but got ' + e.name;
        }
    );

    arktest.expectThrow(
        () => { new DataView(buffer, 1, 3); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 1, length: 3: Expected RangeError but got ' + e.name;
        }
    );

    arktest.expectThrow(
        () => { new DataView(buffer, 2, 2); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 2, length: 2: Expected RangeError but got ' + e.name;
        }
    );

    arktest.expectThrow(
        () => { new DataView(buffer, 3, 1); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 3, length: 1: Expected RangeError but got ' + e.name;
        }
    );

    arktest.expectThrow(
        () => { new DataView(buffer, 4, 0); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 4, length: 0: Expected RangeError but got ' + e.name;
        }
    );

    arktest.expectThrow(
        () => { new DataView(buffer, 4, -1); },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'offset: 4, length: -1: Expected RangeError but got ' + e.name;
        }
    );
}