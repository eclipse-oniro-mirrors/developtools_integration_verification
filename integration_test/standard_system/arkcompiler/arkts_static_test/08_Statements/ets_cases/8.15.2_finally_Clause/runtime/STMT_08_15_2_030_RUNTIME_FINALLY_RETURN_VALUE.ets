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
 * @id STMT_08_15_2_030_RUNTIME_FINALLY_RETURN_VALUE
 * @expect runtime
 * @section 8.15.2
 * @design finally 中的 return 覆盖 try return

 * @note 运行时用例：实际执行验证finally return覆盖
 */
function finallyOverride(): int { try { return 10 } finally { return 20 } }
function main(): void {
  let r: int = finallyOverride()
  if (r != 20) { throw new Error("assertion: finally return overrides, got " + r) }
  console.log("verified")
}
