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
 * @id EXP_07_11_01_002_PASS_SUPER_METHOD_CALL
 * @expect compile-pass
 * @section 7.11.1
 * @design super 形式：super.method() 调用超类的实例方法
 * @note 正向用例：验证 super.method() 选择超类类型搜索方法
 */
class Base {
    greet(): string {
        return 'Hello'
    }
}
class Derived extends Base {
    greet(): string {
        return super.greet() + ' World'
    }
}
let d: Derived = new Derived()
let msg: string = d.greet()
