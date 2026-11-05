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
 * @id EXP_07_14_016_FAIL_SUPER_CHAINING
 * @expect compile-fail
 * @section 7.14
 * @design Chaining_Operator中int+boolean关系运算类型不匹配
 * @note 对抗用例: Chaining_Operator中int与boolean关系运算应被编译器拒绝
 */
class Base016 {
    bar(): void {}
}
class Derived016 extends Base016 {
    foo(): void {
        let x = super?.bar()
}
}
