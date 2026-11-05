/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * @id GEN_05_01_04_107_FAIL_ASSIGN
 * @expect compile-fail
 * @section 5.1.4
 * @design 两个通配符类型间 invariant 属性赋值
 * @note 反向用例：验证不同通配符实例化间属性赋值编译错误（spec 5.1.4 行 590-591）
 */
class X<T> {
    p: T;
    constructor(p: T) { this.p = p; }
}
function foo(a: Any, b: Any): void {
    if (a instanceof X && b instanceof X) {
    let a1 = a;  // X<*>
        let a2 = b;  // X<*>
        a.p = b.p;   // Compile-time error: invariance prevents assignment
    }
}
