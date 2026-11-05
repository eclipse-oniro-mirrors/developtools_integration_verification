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
 * @id EXP_07_27_04_005_RUNTIME_BOOLEAN_TRUTH_TABLE
 * @expect runtime
 * @section 7.27.4
 * @design 布尔关系真值表验证

 * @note 运行时用例：实际执行验证布尔关系真值表
 */
function main(): void {
  if (false < true != true) {
    throw new Error('assertion failed: false < true')
  }
  if (true < false != false) {
    throw new Error('assertion failed: true < false')
  }
  if (false > true != false) {
    throw new Error('assertion failed: false > true')
  }
  if (true > false != true) {
    throw new Error('assertion failed: true > false')
  }
  if (false <= false != true) {
    throw new Error('assertion failed: false <= false')
  }
  if (true >= true != true) {
    throw new Error('assertion failed: true >= true')
  }
  console.log('verified')
}
