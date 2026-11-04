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

// arktsid: single_escape_control_characters
// description: Single character escapes represent their control characters

function main(): void {
    arktest.assertEQ(String.fromCharCode(0x0008), '\b', 'backspace escape');
    arktest.assertEQ(String.fromCharCode(0x0009), '\t', 'tab escape');
    arktest.assertEQ(String.fromCharCode(0x000A), '\n', 'line feed escape');
    arktest.assertEQ(String.fromCharCode(0x000B), '\v', 'vertical tab escape');
    arktest.assertEQ(String.fromCharCode(0x000C), '\f', 'form feed escape');
    arktest.assertEQ(String.fromCharCode(0x000D), '\r', 'carriage return escape');
}

