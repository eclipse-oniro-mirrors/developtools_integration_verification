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
 * @id EXP2_17_02_014_FAIL_RESIZABLE_ARRAY_PARAM_MISMATCH
 * @expect compile-fail
 * @section 17.2
 * @design ResizableArray 传递给期望 FixedArray 的函数参数编译错误
 * @note 反向用例：验证 number[] 不能传递给期望 Fixednumber[] 的函数参数
 */
function processFixedArray(arr: Fixednumber[]): void {
    let len: int = arr.length;
}

let resizableArr: number[] = [1, 2, 3];
processFixedArray(resizableArr);
