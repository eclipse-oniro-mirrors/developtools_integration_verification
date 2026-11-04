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
desc: Embedded \"try\" statements followed by two \"catch\" statements
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0039: A try statement should contain either finally clause or at least one catch clause.",
    "Semantic error ESE0034: Default catch clause should be the last in the try statement",
]
---*/

function main(): void {
    try {
        try {
        }
    }
    catch (e1) {
    }
    catch (e2) {
    }
}
