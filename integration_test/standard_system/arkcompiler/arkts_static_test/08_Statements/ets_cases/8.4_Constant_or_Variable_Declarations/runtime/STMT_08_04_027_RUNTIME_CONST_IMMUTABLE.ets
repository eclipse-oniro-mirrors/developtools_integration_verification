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
 * @id STMT_08_04_027_RUNTIME_CONST_IMMUTABLE
 * @expect runtime
 * @section 8.4
 * @design const 变量不可变性验证

 * @note 运行时用例：实际执行验证const不可变
 */
function main(): void {
  const x: int = 100
  let y: int = x + 50
  if (x != 100) { throw new Error("assertion: const unchanged") }
  if (y != 150) { throw new Error("assertion: y = x+50") }
  console.log("verified")
}
