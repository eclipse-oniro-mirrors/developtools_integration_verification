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
 * @id EXP_07_27_7_RUNTIME_INFINITY_CMP
 * @expect runtime
 * @section 7.27
 * @design 无穷大比较行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */

function main(): void {
  let posInf: double = 1.0 / 0.0
  let negInf: double = -1.0 / 0.0
  if (!(negInf < posInf)) {
    throw new Error('assertion failed')
  }
  if (!(posInf > 0.0)) {
    throw new Error('assertion failed')
  }
console.log('verified')
}
