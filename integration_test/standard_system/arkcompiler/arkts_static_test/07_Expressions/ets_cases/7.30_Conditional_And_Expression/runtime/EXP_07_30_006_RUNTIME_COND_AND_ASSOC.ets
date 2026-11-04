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
 * @id EXP_07_30_006_RUNTIME_COND_AND_ASSOC
 * @expect runtime
 * @section 7.30
 * @design && 结合律运行时验证

 * @note 运行时用例：实际执行验证&& 结合律
 */
function main(): void {
  let a: boolean = true
  let b: boolean = false
  let c: boolean = true
  let r1: boolean = (a && b) && c
  let r2: boolean = a && (b && c)
  if (r1 != r2) {
    throw new Error('assertion: (a&&b)&&c should equal a&&(b&&c)')
  }
console.log('verified')
}
