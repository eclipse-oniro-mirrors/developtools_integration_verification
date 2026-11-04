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
 * @id EXP2_17_16_1_021_RUNTIME_SKIP_ELEMENT
 * @expect runtime
 * @section 17.16.1
 * @design 运行时验证解构跳过元素功能——中间元素被忽略
 * @note 运行时用例：实际执行验证 [a, , b] 跳过第二个元素，a 取第一个，b 取第三个
 */
function main(): void {
  let arr: int[] = [100, 200, 300]
  let [first, , third] = arr
  if (first != 100) {
    throw new Error('FAIL: first should be 100, got: ' + first)
  }
  if (third != 300) {
    throw new Error('FAIL: third should be 300, got: ' + third)
  }
  console.log('PASS: skip element works: first=' + first + ' third=' + third)
}
