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

// arktsid: encodeuri_line_terminator
// description: encodeURI percent-encodes line terminator characters (LF, VT, FF, CR)

function main(): void {
    // CHECK#1: Line Feed \n -> %0A
    arktest.assertEQ(encodeURI('http://' + 'example.com/\nabout'), 'http://' + 'example.com/%0Aabout',
        'LF encoded');

    // CHECK#2: Vertical Tab \v -> %0B
    arktest.assertEQ(encodeURI('http://' + 'example.com/\vabout'), 'http://' + 'example.com/%0Babout',
        'VT encoded');

    // CHECK#3: Form Feed \f -> %0C
    arktest.assertEQ(encodeURI('http://' + 'example.com/\fabout'), 'http://' + 'example.com/%0Cabout',
        'FF encoded');

    // CHECK#4: Carriage Return \r -> %0D
    arktest.assertEQ(encodeURI('http://' + 'example.com/\rabout'), 'http://' + 'example.com/%0Dabout',
        'CR encoded');
}