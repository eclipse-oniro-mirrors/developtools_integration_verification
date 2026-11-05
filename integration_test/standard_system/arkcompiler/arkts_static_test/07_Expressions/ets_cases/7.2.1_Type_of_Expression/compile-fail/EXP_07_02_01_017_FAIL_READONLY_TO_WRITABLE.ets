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
 * @id EXP_07_02_01_017_FAIL_READONLY_TO_WRITABLE
 * @expect compile-fail
 * @section 7.2.1
 * @design readonly 数组传给 writable 参数，应编译时错误
 * @note 反向用例：验证 readonly 类型不能传给 non-readonly 参数
 */
function takeWritableArray(arr: int[]): void {}

function testReadonlyToWritable(): void {
  let arr: readonly int[] = [1, 2, 3]
  takeWritableArray(arr)
}
