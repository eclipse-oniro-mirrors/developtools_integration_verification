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
 * @id CON_06_04_019_RUNTIME_WIDENING_TO_UNION
 * @expect runtime
 * @section 6.4
 * @design Widening to Union Type 运行时值保留
 * @note 运行时用例：实际执行验证 widening 到联合类型的值不变
 */
function main(): void {
  let a: int = 10
  let b: int | long = a
  if (b != 10) {
    throw new Error('assertion failed: int|long should be 10')
  }

  let c: int = 5
  let d: int | double = c
  if (d != 5) {
    throw new Error('assertion failed: int|double should be 5')
  }

  let e: int = 0
  let f: int | long | double = e
  if (f != 0) {
    throw new Error('assertion failed: int|long|double should be 0')
  }

  console.log('Widening to union type verified')
}
