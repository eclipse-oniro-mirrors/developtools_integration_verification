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
 * @id EXP_07_27_006_RUNTIME_RELATIONAL_CHAINING
 * @expect runtime
 * @section 7.27
 * @design 关系运算链式比较

 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  let a: int = 1
  let b: int = 2
  let c: int = 3
  let r1: boolean = a < b
  let r2: boolean = b < c
  let result: boolean = r1 == r2
  if (result != true) {
    throw new Error('assertion failed: (1<2)==(2<3) should be true')
  }
console.log('verified')
}
