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

// arktsid: objectarg_conversion_operation
// description: new TypedArray([value]) converts value per the element type (byte wrapping)
// Conversion notes: Representative Int8/Uint8/Int32 wrapping cases.

function main(): void {
    arktest.assertEQ(new Int8Array([256])[0], 0, 'Int8(256) => 0');
    arktest.assertEQ(new Uint8Array([-1])[0], 255, 'Uint8(-1) => 255');
    arktest.assertEQ(new Int32Array([2147483648])[0], -2147483648, 'Int32(2^31) => -2^31');
}