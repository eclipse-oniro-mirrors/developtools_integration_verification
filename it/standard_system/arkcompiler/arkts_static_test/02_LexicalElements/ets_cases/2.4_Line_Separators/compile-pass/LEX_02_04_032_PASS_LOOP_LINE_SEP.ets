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
 * @id LEX_02_04_032_PASS_LOOP_LINE_SEP
 * @expect compile-pass
 * @section 2.4
 * @design 循环语句内换行
 * @note compile-pass 用例：验证循环语句中的换行符
 */

// for 循环内换行
for (let i = 0; i < 10; i++) {
  let x = i + 1
}

// while 循环内换行
let i = 0
while (i < 10) {
  let x = i + 1
  i++
}

// for-of 循环内换行
let arr = [1, 2, 3]
for (let item of arr) {
  let x = item + 1
}
