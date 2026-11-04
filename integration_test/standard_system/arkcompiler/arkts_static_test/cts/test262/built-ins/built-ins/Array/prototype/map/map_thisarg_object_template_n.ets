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

/*---
desc: |
    Array.prototype.map with a thisArg (object from an object template) - ArkTS map takes no thisArg, the 2-arg call
    is compile-rejected
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0124: Expected 1 arguments, got 2.
    Semantic error ESE0127: No matching call signature for map(((p1: Int) => Boolean), MapThisArgFoo)
---*/

class MapThisArgFoo {
    public res: boolean = true;
}

function main(): void {
    let f: MapThisArgFoo = new MapThisArgFoo();
    let arr: int[] = [1];
    arr.map((v: int): boolean => { return f.res; }, f);
}
