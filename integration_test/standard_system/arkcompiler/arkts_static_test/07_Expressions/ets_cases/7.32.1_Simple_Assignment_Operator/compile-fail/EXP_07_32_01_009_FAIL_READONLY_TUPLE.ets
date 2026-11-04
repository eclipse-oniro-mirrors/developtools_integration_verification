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
 * @id EXP_07_32_01_009_FAIL_READONLY_TUPLE
 * @expect compile-fail
 * @section 7.32.1
 * @design 验证只读元组变量不能赋值为非只读元组的编译时错误
 * @note 反向用例：验证 readonly [T1, T2] 类型变量不能被赋值为非只读元组。根据规范，Type of lhsExpression 是 readonly tuple
 *       而 rhsExpression 的转换后类型是非 readonly tuple 时产生编译时错误
 *       分类：D 类（Spec 与实现不一致）
 *       ⚠️ SPEC 不一致：readonly tuple 可被赋值为 tuple，但 spec 要求报错
 */

function main(): void {
  // 非只读元组
  let src: [int, string] = [1, 'hello'];

  // 只读元组变量
  let dest: readonly [int, string] = [0, ''];

  // 尝试将非只读元组赋值给只读元组变量（应报错）
  dest = src;

  console.log('verified');
}
