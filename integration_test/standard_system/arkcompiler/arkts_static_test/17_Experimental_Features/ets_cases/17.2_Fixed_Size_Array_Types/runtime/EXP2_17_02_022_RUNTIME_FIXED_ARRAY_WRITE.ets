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
 * @id EXP2_17_02_022_RUNTIME_FIXED_ARRAY_WRITE
 * @expect runtime
 * @section 17.2
 * @design FixedArray 边界内元素写后读访问验证
 * @note 运行时用例：验证通过索引写入 FixedArray 元素后再读取值正确
 */
function main(): void {
    let arr: Fixednumber[] = [1, 2, 3, 4];
    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;

    if (arr[0] != 10) {
        throw new Error('assertion failed: arr[0] expected 10, got ' + arr[0]);
    }
    if (arr[1] != 20) {
        throw new Error('assertion failed: arr[1] expected 20, got ' + arr[1]);
    }
    if (arr[2] != 30) {
        throw new Error('assertion failed: arr[2] expected 30, got ' + arr[2]);
    }
    if (arr[3] != 40) {
        throw new Error('assertion failed: arr[3] expected 40, got ' + arr[3]);
    }

    console.log('verified');
}
