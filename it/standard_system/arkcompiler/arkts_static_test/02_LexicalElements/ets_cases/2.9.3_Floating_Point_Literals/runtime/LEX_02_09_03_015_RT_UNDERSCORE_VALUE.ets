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
 * @id LEX_02_09_03_015_RT_UNDERSCORE_VALUE
 * @expect runtime
 * @section 2.9.3
 * @design 下划线不影响值验证
 * @note runtime 用例：验证下划线分隔符不影响数值
 */

function main(): void {
  // 验证下划线不影响值
  let x1: double = 3.141_592
  let x2: double = 3.141592

  if (x1 !== x2) { throw new Error("underscore value mismatch") }
}
