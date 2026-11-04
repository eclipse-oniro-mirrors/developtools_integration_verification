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
 * @id STMT_08_15_006_PASS_try_in_if_statement
 * @expect compile-pass
 * @section 8.15
 * @design 验证 try-catch 语句可以放在 if 语句体内，与其他控制流结构组合
 * @note try 语句作为语句的一种，可以出现在任何语句位置，包括 if/while/for 体内
 */
function testTryInIf(): void {
  let cond: boolean = true;
  let result: int = 0;

  if (cond) {
    try {
      result = 100;
    } catch (e) {
      result = -1;
    }
  }

  if (!cond) {
    try {
      result = 200;
    } finally {
      result = 300;
    }
  }
}
