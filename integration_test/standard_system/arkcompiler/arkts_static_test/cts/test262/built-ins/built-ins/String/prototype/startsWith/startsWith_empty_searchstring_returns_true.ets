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
// arktsid: startsWith_empty_searchstring_returns_true
// description: String.prototype.startsWith returns true if searchString is empty

function main(): void {
    let str = 'The future is cool!';

    arktest.assertTrue(str.startsWith(''));
    arktest.assertTrue(str.startsWith('', str.length));
    // Empty search string at any position within bounds returns true
    arktest.assertTrue(str.startsWith('', 5));
}