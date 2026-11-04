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
 * @id EXP_07_03_007_FAIL_FLOAT_TOO_LARGE
 * @expect compile-fail
 * @section 7.3
 * @design 验证超出 float/double 范围的浮点数字面量产生编译时错误
 * @note 反向用例：浮点数字面量超出类型范围应产生编译时错误
 */
function main(): void {
  let x: float = 3.4e39f
  console.log('' + x)
}
