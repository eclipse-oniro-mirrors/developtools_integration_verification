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
 * @id STMT_08_14_022_PASS_THROW_IN_LOOP
 * @expect compile-pass
 * @section 8.14
 * @design 在循环中使用 throw（被 catch 捕获）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testThrowInLoop(): void {
  for (let i: int = 0; i < 5; i++) {
    try { if (i == 2) throw new Error() } catch (e) { console.log("caught") }
  }
}
