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
 * @id LEX_02_07_089_PASS_OF_KEYWORD
 * @expect compile-pass
 * @section 2.7
 * @design of 关键字
 * @note compile-pass 用例：验证 of 关键字
 */

// of 关键字 - for-of 循环
let arr = [1, 2, 3]
for (let item of arr) {
  let x = item
}
