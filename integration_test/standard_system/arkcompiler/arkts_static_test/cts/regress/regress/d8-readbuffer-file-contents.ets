/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// Test that reading a file actually returns the file's contents.

// Env: TEST_FILE_NAME

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference TEST_FILE_NAME"
---*/

const testFileNameType: string = typeof TEST_FILE_NAME;
arktest.assertEQ('string', testFileNameType);

const a = new Uint8Array(readbuffer(TEST_FILE_NAME));

// First line of this file.
const expected = '/*';

for (let i = 0; i < expected.length; i++) {
  arktest.assertEQ(expected.charCodeAt(i), a[i]);
}
