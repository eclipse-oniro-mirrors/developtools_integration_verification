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
 * @id STMT_08_05_031_PASS_IF_DANGLING
 * @expect compile-pass
 * @section 8.5
 * @design else 匹配最近 if — 验证歧义消除
 * @note 正向用例：验证该场景受 Extended Conditional Expressions 影响编译通过（STMT-D1）。
 */
function testIfDanglingElse(): void {
  let x: int = 0
  if (true) if (false) x = 1
  else x = 2
  if (x != 2) { console.log("unexpected") }
}
