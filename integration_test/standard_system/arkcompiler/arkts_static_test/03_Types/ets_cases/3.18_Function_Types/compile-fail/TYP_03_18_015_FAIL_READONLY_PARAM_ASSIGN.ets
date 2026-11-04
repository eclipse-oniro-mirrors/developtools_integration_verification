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
 * @id TYP_03_18_015_FAIL_READONLY_PARAM_ASSIGN
 * @expect compile-fail
 * @section 3.18
 * @design 函数类型 readonly 参数内赋值应产生编译时错误
 * @note 反向用例：验证 readonly 数组参数在函数体内不能修改
 */
type ReadOnlyArrayOp = (arr: readonly int[]) => void

function testReadonlyParamAssign(): void {
  let op: ReadOnlyArrayOp = (arr: readonly int[]): void => {
    arr[0] = 99 // Compile-time error: readonly array element cannot be assigned
  }
}