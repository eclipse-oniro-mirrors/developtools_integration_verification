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
// arktsid: nameless_array_destructuring_param_strict_body_n
// description: ArrayBindingPattern and Use Strict Directive are not allowed to coexist for the same function (unnamed
// async function expression)
// Conversion notes: ArrayBindingPattern 鍙傛暟 + use strict锛圓rkTS 鏃犺В鏋勫弬鏁帮級锛岃浆澹版槑澶嶇敤 statements 鍙岃優鑳庨敊璇摼

/*---
desc: |
    ArrayBindingPattern and Use Strict Directive are not allowed to coexist for the same function (unnamed async
    function expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0017: Only abstract or native methods can't have body.
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE0143: Unresolved reference element
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0318: Class cannot be used as object.
    Syntax error ESY0227: Unexpected token 'int'.
    Syntax error ESY0227: Unexpected token ')'.
    Syntax error ESY0227: Unexpected token 'Promise'.
    Syntax error ESY0227: Unexpected token '{'.
---*/

async function f([element]: int[]): Promise<void> {
    'use strict';
}

function main(): void {
}
