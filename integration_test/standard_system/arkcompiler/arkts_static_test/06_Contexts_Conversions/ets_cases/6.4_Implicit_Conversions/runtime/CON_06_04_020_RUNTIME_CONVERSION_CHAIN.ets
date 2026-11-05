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
 * @id CON_06_04_020_RUNTIME_CONVERSION_CHAIN
 * @expect runtime
 * @section 6.4
 * @design 转换链运行时值保留: enum→int→long→double
 * @note 运行时用例：实际执行验证多重转换链值不变
 */
enum Base {
  A,
  B,
  C
}

function main(): void {
  let v: int = Base.B
  if (v != 1) {
    throw new Error('assertion failed: Base.B→int should be 1')
  }

  let w: long = v
  if (w != 1) {
    throw new Error('assertion failed: 1→long should be 1')
  }

  let x: double = w
  if (x != 1.0) {
    throw new Error('assertion failed: 1→double should be 1.0')
  }

  let y: int = Base.A
  let z: double = y
  if (z != 0.0) {
    throw new Error('assertion failed: 0→double should be 0.0')
  }

  console.log('Conversion chain verified')
}
