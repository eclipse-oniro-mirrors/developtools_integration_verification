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
 * @id EXP2_17_15_013_RUNTIME_SETTER_UPDATE
 * @expect runtime
 * @section 17.15
 * @design 验证 setter 正确更新 backing 变量状态
 * @note 运行时用例：setter 赋值应修改 backing 变量值
 */
let g_stored: int = 0

set storeValue(v: int) {
  g_stored = v
}

function main(): void {
  g_stored = 0
  storeValue = 100
  if (g_stored != 100) {
    throw new Error("assertion failed: expected 100, got " + g_stored)
  }
  console.log("verified: setter stored " + g_stored)
}
