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
 * @id EXP2_17_02_021_RUNTIME_FIXED_ARRAY_READ
 * @expect runtime
 * @section 17.2
 * @design FixedArray 边界内元素读访问验证
 * @note 运行时用例：验证通过索引读取 FixedArray 元素值正确
 */
function main(): void {
    let arr: Fixedint[] = [100, 200, 300, 400, 500];

    if (arr[0] != 100) {
        throw new Error('assertion failed: arr[0] expected 100, got ' + arr[0]);
    }
    if (arr[1] != 200) {
    throw new Error('assertion failed: arr[1] expected 200, got ' + arr[1]);
  }
  if (arr[2] != 300) {
    throw new Error('assertion failed: arr[2] expected 300, got ' + arr[2]);
    }
    if (arr[3] != 400) {
        throw new Error('assertion failed: arr[3] expected 400, got ' + arr[3]);
    }
    if (arr[4] != 500) {
        throw new Error('assertion failed: arr[4] expected 500, got ' + arr[4]);
    }

    console.log('verified');
}
