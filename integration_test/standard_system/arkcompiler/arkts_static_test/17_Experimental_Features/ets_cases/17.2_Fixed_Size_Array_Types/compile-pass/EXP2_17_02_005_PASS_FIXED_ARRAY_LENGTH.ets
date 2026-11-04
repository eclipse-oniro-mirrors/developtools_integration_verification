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
 * @id EXP2_17_02_005_PASS_FIXED_ARRAY_LENGTH
 * @expect compile-pass
 * @section 17.2
 * @design FixedArray length 属性读取
 * @note 正向用例：验证可以读取 FixedArray 的 length 属性
 */
function testLengthProperty(): void {
    let arr: Fixedint[] = [1, 2, 3];
    let len: int = arr.length;
    if (len > 0) {
        let first: int = arr[0];
    }
}
