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

// arktsid: decodeuricomponent_line_terminators
// description: decodeURIComponent correctly decodes percent-encoded line terminators in URLs

function main(): void {
    // Line Feed (0x0A)
    arktest.assertEQ(decodeURIComponent('http://' + 'example.com/%0Aabout'), 'http://' + 'example.com/\nabout',
        'decodeURIComponent decodes %0A as line feed');

    // Vertical Tab (0x0B)
    arktest.assertEQ(decodeURIComponent('http://' + 'example.com/%0Babout'), 'http://' + 'example.com/\vabout',
        'decodeURIComponent decodes %0B as vertical tab');

    // Form Feed (0x0C)
    arktest.assertEQ(decodeURIComponent('http://' + 'example.com/%0Cabout'), 'http://' + 'example.com/\fabout',
        'decodeURIComponent decodes %0C as form feed');

    // Carriage Return (0x0D)
    arktest.assertEQ(decodeURIComponent('http://' + 'example.com/%0Dabout'), 'http://' + 'example.com/\rabout',
        'decodeURIComponent decodes %0D as carriage return');
}