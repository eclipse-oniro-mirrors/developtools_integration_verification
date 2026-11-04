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
// arktsid: encodeuricomponent_line_terminators
// description: encodeURIComponent encoding of URLs containing line terminators (\n, \v, \f, \r)

function main(): void {
    // CHECK#1: Line feed \n encoded as %0A
    let encoded1: string = encodeURIComponent('http://' + 'example.com/\nabout');
    arktest.assertTrue(
        encoded1 === 'http%3A%2F%2F' + 'example.com%2F%0Aabout' ||
        encoded1 === 'http%3A%2F%2F' + 'example.com%2F%0aabout',
        'Line feed \\n encoded as %0A or %0a');

    // CHECK#2: Vertical tab \v encoded as %0B
    let encoded2: string = encodeURIComponent('http://' + 'example.com/\vabout');
    arktest.assertTrue(
        encoded2 === 'http%3A%2F%2F' + 'example.com%2F%0Babout' ||
        encoded2 === 'http%3A%2F%2F' + 'example.com%2F%0babout',
        'Vertical tab \\v encoded as %0B or %0b');

    // CHECK#3: Form feed \f encoded as %0C
    let encoded3: string = encodeURIComponent('http://' + 'example.com/\fabout');
    arktest.assertTrue(
        encoded3 === 'http%3A%2F%2F' + 'example.com%2F%0Cabout' ||
        encoded3 === 'http%3A%2F%2F' + 'example.com%2F%0cabout',
        'Form feed \\f encoded as %0C or %0c');

    // CHECK#4: Carriage return \r encoded as %0D
    let encoded4: string = encodeURIComponent('http://' + 'example.com/\rabout');
    arktest.assertTrue(
        encoded4 === 'http%3A%2F%2F' + 'example.com%2F%0Dabout' ||
        encoded4 === 'http%3A%2F%2F' + 'example.com%2F%0dabout',
        'Carriage return \\r encoded as %0D or %0d');
}