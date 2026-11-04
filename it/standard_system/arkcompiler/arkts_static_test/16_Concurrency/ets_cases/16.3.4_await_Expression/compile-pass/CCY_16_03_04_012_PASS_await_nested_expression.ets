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
 * @id CCY_16_03_04_012_PASS_await_nested_expression
 * @expect compile-pass
 * @section 16.3.4
 * @design 嵌套 await 表达式
 * @note 正向用例：验证 await 表达式嵌套通过编译
 */
async function outer(): Promise<number> {
    let v: number = await (await Promise.resolve(Promise.resolve(42)));
    return v;
}
