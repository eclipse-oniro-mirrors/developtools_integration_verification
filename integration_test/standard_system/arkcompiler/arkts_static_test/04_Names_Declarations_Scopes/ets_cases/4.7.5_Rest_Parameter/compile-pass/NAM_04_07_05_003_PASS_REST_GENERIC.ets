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
 * @id NAM_04_07_05_003_PASS_REST_GENERIC
 * @expect compile-pass
 * @section 4.7.5
 * @design rest参数-泛型类型参数
 * @note 正向用例：验证泛型类型参数作为 rest 参数
 */
function sumGen<T extends Array<number>>(...numbers: T): number {
    let res: number = 0;
    for (let n of numbers) {
        res += n;
    }
    return res;
}
