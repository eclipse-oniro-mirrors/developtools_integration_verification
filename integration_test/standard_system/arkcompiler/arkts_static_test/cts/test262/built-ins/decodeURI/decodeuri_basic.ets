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
// arktsid: decodeuri_basic
// description: decodeURI decodes percent-encoded URI characters

function main(): void {
    // Basic ASCII characters
    arktest.assertEQ(decodeURI('%41%42%43'), 'ABC');

    // Unreserved characters are not encoded in URI
    arktest.assertEQ(decodeURI('hello%20world'), 'hello world');

    // Reserved URI characters (/ ? & = # etc.) are NOT decoded by decodeURI
    // (decodeURIComponent would decode them; decodeURI preserves URI structure)
    arktest.assertEQ(decodeURI('%2F%3F%26'), '%2F%3F%26');

    // Already decoded string passes through
    arktest.assertEQ(decodeURI('abc123'), 'abc123');
}