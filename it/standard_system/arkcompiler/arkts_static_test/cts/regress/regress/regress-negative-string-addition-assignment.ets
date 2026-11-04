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

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0318: Type 'Int' cannot be assigned to type 'String'"
---*/

function test(): void {
  let s2: string = 's2';
  for (let i: int = 0; i < 2; i++) {
    // Crashes in round i==1 with IllegalAccess in %StringAdd(x,y)
    let res: string = 1 + s2;
    s2 = 2;
  }
}

// Crash does not occur when code is run at the top level.
test();
