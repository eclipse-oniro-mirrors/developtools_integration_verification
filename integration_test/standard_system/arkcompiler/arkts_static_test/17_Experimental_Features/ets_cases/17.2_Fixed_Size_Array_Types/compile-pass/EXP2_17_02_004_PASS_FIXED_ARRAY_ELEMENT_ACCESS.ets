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
 * @id EXP2_17_02_004_PASS_FIXED_ARRAY_ELEMENT_ACCESS
 * @expect compile-pass
 * @section 17.2
 * @design FixedArray 元素读写访问
 * @note 正向用例：验证通过索引读取和写入 FixedArray 元素
 */
function testElementAccess(): void {
    let arr: Fixedint[] = [10, 20, 30, 40, 50];
    let val: int = arr[0];
    arr[2] = 99;
    let updated: int = arr[2];
}
