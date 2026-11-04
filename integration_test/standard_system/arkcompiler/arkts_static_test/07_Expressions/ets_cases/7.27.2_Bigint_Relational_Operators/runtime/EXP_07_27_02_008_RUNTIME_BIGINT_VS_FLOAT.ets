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
 * @id EXP_07_27_02_008_RUNTIME_BIGINT_VS_FLOAT
 * @expect runtime
 * @section 7.27.2
 * @design bigint vs float 关系比较（都转 double）
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  let a: bigint = BigInt('100')
  let b: float = 200.5f
  let c1: boolean = a < b
  if (c1 != true) { throw new Error('assertion failed: 100n < 200.5f should be true')
}
console.log('verified')
}
