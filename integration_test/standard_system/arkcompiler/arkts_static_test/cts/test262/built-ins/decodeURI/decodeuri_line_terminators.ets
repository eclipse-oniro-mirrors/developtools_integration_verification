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

// arktsid: decodeuri_line_terminators
// description: decodeURI correctly decodes URLs containing line terminators (%0A, %0B, %0C, %0D)

function main(): void {
    arktest.assertEQ(decodeURI('http://' + 'example.com/%0Aabout'), 'http://' + 'example.com/\nabout',
        'decodeURI: %0A should decode to line feed');
    arktest.assertEQ(decodeURI('http://' + 'example.com/%0Babout'), 'http://' + 'example.com/\vabout',
        'decodeURI: %0B should decode to vertical tab');
    arktest.assertEQ(decodeURI('http://' + 'example.com/%0Cabout'), 'http://' + 'example.com/\fabout',
        'decodeURI: %0C should decode to form feed');
    arktest.assertEQ(decodeURI('http://' + 'example.com/%0Dabout'), 'http://' + 'example.com/\rabout',
        'decodeURI: %0D should decode to carriage return');
}