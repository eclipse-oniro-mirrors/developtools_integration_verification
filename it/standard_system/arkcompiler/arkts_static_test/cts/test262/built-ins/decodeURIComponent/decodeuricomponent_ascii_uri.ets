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

// arktsid: decodeuricomponent_ascii_uri
// description: decodeURIComponent decodes ASCII percent-encoded URI
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(decodeURIComponent('%41%42%43'), 'ABC', 'A-B-C');
    arktest.assertEQ(decodeURIComponent('%31%32%33'), '123', '1-2-3');
}