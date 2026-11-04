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
// arktsid: encodeuricomponent_common_urls
// description: encodeURIComponent encoding of typical URLs and empty string

function main(): void {
    // CHECK#1: Empty string encodes to empty string
    arktest.assertEQ(encodeURIComponent(''), '',
        'Empty string encodes to empty string');

    // CHECK#2: Simple URL with http:// encoded
    arktest.assertEQ(encodeURIComponent('http://' + 'example.com'), 'http%3A%2F%2F' + 'example.com',
        'Simple URL percent-encoded');

    // CHECK#3: URL with query params and page=why-ru.html&sid=liveandwork
                arktest.assertEQ(encodeURIComponent('http://' +
            'example.com/support/jobs/bin/static.py?page=why-ru.html&sid=liv' +
            'eandwork'),
        
        'http%3A%2F%2F' + 'example.com%2Fsupport%2Fjobs%2Fbin%2Fstatic.py%3Fpage%3Dwhy-ru.html%26sid%3Dliveandwork',
        'URL with query parameters percent-encoded');

    // CHECK#4: URL with fragment #Description encoded as %23Description
    arktest.assertEQ(encodeURIComponent('http://' + 'example.com/wiki/UTF-8#Description'),
        'http%3A%2F%2F' + 'example.com%2Fwiki%2FUTF-8%23Description',
        'URL with fragment hash percent-encoded');
}