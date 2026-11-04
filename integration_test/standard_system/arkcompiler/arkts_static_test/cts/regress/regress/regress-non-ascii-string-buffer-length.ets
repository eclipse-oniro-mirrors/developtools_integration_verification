/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// 32 ASCII-characters followed by a non-ASCII character.
// This causes an internal buffer to first expand to 64 bytes, then expand the
// 32 ASCII characters to 64 bytes of UC16 characters, leaving no room
// to store the 33rd character. This fails an ASSERT in debug mode.

function main(): void {
  arktest.assertEQ(33, '12345678901234567890123456789012\u2028'.length);
}
