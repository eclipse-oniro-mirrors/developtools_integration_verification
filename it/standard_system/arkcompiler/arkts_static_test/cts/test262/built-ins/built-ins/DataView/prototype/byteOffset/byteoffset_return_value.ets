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

// arktsid: byteoffset_return_value
// description: Return value from [[ByteOffset]] internal slot

function main(): void {
    let buffer = new ArrayBuffer(12);

    let sample1 = new DataView(buffer, 0);
    let sample2 = new DataView(buffer, 4);
    let sample3 = new DataView(buffer, 6, 4);
    let sample4 = new DataView(buffer, 12);
    let sample5 = new DataView(buffer, 0, 2);

    arktest.assertEQ(sample1.byteOffset, 0);
    arktest.assertEQ(sample2.byteOffset, 4);
    arktest.assertEQ(sample3.byteOffset, 6);
    arktest.assertEQ(sample4.byteOffset, 12);
    arktest.assertEQ(sample5.byteOffset, 0);
}
