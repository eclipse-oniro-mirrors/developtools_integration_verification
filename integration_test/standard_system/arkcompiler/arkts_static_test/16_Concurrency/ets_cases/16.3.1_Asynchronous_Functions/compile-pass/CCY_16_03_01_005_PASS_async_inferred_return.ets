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
 * @id CCY_16_03_01_005_PASS_async_inferred_return
 * @expect compile-pass
 * @section 16.3.1
 * @design async 函数返回类型推断
 * @note 正向用例：验证 async 函数返回类型可推断为 Promise<T> 通过编译
 */
async function getValue() {
    return 42;
}
