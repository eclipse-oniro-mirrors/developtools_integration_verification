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
 * @id ENM_11_01_002_PASS_ALL_INT_INIT
 * @expect compile-pass
 * @section 11.1
 * @design 全 int 初始化的基类推断为 int
 * @note 正向用例
 */
enum E2 { A = 5, B = 10, C = 15 }

function testAllIntInit(): void {
  let a: int = E2.A
}