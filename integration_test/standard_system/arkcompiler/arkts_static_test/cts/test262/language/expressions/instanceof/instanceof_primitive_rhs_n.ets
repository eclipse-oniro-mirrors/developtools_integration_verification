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
desc: A primitive cannot be used on the right hand side of instanceof
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE38251: Type '\"x\"' cannot be used on the right hand side of an
    'instanceof' expression"
---*/

function main(): void {
    let a = 1 instanceof 'x';
}
