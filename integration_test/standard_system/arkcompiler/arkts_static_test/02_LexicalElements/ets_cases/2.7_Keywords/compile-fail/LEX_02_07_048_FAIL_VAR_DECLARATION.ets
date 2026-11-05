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
 * @id LEX_02_07_048_FAIL_VAR_DECLARATION
 * @expect compile-fail
 * @section 2.7
 * @design var 在 ArkTS 中作变量声明关键字不可用（必须用 let 或 const）
 * @note 反向用例：var 作变量声明应失败
 */
function test048(): void {
  var x: int = 1
}
