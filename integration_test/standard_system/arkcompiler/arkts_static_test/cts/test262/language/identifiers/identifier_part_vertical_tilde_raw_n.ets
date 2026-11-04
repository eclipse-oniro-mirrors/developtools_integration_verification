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
desc: Raw VERTICAL TILDE is not a valid identifier part
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'ⸯ'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
    Semantic error ESE0143: Unresolved reference ⸯ
---*/
let aⸯ
