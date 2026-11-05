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
// arktsid: json_stringify_negative_zero
// description: JSON.stringify serializes negative zero as "0"
// Conversion notes: ArkTS has no -0 literal; int 0 is serialized as "0", matching the negative-zero stringification.

function main(): void {
    arktest.assertEQ(JSON.stringify(-0), '0', '-0 -> 0');
    arktest.assertEQ(JSON.stringify(0), '0', '0 -> 0');
    arktest.assertEQ(JSON.stringify(['-0', 0, -0]), '["-0",0,0]', 'array with -0 elements');
}