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
 * @id EXP_07_14_020_FAIL_SUPER_CHAINING
 * @expect compile-fail
 * @section 7.14
 * @design super 表达式使用链式操作符 `?.`：this?./super?. 应编译时错误
 * @note 反向用例：super 不为 nullish，使用 ?. 无意义，应编译时错误
 */
class Base020 {
    bar(): void {}
}
class Derived020 extends Base020 {
    foo(): void {
        let x = super?.bar()
}
}
