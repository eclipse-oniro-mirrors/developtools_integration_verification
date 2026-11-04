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
 * @id TYP_03_06_02_025_FAIL_INT_DIV_CONSTANT_EXPRESSION
 * @expect compile-fail
 * @section 3.6.2
 * @design 编译期常量表达式 (1-1) 作除数应编译失败
 * @note 反向用例：常量折叠检测
 */
function main(): void {
  let c: int = 10 / (1 - 1)
  console.log(c)
}