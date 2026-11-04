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
 * @id STMT_08_15_1_020_PASS_CATCH_TYPE_NARROWING
 * @expect compile-pass
 * @section 8.15.1
 * @design catch 块中通过 instanceof 进行类型收窄
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
class MyErr extends Error { errCode: int = 0; constructor(c: int) { super(); this.errCode = c } }
function testCatchTypeNarrowing(): void {
  try { throw new MyErr(404) } catch (e) {
    if (e instanceof MyErr) { let err: MyErr = e as MyErr; console.log(err.errCode.toString()) } }
}
