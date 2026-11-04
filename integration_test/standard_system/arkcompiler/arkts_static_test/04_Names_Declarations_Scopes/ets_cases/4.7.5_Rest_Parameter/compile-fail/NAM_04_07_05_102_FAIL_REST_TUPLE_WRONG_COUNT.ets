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
 * @id NAM_04_07_05_102_FAIL_REST_TUPLE_WRONG_COUNT
 * @expect compile-fail
 * @section 4.7.5
 * @design rest元组参数数量不匹配
 * @note 反向用例：验证 rest 元组类型参数数量不匹配编译错误
 */
function sumTwo(...nums: [number, number, number]): number {
    return nums[0] + nums[1] + nums[2];
}
let r = sumTwo();
