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
 * @id EXP2_17_16_1_005_PASS_SINGLE_ELEMENT
 * @expect compile-pass
 * @section 17.16.1
 * @design 单元数组解构——let [a] = arr 从单元素数组提取值
 * @note 正向用例：验证单元素数组解构编译通过
 */
function testSingleElement(): void {
  let arr: int[] = [99]
  let [val] = arr
  console.log('val=' + val)
}
