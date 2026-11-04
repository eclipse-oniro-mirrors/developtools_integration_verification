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

// arktsid: class_body_has_direct_super_class_heritage
// description: class B extends A with explicit constructor calling super() (HasDirectSuper grammar)
// Conversion notes: 源断言 `typeof B === "function"`（类对象内省）不可表达，改为 `new B()` 可构造 + instanceof 校验。

class A {
}

class B extends A {
    constructor() {
        super();
    }
}

function main(): void {
    let b: B = new B();
    arktest.assertTrue(b instanceof B);
}
