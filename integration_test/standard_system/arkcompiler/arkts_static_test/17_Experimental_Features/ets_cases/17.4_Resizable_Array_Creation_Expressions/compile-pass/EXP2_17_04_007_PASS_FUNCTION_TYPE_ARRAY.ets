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
 * @id EXP2_17_04_007_PASS_FUNCTION_TYPE_ARRAY
 * @expect compile-pass
 * @section 17.4
 * @design 函数类型数组创建：type Functor = () => void; new Functor[3]((): void => {}) 创建函数类型数组
 * @note 正向用例：验证函数类型（通过顶层 type alias）作为数组元素类型编译通过
 *       ⚠️ SPEC 不一致：编译器 ESE0127 拒绝函数类型数组创建，实现暂不支持
 *       分类：C 类（编译器实现问题）
 */
type Functor = () => void

function testFunctionTypeArrayCreation(): void {
  let arr = new Functor[3]((): void => {})
  console.log(arr.length)
  console.log(arr[0])
}
