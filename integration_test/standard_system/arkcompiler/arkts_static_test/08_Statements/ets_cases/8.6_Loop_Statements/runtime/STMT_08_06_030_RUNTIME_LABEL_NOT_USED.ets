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
 * @id STMT_08_06_030_RUNTIME_LABEL_NOT_USED
 * @expect runtime
 * @section 8.6
 * @design label 未使用 — es2panda 编译通过（STMT-G1 已知差异）

 * @note 运行时用例：实际执行验证未使用label
 */
function main(): void {
  unused_label: for (let i: int = 0; i < 3; i++) { console.log("iter") }
  console.log("verified")
}
