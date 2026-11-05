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
 * @id NAM_04_07_06_201_RUNTIME_SHADOW_GLOBAL
 * @expect runtime
 * @section 4.7.6
 * @design 类方法参数遮蔽后全局变量未被修改
 * @note 运行时用例：验证参数遮蔽不影响全局变量 x，x++ 操作全局变量（spec 4.7.6 行1338-1352）
 */
let x: number = 1
function foo(x: string): void {
    // 'x' refers to the parameter, not global
}
class SomeClass {
    method(x: boolean): void {
        // 'x' refers to the method parameter
    }
}
function main(): void {
    if (x != 1) throw new Error("assertion failed: initial x = " + x)
    foo("test")
    if (x != 1) throw new Error("assertion failed: x after foo = " + x)
    let s = new SomeClass()
    s.method(true)
    if (x != 1) throw new Error("assertion failed: x after method = " + x)
    x++  // refers to global variable
    if (x != 2) throw new Error("assertion failed: x after x++ = " + x)
    console.log("verified")
}
