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
desc: a default parameter referencing itself is rejected at compile time in ArkTS
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0365: Variable 'x' is accessed before it's initialization."
---*/

function f(x: int = x): void {
    arktest.assertEQ(1, x);
}
