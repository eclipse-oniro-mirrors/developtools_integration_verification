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

// arktsid: class_method_propname_constructor
// description: class with a constructor named `constructor` (grammar: MethodDefinition propname)
// Conversion notes: 源断言 `typeof A === "function"`（类对象内省）不可表达，改为 `new A()` 可构造 + instanceof 校验。

class A {
    constructor() {
    }
}

function main(): void {
    let a: A = new A();
    arktest.assertTrue(a instanceof A);
}
