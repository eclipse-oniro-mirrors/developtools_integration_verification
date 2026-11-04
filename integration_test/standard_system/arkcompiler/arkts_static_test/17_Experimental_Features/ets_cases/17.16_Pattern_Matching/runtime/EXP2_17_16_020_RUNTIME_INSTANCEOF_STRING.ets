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
 * @id EXP2_17_16_020_RUNTIME_INSTANCEOF_STRING
 * @expect runtime
 * @section 17.16
 * @design 运行时验证 instanceof String 的行为——Object 持有字符串时的类型检查
 * @note 运行时用例：实际执行验证 instanceof String 返回 true，instanceof Number 返回 false
 */
function main(): void {
  let obj: Object = 'hello'
  if (!(obj instanceof String)) {
    throw new Error('FAIL: obj should be instanceof String')
  }
  if (obj instanceof Number) {
    throw new Error('FAIL: obj should NOT be instanceof Number')
  }
  console.log('PASS: instanceof String correctly identifies string object')
}
