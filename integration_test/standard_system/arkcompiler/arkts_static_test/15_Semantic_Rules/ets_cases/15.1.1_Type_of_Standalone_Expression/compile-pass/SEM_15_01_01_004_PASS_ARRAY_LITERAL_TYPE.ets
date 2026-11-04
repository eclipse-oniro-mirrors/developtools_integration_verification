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
 * @id SEM_15_01_01_004_PASS_ARRAY_LITERAL_TYPE
 * @expect compile-pass
 * @section 15.1.1
 * @design 验证数组字面量类型从元素推断
 * @note 正向用例：[1, 2, 3] 应推断为 int[] 类型
 */
function main(): void {
    let arr = [1, 2, 3];
    let first: int = arr[0];
    console.log(`first=${first}`);
}
