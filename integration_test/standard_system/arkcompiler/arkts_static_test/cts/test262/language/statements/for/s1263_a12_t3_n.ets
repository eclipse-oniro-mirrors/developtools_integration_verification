/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Trying to break non-existent label
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference nonexist"]
---*/

function main(): void {
    let str: string = '';
    let index: int = 0;
    let indexN: int = 0;
    outer: for (index = 0; index < 4; index += 1) {
        nested: for (indexN = 0; indexN <= index; indexN++) {
            if (index * indexN >= 4) {
                break nonexist;
            }
            str += index.toString() + indexN.toString();
        }
    }
}
