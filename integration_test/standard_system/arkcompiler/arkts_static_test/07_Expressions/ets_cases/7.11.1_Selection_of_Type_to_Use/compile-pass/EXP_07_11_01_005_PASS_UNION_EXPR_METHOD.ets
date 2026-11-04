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
 * @id EXP_07_11_01_005_PASS_UNION_EXPR_METHOD
 * @expect compile-pass
 * @section 7.11.1
 * @design expression (union) 形式：Person | Product union 类型调用共有方法 getName
 * @note 正向用例：验证 union 类型表达式调用共有方法编译通过
 */
class Person {
    getName(): string {
        return 'Person'
    }
}
class Product {
    getName(): string {
        return 'Product'
    }
}
function showName(n: Person | Product): void {
    let name: string = n.getName()
}
let p: Person = new Person()
let pr: Product = new Product()
showName(p)
showName(pr)
