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
 * @id CON_06_04_01_020_RUNTIME_FLOAT_WIDENING
 * @expect runtime
 * @section 6.4.1
 * @design float→double 运行时值保留
 * @note 运行时用例：实际执行验证 float widening
 */
function main(): void {
  let i: int = 27
  let f: float = i
  let d: double = f
  if (d != 27.0) {
    throw new Error('float→double, expected 27.0')
  }
  console.log('Float widening verified')
}
