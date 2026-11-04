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
 * @id STMT_08_15_2_027_PASS_FINALLY_RETURN
 * @expect compile-pass
 * @section 8.15.2
 * @design finally 中 return 会覆盖 try 中的 return
 * @note 正向用例：验证该场景受 Extended Conditional Expressions 影响编译通过（STMT-D1）。
 */
function testFinallyReturnOverrideFail(): int {
  try { return 1 } finally { return 2 }
}
function testCallOverride(): void {
  let r: int = testFinallyReturnOverrideFail()
  console.log(r.toString())
}
