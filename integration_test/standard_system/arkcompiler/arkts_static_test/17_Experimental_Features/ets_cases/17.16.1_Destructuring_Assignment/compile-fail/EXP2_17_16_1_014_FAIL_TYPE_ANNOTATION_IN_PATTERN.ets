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
 * @id EXP2_17_16_1_014_FAIL_TYPE_ANNOTATION_IN_PATTERN
 * @expect compile-fail
 * @section 17.16.1
 * @design 解构模式内的类型注释——let [a: int, b: int] = arr 触发 ESY0229
 * @note 反向用例：验证解构模式内不支持类型注释，产生语法错误
 */
function testTypeAnnotationInPattern(): void {
  let arr: int[] = [1, 2]
  let [a: int, b: int] = arr
  console.log(a)
}
