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
 * @id EXP2_17_04_024_RUNTIME_NEGATIVE_DIMENSION_ERROR
 * @expect runtime
 * @section 17.4
 * @design 运行时负维度错误：维度表达式在运行时计算为负值时，应抛出 NegativeArraySizeError
 * @note 运行时用例：实际执行验证运行时负维度触发异常
 */
function main(): void {
  let len: int = -3
  let caught: boolean = false
  try {
    let arr = new number[len](0)
  } catch (e) {
    caught = true
  }
  if (!caught) {
    throw new Error('assertion failed: expected NegativeArraySizeError to be thrown')
  }

  console.log('PASS: negative dimension runtime error check passed')
}
