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
 * @id TYP_03_21_01_010_FAIL_AWAITED_ARRAY_ASSIGN
 * @expect compile-fail
 * @section 3.21.1
 * @design Awaited<Promise<Array<Promise<number>>>> 保留数组内部 Promise，不等于 number[]
 * @note 反向用例：验证 Awaited 遇到 array 停止递归
 */
type AwaitedArrayFail = Awaited<Promise<Array<Promise<number>>>>
function testAwaitedArrayAssignFail(): void {
  let v: AwaitedArrayFail = [1, 2, 3]
}
