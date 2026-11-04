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
 * @id EXP_07_02_01_022_RUNTIME_TARGET_TYPE_FUNC
 * @expect runtime
 * @section 7.2.1
 * @design 函数参数 target type 确保正确的类型传递
 * @note 运行时用例：验证函数参数 target type 运行时正确
 */
function doubleIt(x: int): int {
  return x * 2
}

function main(): void {
  let r = doubleIt(21)
  if (r != 42) {
    throw new Error('assertion failed: doubleIt(21) != 42, got ' + r)
  }
console.log('verified')
}
