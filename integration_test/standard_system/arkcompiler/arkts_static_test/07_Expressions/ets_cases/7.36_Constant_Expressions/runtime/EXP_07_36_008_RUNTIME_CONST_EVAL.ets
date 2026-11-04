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
 * @id EXP_07_36_008_RUNTIME_CONST_EVAL
 * @expect runtime
 * @section 7.36
 * @design 编译期常量求值正确性验证
 * @note 运行时用例：实际执行验证编译期常量求值
 */
const PI: double = 3.14159
const TWO: int = 2
function main(): void {
  let twoPi: double = PI * TWO as double
  if (twoPi <= 6.28) {
    throw new Error('assertion failed: TWO_PI should be > 6.28')
  }
  if (twoPi >= 6.29) {
    throw new Error('assertion failed: TWO_PI should be < 6.29')
  }
  console.log('verified')
}
