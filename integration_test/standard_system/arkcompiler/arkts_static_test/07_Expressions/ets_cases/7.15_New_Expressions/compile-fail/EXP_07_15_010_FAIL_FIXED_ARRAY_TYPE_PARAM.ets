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
 * @id EXP_07_15_010_FAIL_FIXED_ARRAY_TYPE_PARAM
 * @expect compile-fail
 * @section 7.15
 * @design 验证 FixedT[] 使用类型参数作为元素类型编译时错误
 * @note 反向用例：FixedArray 元素类型不能是类型参数
 */
class A<T> {
  foo(element: T): void {
    let a = new FixedT[](5, element)
  }
}
