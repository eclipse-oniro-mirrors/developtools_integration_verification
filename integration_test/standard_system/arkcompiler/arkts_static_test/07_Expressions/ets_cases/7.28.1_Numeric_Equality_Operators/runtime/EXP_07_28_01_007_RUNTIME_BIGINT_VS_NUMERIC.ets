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
 * @id EXP_07_28_01_007_RUNTIME_BIGINT_VS_NUMERIC
 * @expect runtime
 * @section 7.28.1
 * @design bigint == numeric 返回 false（非编译错误）

 * @note 运行时用例：实际执行验证bigint vs numeric 相等
 */
function main(): void {
  let a: bigint = 5n
  let b: int = 5
  let r: boolean = a == b
  if (r != false) {
    throw new Error('assertion failed: bigint == numeric should be false')
  }
console.log('verified')
}
