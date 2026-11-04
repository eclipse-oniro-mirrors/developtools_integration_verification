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
 * @id STMT_08_03_028_RUNTIME_BLOCK_IN_LOOP
 * @expect runtime
 * @section 8.3
 * @design 循环中的块创建新作用域每次迭代

 * @note 运行时用例：实际执行验证循环块作用域
 */
function main(): void {
  let sum: int = 0
  for (let i: int = 0; i < 3; i++) {
    { let v: int = i * 10; sum = sum + v }
  }
  if (sum != 30) { throw new Error("assertion: 0+10+20=30") }
  console.log("verified")
}
