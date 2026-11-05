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
 * @id LEX_02_07_047_PASS_FUTURE_KW_STRUCT
 * @expect compile-pass
 * @section 2.7
 * @design 未来保留软关键字: struct 当前可作普通标识符（ArkUI 上下文外）
 * @note 正向用例：struct 作变量名
 */
function test047(): void {
  let struct: int = 1
  let structSize: int = 0
}
