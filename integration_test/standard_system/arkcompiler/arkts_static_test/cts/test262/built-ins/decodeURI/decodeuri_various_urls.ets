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

// arktsid: decodeuri_various_urls
// description: decodeURI correctly handles various URL inputs

function main(): void {
    // Empty string should remain empty
    arktest.assertEQ(decodeURI(''), '', 'decodeURI of empty string should be empty string');

    // Reserved characters %2F ('/') should not be decoded
    arktest.assertEQ(decodeURI('http:%2f%2Fexample.com'), 'http:%2f%2Fexample.com',
        'decodeURI should not decode reserved \'/\' characters');

    // Reserved characters %3F ('?'), %3D ('='), %26 ('&') should not be decoded
    arktest.assertEQ(
        decodeURI('http://' + 'example.com/support/jobs/bin/static.py%3Fpage%3dwhy-ru.html%26sid%3Dliveandwork'),
        'http://' + 'example.com/support/jobs/bin/static.py%3Fpage%3dwhy-ru.html%26sid%3Dliveandwork',
        'decodeURI should not decode reserved \'?\', \'=\', \'&\' characters');

    // Reserved %23 ('#') should not be decoded
    arktest.assertEQ(decodeURI('http://' + 'example.com/wiki/UTF-8%23Description'),
        'http://' + 'example.com/wiki/UTF-8%23Description',
        'decodeURI should not decode reserved \'#\' character');
}