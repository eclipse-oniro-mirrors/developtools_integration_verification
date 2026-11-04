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

// arktsid: set_constructor
// description: Set constructor creates empty Set; with iterable initializes elements
// Migrated from test262: built-ins/Set constructor tests

function main(): void {
    // Empty Set
    let s1 = new Set<int>();
    arktest.assertEQ(s1.size, 0);

    // Set from array
    let s2 = new Set<int>([1, 2, 3]);
    arktest.assertEQ(s2.size, 3);

    // Duplicates are removed
    let s3 = new Set<int>([1, 1, 2, 2, 3]);
    arktest.assertEQ(s3.size, 3);
}
