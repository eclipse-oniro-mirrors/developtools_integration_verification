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
 * @id CON_06_03_019_RUNTIME_UNARY_NUMERIC
 * @expect runtime
 * @section 6.3
 * @design 一元运算运行时行为: + - ~ 对 int/long
 * @note 运行时用例：实际执行验证一元运算符结果
 */
function main(): void {
  let a: int = 10
  if (+a != 10) {
    throw new Error('assertion failed: +10 should be 10')
  }
  if (-a != -10) {
    throw new Error('assertion failed: -10 should be -10')
  }
  if (~a != -11) {
    throw new Error('assertion failed: ~10 should be -11')
  }

  let b: int = 0
  if (~b != -1) {
    throw new Error('assertion failed: ~0 should be -1')
  }

  console.log('Unary numeric verified')
}
