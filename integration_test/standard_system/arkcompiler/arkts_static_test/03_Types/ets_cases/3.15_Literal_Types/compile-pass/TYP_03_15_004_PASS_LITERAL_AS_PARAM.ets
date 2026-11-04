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
 * @id TYP_03_15_004_PASS_LITERAL_AS_PARAM
 * @expect compile-pass
 * @section 3.15
 * @design 验证字面量类型作为函数参数
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function printThem(p1: "string literal", p2: null, p3: undefined): void {
  console.log(p1, p2, p3)
}

function main(): void {
  printThem("string literal", null, undefined)
  console.log("verified")
}
