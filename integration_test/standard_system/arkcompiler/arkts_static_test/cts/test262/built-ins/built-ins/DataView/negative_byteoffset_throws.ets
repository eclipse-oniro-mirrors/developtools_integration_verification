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

// arktsid: negative_byteoffset_throws
// description: Throws a RangeError if byteOffset is negative

function main(): void {
    let buffer: ArrayBuffer = new ArrayBuffer(2);

    arktest.expectThrow(
        () => {
            new DataView(buffer, -1);
        },
        (e: Error) => {
            if (e.name === 'RangeError') { return true; }
            return 'Expected RangeError but got ' + e.name;
        }
    );
}