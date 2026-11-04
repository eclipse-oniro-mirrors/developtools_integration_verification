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
 * @id EXP_07_32_03_021_FAIL_READONLY_FIELD_LHS
 * @expect compile-fail
 * @section 7.32.3
 * @design 验证 readonly 字段/数组元素不能作为左值：readonly 字段的访问表达式不可出现在赋值左侧，readonly 数组元素也不可赋值
 * @note 反向用例：Spec 明确禁止引用 readonly 实体的表达式作为左值，应产生 compile-time error
 */

class Data {
  public readonly id: int = 1;
}

function main(): void {
  // readonly 字段作为左值（应报错）
  let d: Data = new Data();
  d.id = 99;

  console.log('verified');
}
