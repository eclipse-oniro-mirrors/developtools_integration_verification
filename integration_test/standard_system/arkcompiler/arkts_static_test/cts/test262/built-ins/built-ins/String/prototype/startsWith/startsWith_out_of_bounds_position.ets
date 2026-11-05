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
// arktsid: startsWith_out_of_bounds_position
// description: String.prototype.startsWith returns false when position + searchLength exceeds string length; negative
// position is clamped to 0

function main(): void {
    let str = 'The future is cool!';

    // Position at or beyond string length
    arktest.assertEQ(str.startsWith('!', str.length), false);
    arktest.assertEQ(str.startsWith('!', 100), false);

    // Negative position is clamped to 0
    arktest.assertTrue(str.startsWith('The future', -1));
    arktest.assertTrue(str.startsWith('The future', 0));
}