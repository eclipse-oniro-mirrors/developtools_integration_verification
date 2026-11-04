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
// arktsid: encodeuri_basic
// description: encodeURI encodes URI by percent-encoding special characters (reserves URI syntax chars)

function main(): void {
    // Space becomes %20
    arktest.assertEQ(encodeURI('hello world'), 'hello%20world');

    // Reserved URI characters are NOT encoded
    arktest.assertEQ(encodeURI('/?&=#'), '/?&=#');

    // Non-ASCII UTF-8 encoding
    arktest.assertEQ(encodeURI('中文'), '%E4%B8%AD%E6%96%87');
}