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
/*
 * NSM_13_03_011_FAIL_NAMESPACE_MULTIPLE_INITIALIZER
 * @id NSM_13_03_011_FAIL_NAMESPACE_MULTIPLE_INITIALIZER
 * @expect compile-fail
 * @section 13.3
 * @design Spec 要求：合并 namespace 仅一个可有初始化器，否则 compile-time error
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求 Only one of the merging namespaces can have an initializer,
 *       Otherwise a compile-time error occurs，实现允许多个初始化器
 *       分类：D 类（Spec 与实现不一致）
 */
namespace A {
  export let x: int = 1
  console.log('Initializer 1')
}

namespace A {
  export let y: int = 2
  console.log('Initializer 2') // Spec: compile-time error, but ArkTS allows
}
