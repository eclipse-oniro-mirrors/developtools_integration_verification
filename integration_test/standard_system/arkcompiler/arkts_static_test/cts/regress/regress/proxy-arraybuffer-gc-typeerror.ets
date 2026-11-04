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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function main() {
  const v2 = [1337,1337,1337,1337,1337];
  function v9() {
      const v15 = {get:RegExp};
      Object.defineProperty(v2,501,v15);
      const v18 = RegExp();
      const v19 = 1337 instanceof v18;
  }
  const v30 = {defineProperty:Function,get:v9,getPrototypeOf:Object};
  const v32 = new Proxy(ArrayBuffer,v30);
  const v34 = ArkTools.gc(v32);
}

arktest.expectThrow(() => main(), (e: Error): boolean => e instanceof TypeError);
