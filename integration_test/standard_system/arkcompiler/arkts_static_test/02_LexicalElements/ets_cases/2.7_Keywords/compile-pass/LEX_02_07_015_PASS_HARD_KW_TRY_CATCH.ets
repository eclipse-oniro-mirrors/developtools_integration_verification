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
 * @id LEX_02_07_015_PASS_HARD_KW_TRY_CATCH
 * @expect compile-pass
 * @section 2.7
 * @design 硬关键字: try/catch/throw (注：catch 在 spec 中也列为软关键字)
 * @note 正向用例：异常处理
 */
function test015(): void {
  try {
    throw new Error("test")
  } catch (e) {
    let msg: string = "caught"
  }
}
