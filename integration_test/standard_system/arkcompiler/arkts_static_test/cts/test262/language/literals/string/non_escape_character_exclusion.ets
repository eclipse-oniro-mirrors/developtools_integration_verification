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

// arktsid: non_escape_character_exclusion
// description: Escape characters are not treated as non-escape characters

function main(): void {
    arktest.assertNE('b', '\b', 'backspace is an escape character');
    arktest.assertNE('f', '\f', 'form feed is an escape character');
    arktest.assertNE('n', '\n', 'line feed is an escape character');
    arktest.assertNE('r', '\r', 'carriage return is an escape character');
    arktest.assertNE('t', '\t', 'tab is an escape character');
    arktest.assertNE('v', '\v', 'vertical tab is an escape character');
}

