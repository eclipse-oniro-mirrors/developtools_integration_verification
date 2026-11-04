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
 * @id TYP_03_21_07_009_RUNTIME_VOID
 * @expect runtime
 * @section 3.21.7
 * @design ReturnType<void> 提取后为 void/undefined
 * @note 运行时用例
 */
type RVoid9 = ReturnType<() => void>

function main(): void {
  let v: RVoid9 = undefined
  if (v !== undefined) throw new Error("void return type failed")
  console.log("ReturnType void runtime verified")
}