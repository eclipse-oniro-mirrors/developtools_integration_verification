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

// arktsid: decodeuricomponent_various_urls
// description: decodeURIComponent correctly decodes various URL patterns including empty string and encoded paths

function main(): void {
    // Empty string
    arktest.assertEQ(decodeURIComponent(''), '', 'decodeURIComponent(\'\') returns empty string');

    // Plain URL with no encoding
    arktest.assertEQ(decodeURIComponent('http://' + 'example.com'), 'http://' + 'example.com',
        'decodeURIComponent returns plain URL unchanged');

    // URL with percent-encoded slashes and query params
    arktest.assertEQ(
                decodeURIComponent('http:%2f%2Fexample.com/support/jobs/bin/static.py%3Fpage%3dwhy-ru.html' +
            '%26sid%3Dliveandwork'),
        'http://' + 'example.com/support/jobs/bin/static.py?page=why-ru.html&sid=liveandwork',
        'decodeURIComponent decodes encoded slashes and query separators');

    // URL with percent-encoded hash
    arktest.assertEQ(
        decodeURIComponent('http:%2F%2Fexample.com/wiki/UTF-8%23Description'),
        'http://' + 'example.com/wiki/UTF-8#Description',
        'decodeURIComponent decodes encoded hash in URL');
}