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
 * @id STMT_08_14_021_PASS_THROW_IN_IF
 * @expect compile-pass
 * @section 8.14
 * @design 在 if 语句中使用 throw
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testThrowInIf(): void {
  let cond: boolean = true
  if (cond) { try { throw new Error() } catch (e) { console.log("caught") } }
  else { console.log("no throw") }
}
