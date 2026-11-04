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
 * @id SEM_15_02_07_100_FAIL_FIXED_ARRAY_GAP
 * @expect compile-fail
 * @section 15.2.7
 * @design 验证 FixedObject[] 不是 Fixedstring[] 的子类型（逆变拒绝）
 * @note 反向用例：FixedArray 类型参数不变，Object 数组不可赋值给 string 数组
 *       编译器正确拒绝 ESE0318，与 Spec 一致 ✅
 */
function main(): void {
    let objArr: FixedObject[] = new FixedObject[](3);
    let strArr: Fixedstring[] = objArr;
}
