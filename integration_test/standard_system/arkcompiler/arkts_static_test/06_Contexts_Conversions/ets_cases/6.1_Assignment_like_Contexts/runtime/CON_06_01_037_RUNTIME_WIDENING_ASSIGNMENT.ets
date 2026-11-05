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
 * @id CON_06_01_037_RUNTIME_WIDENING_ASSIGNMENT
 * @expect runtime
 * @section 6.1
 * @design 隐式 widening 转换运行时行为：int -> number 值正确保留
 * @note 运行时用例：实际执行验证 widening conversion 值不发生改变
 */
function main(): void {
  let intVal: int = 42
  let numVal: number = intVal
  if (numVal != 42) {
    throw new Error('assertion failed: numVal expected 42, got ' + numVal)
  }

  let smallVal: int = 0
  let wideVal: number = smallVal
  if (wideVal != 0) {
    throw new Error('assertion failed: wideVal expected 0')
  }

  let negVal: int = -100
  let negWide: number = negVal
  if (negWide != -100) {
    throw new Error('assertion failed: negWide expected -100')
  }

  console.log('Widening assignment verified')
}
