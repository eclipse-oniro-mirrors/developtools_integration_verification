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
 * @id STMT_08_03_029_RUNTIME_BLOCK_RETURN_FROM_BLOCK
 * @expect runtime
 * @section 8.3
 * @design 从块中 return 返回函数

 * @note 运行时用例：实际执行验证块中return
 */
function blockReturn(): int { { return 42 } }
function main(): void {
  let r: int = blockReturn()
  if (r != 42) { throw new Error("assertion: return from block") }
  console.log("verified")
}
