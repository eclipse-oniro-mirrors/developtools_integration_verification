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

// Create a JSON string for an object with indexed properties.
// Parsing that string creates a sparse array that grows dense.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0124: Expected 3 arguments, got 1."
---*/

let jsonstring: string = '{"0":0.1, "10000":0.4, ';
for (let i: int = 1; i < 9999; i++) {
  jsonstring += '"' + i + '":0.2, ';
}
jsonstring += '"9999":0.3}';

let jsonobject: Any = JSON.parse(jsonstring);
for (let i: int = 1; i < 9999; i++) {
  arktest.assertEQ(0.2, jsonobject[i]);
}
