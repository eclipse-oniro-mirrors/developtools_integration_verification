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
 * @id CON_06_03_01_025_RUNTIME_ENUM_RELATIONAL
 * @expect runtime
 * @section 6.3.1
 * @design 数值基类型枚举的关系比较运行时行为：枚举值作为基类型参与比较
 * @note 运行时用例：实际执行验证枚举值的关系比较
 */
enum Priority {
  Low,
  Medium,
  High
}

function main(): void {
  if (!(Priority.High > Priority.Low)) {
    throw new Error('assertion failed: High(2) > Low(0) should be true')
  }
  if (Priority.Low > Priority.Medium) {
    throw new Error('assertion failed: Low(0) > Medium(1) should be false')
  }
  if (!(Priority.Medium >= Priority.Medium)) {
    throw new Error('assertion failed: Medium >= Medium should be true')
  }
  if (!(Priority.Low < Priority.High)) {
    throw new Error('assertion failed: Low < High should be true')
  }

  let val: int = 0
  if (!(Priority.Medium > val)) {
    throw new Error('assertion failed: Medium(1) > 0 should be true')
  }

  console.log('Enum relational comparison verified')
}
