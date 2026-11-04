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
 * @id ERR_12_01_003_PASS_TRY_CATCH
 * @expect compile-pass
 * @section 12.1
 * @design try-catch 基本写法合法
 * @note 正向用例
 */
function testTryCatch(): void {
  try {
    throw new Error("err")
  } catch (x) {
    let msg: string = x.message
  }
}