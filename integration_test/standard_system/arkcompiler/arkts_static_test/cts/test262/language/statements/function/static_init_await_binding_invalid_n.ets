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
// arktsid: static_init_await_binding_invalid_n
// description: BindingIdentifier may not be `await` within class static blocks
// Conversion notes: class static 块内函数名 await（await 硬关键字 ESY0316；static 块上下文结构未实测）

/*---
desc: BindingIdentifier may not be `await` within class static blocks
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0147: Unexpected token, expected function identifier.
---*/

class C {
    static {
        function await(): void {
        }
    }
}

function main(): void {
}
