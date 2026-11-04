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

// arktsid: grammar_class_body_ctor_no_heritage
// description: class with only a constructor, no heritage
// source: valid/grammar-class-body-ctor-no-heritage.js
// Conversion notes: class 表达式（ESE0020 拒绝）→ class 声明；字段名 Unicode 字面量逐字节（标识符 \u 转义 ESY0271 不可表达）。语义复用
// statements/class/elements/syntax/valid 已验证结论。

class C {
    constructor() {
    }
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c instanceof C);
}