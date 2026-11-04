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
 * @id ENM_11_03_001_PASS_ALL_OMITTED_AUTO
 * @expect compile-pass
 * @section 11.3
 * @design 全部省略初始化器 → 自动递增 0,1,2
 * @note 正向用例：spec E1
 */
enum E1 { A, B, C }

function testAllOmittedAuto(): void {
  let a: int = E1.A
  let b: int = E1.B
  let c: int = E1.C
}