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
 * @id LEX_02_07_044_PASS_SOFT_KW_GET_IDENT
 * @expect compile-pass
 * @section 2.7
 * @design 软关键字 get 在非访问器上下文可作标识符
 * @note 正向用例：get 作变量名
 */
function test044(): void {
  let get: int = 1
  let getValue: string = "x"
}
