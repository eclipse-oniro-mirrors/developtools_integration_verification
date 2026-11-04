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
 * @id EXP2_17_02_006_PASS_FIXED_ARRAY_TYPE_ERASURE
 * @expect compile-pass
 * @section 17.2
 * @design FixedArray 类型擦除保留（泛型上下文）
 * @note 正向用例：验证 FixedArray 在泛型函数中保留元素类型
 */
function getFirstElement<T>(arr: FixedT[]): T {
    return arr[0];
}

let numArr: Fixednumber[] = [100, 200, 300];
let firstNum: number = getFirstElement<number>(numArr);

let strArr: Fixedstring[] = ['a', 'b', 'c'];
let firstStr: string = getFirstElement<string>(strArr);
