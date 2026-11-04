/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may obtain a copy of the License at
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
desc: A switch statement requires a statement block
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0230: Expected ':', got ';'.",
    "Syntax error ESY0230: Expected '{', got ';'.",
    "Syntax error ESY0231: Unexpected token ';', expected 'case' or 'default'.",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
]
---*/

function main(): void {
    let value: int = 0;
    switch (value);
}
