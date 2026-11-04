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
 * @id EXP2_17_16_1_013_FAIL_REST_ELEMENT
 * @expect compile-fail
 * @section 17.16.1
 * @design 解构中的 rest 元素——let [a, ...rest] = arr 触发 ESY165518
 * @note 反向用例：验证 rest 元素在解构中不被支持，产生 ESY165518: Rest is not supported in destructuring
 */
function testRestElement(): void {
  let arr: int[] = [1, 2, 3]
  let [a, ...rest] = arr
  console.log(a)
}
