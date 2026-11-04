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
 * @id STMT_08_03_030_RUNTIME_BLOCK_WITH_IF_ELSE
 * @expect runtime
 * @section 8.3
 * @design if-else 与块作用域组合

 * @note 运行时用例：实际执行验证if-else块
 */
function main(): void {
  let x: int = 0
  if (true) { let y: int = 10; x = y } else { let z: int = 20; x = z }
  if (x != 10) { throw new Error("assertion: true branch") }
  console.log("verified")
}
