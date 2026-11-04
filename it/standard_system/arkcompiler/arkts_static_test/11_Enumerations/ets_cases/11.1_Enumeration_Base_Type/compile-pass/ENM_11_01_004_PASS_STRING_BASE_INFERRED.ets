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
 * @id ENM_11_01_004_PASS_STRING_BASE_INFERRED
 * @expect compile-pass
 * @section 11.1
 * @design 全 string 初始化器 → 基类推断为 string
 * @note 正向用例
 */
enum E4 { A = "a", B = "b", C = "c" }

function testStringBaseInferred(): void {
  let s: string = E4.A
}