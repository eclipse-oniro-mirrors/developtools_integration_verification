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
 * @id CON_06_04_016_RUNTIME_WIDENING_VALUES
 * @expect runtime
 * @section 6.4
 * @design Widening Numeric Conversion 运行时值保留: int→long, int→double
 * @note 运行时用例：实际执行验证 widening 后值不变
 */
function main(): void {
  let a: int = 42
  let b: long = a
  if (b != 42) {
    throw new Error('assertion failed: int→long 42 should remain 42')
  }

  let c: int = -10
  let d: double = c
  if (d != -10.0) {
    throw new Error('assertion failed: int→double -10 should be -10.0')
  }

  let e: byte = 100
  let f: int = e
  if (f != 100) {
    throw new Error('assertion failed: byte→int 100 should remain 100')
  }

  console.log('Widening values verified')
}
