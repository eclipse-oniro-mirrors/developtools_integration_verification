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
 * @id EXP_07_11_01_006_PASS_TYPE_PARAM_METHOD
 * @expect compile-pass
 * @section 7.11.1
 * @design expression (type parameter) 形式：泛型类型参数调用约束类型的方法
 * @note 正向用例：验证 T.method() 中使用类型参数约束中定义的方法
 */
interface HasName {
    getName(): string
}
function printName<T extends HasName>(val: T): string {
    return val.getName()
}
class User implements HasName {
    getName(): string {
        return 'User'
    }
}
let u: User = new User()
let name: string = printName<HasName>(u)
