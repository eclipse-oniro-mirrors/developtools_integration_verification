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
 * @id STMT_08_15_024_PASS_TRY_CATCH_FINALLY
 * @expect compile-pass
 * @section 8.15
 * @design try-catch-finally 完整结构
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testTryCatchFinally(): void {
  try { let x: int = 1 } catch (e) { console.log("catch") } finally { console.log("finally") }
}
