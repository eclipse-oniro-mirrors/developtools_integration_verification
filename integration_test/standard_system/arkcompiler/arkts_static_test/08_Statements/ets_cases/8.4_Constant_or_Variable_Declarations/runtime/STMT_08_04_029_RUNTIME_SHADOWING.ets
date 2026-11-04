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
 * @id STMT_08_04_029_RUNTIME_SHADOWING
 * @expect runtime
 * @section 8.4
 * @design 变量遮蔽运行时验证

 * @note 运行时用例：实际执行验证变量遮蔽
 */
function main(): void {
  let item: int = 123
  { const item: string = "shadow"
    if (item != "shadow") { throw new Error("assertion: shadow in block") } }
  if (item != 123) { throw new Error("assertion: original item") }
  console.log("verified")
}
