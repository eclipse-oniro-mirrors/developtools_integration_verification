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
 * @id AMB_14_07_01_007_RUNTIME_IMPLEMENTED_NS
 * @expect runtime
 * @section 14.7.1
 * @design 实现的 ambient namespace 与 main 共存，验证可正常运行
 * @note 运行时用例：spec 允许，但编译器当前拒绝，暂无法执行
 *       ⚠️ SPEC 不一致：当前编译器报 "Unable to merge namespaces"（modifier 不同），待修复
 *       分类：D 类（Spec 与实现不一致）
 */
declare namespace A {
  function foo(): void
}
namespace A {
  function foo(): void {}
}

function main(): void {
  let x: int = 1
  if (x != 1) {
    throw new Error('assertion failed')
  }
  console.log('verified')
}
