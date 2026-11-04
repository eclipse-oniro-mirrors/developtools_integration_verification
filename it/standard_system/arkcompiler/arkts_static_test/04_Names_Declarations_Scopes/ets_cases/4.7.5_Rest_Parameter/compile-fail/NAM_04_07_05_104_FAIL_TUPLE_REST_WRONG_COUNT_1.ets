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
 * @id NAM_04_07_05_104_FAIL_TUPLE_REST_WRONG_COUNT_1
 * @expect compile-fail
 * @section 4.7.5
 * @design 元组rest参数数量错误（1个参数代替3个）
 * @note 反向用例：验证 sum(...numbers: [number,number,number]) 调用 sum(1) 数量不匹配编译报错（spec 4.7.5 行1187）
 */
function sum(...numbers: [number, number, number]): number {
    return numbers[0] + numbers[1] + numbers[2]
}
sum(1)
