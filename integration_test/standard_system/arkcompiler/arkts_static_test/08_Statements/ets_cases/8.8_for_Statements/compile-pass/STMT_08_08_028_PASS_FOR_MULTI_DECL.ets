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
 * @id STMT_08_08_028_PASS_FOR_MULTI_DECL
 * @expect compile-pass
 * @section 8.8
 * @design forInit 中声明多个不同类型变量，编译通过
 * @note spec §8.8 forInit 语法支持多变量声明（与 Extended Conditional 无关）
 */
function testForMultipleDeclFail(): void {
  for (let i: int = 0, j: string = "a"; i < 3; i++) { console.log("bad") }
}
