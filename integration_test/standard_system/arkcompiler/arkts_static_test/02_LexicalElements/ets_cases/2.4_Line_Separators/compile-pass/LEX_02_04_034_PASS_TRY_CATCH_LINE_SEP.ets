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
 * @id LEX_02_04_034_PASS_TRY_CATCH_LINE_SEP
 * @expect compile-pass
 * @section 2.4
 * @design try-catch 内换行
 * @note compile-pass 用例：验证 try-catch 语句中的换行符
 */

// try-catch 内换行
function test(): void {
  try {
    let x = 1
    let y = 2
  } catch (e) {
    let z = 3
  } finally {
    let w = 4
  }
}
