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
 * @id CCY_16_03_04_006_PASS_await_union_type
 * @expect compile-pass
 * @section 16.3.4
 * @design await 联合类型 Promise<T> | T 的表达式
 * @note 正向用例：验证 await 在 Promise<T> | T 联合类型的编译通过
 *       spec 示例：await 条件表达式返回 Promise<T> 或 T
 */
async function condAsync(flag: boolean): Promise<string> {
    if (flag) {
        return 'direct';
    }
    return 'also_direct';
}
async function f(): Promise<void> {
    let v: string = await (condAsync(true));
    console.log(v);
}
