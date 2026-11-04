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
 * @id CON_06_03_01_026_RUNTIME_ENUM_EQUALITY
 * @expect runtime
 * @section 6.3.1
 * @design 枚举的相等比较运行时行为
 * @note 运行时用例：实际执行验证枚举值的 == != 语义
 */
enum Status {
  Active,
  Inactive,
  Pending
}

function main(): void {
  if (!(Status.Active == Status.Active)) {
    throw new Error('assertion failed: Active == Active should be true')
  }
  if (Status.Active == Status.Inactive) {
    throw new Error('assertion failed: Active == Inactive should be false')
  }
  if (!(Status.Active != Status.Inactive)) {
    throw new Error('assertion failed: Active != Inactive should be true')
  }
  if (Status.Active != Status.Active) {
    throw new Error('assertion failed: Active != Active should be false')
  }

  console.log('Enum equality comparison verified')
}
