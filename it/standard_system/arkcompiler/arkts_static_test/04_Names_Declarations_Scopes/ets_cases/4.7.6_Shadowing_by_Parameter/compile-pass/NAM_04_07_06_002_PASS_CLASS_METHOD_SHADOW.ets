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
 * @id NAM_04_07_06_002_PASS_CLASS_METHOD_SHADOW
 * @expect compile-pass
 * @section 4.7.6
 * @design 类方法参数遮蔽全局变量
 * @note 正向用例：验证 class SomeClass { method(x: boolean) {} } 方法参数遮蔽编译通过（spec 4.7.6 行1344-1350）
 */
let x: number = 1
function foo(x: string) {
    // 'x' refers to the parameter and has type string
}
class SomeClass {
    method(x: boolean) {
        // 'x' refers to the method parameter and has type boolean
    }
}
x++  // 'x' refers to the global variable
