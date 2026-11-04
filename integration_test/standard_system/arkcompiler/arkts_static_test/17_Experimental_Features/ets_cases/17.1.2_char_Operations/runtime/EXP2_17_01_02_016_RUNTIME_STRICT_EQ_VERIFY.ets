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
 * @id EXP2_17_01_02_016_RUNTIME_STRICT_EQ_VERIFY
 * @expect runtime
 * @section 17.1.2
 * @design 验证 char === char 严格相等：相同值返回 true，不同值返回 false
 * @note 运行时用例：实际执行验证 char 严格相等运算符
 */
function main(): void {
  let c1: char = c'X'
  let c2: char = c'X'
  let c3: char = c'Y'
  // Same value: === should be true
  if (!(c1 === c2)) {
    throw new Error('assertion failed: c'X' === c'X' should be true')
  }
  // Different value: === should be false
  if (c1 === c3) {
    throw new Error('assertion failed: c'X' === c'Y' should be false')
  }
  // == should also be true for same value
  if (!(c1 == c2)) {
    throw new Error('assertion failed: c'X' == c'X' should be true')
  }
  // == should be false for different value
  if (c1 == c3) {
    throw new Error('assertion failed: c'X' == c'Y' should be false')
  }
  console.log('verified')
}
