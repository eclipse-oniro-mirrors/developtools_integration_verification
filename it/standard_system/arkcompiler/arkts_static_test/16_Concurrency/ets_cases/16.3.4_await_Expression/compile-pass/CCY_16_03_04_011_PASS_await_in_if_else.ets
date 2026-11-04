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
 * @id CCY_16_03_04_011_PASS_await_in_if_else
 * @expect compile-pass
 * @section 16.3.4
 * @design await 在 if/else 条件分支中
 * @note 正向用例：验证 await 在条件分支中通过编译
 */
async function conditional(flag: boolean): Promise<number> {
    if (flag) {
    return await Promise.resolve(1);
  } else {
    return await Promise.resolve(0);
    }
}
