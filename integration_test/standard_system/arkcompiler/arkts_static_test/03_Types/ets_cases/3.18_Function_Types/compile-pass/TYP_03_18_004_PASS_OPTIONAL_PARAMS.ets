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
 * @id TYP_03_18_004_PASS_OPTIONAL_PARAMS
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型可选参数：全可选参数、单个可选参数、带可选参数的尾参数
 * @note 正向用例：验证函数类型可选参数编译通过
 */
type AllOptional = (x?: int, y?: string) => void
type SingleOptional = (x?: int) => void
type TrailingOptional = (x: int, y?: string) => void

function testAllOptional(f1: AllOptional): void {
  f1()
}

function testSingleOptional(f2: SingleOptional): void {
  f2()
  f2(42)
}

function testTrailingOptional(f3: TrailingOptional): void {
  f3(1)
  f3(1, "hello")
}