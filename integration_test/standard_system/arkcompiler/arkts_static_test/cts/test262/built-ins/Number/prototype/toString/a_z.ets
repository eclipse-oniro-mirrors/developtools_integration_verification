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

// arktsid: a_z
// description: Number.prototype.toString uses letters a-z for digits 10-35

function main(): void {
    // letters a-z for radix 11..36, digits 10..radix-1
    // single-char letter mappings are implementation-independent
    arktest.assertEQ((10).toString(16), 'a', '10 in radix 16');
    arktest.assertEQ((11).toString(16), 'b', '11 in radix 16');
    arktest.assertEQ((15).toString(16), 'f', '15 in radix 16');
    arktest.assertEQ((35).toString(36), 'z', '35 in radix 36');
}