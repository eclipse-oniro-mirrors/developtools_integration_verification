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
 * @id GEN_05_01_04_100_FAIL_ANY
 * @expect compile-fail
 * @section 5.1.4
 * @design X<*> 不是 X<Any> 的子类型（invariant T）
 * @note 反向用例：验证 instanceof 通配符类型不可赋值给 X<Any>（spec 5.1.4 行 413-419）
 */
class X<T> {
    p: T;
    constructor(v: T) { this.p = v; }
}
function bar(x: X<Any>): void {
    x.p = 'a';
}
function foo(obj: Object): void {
    if (obj instanceof X) {
        bar(obj);  // Compile-time error: X<*> is not a subtype of X<Any>
    }
}
