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
 * @id LEX_02_07_092_PASS_SWITCH_CASE_KEYWORD
 * @expect compile-pass
 * @section 2.7
 * @design switch-case 关键字
 * @note compile-pass 用例：验证 switch-case 关键字
 */

// switch-case 关键字
let x = 1
let result = 0

switch (x) {
  case 1:
    result = 10
    break
  case 2:
    result = 20
    break
  default:
    result = 0
    break
}
