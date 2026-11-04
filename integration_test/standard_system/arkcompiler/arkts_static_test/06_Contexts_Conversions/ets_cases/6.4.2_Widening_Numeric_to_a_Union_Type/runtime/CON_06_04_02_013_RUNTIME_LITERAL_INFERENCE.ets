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
 * @id CON_06_04_02_013_RUNTIME_LITERAL_INFERENCE
 * @expect runtime
 * @section 6.4.2
 * @design 字面量推断与 widening 的 instanceof 验证，与 spec 示例一致
 * @note 运行时用例：验证 byte|int 联合中 short→int 的 widening
 */
function main(): void {
  let s: short = 1
  let i: int = 2

  let u: byte | int = 256
  if (!(u instanceof int)) {
    throw new Error('assertion failed: 256 should be int in byte|int')
  }

  u = i
  if (!(u instanceof int)) {
    throw new Error('assertion failed: int→byte|int should be int via subtyping')
  }

  u = s
  if (!(u instanceof int)) {
    throw new Error('assertion failed: short→byte|int should widen to int')
  }

  console.log('Literal inference + widening verified')
}
