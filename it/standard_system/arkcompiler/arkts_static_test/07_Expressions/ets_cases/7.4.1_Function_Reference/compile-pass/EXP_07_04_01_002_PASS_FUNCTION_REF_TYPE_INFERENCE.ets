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
 * @id EXP_07_04_01_002_PASS_FUNCTION_REF_TYPE_INFERENCE
 * @expect compile-pass
 * @section 7.4.1
 * @design 函数引用类型推导：验证不同签名的函数引用类型推导正确
 * @note 正向用例：验证多参数、无参数、void 返回等函数签名的引用编译通过
 */
function add(a: number, b: number): number {
  return a + b
}

function greet(): string {
  return 'hello'
}

function log(msg: string): void {
  console.log(msg)
}

let f1 = add   // 推断为函数引用类型
let f2 = greet // 推断为无参函数引用类型
let f3 = log   // 推断为带参函数引用类型
