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
 * @id ENM_11_03_003_PASS_MIXED_INIT_AUTO
 * @expect compile-pass
 * @section 11.3
 * @design 部分初始化 + 部分自动递增
 * @note 正向用例：spec Color { Red, Blue=5, Green } → 0,5,6
 */
enum Color3 { Red, Blue = 5, Green }

function testMixedInitAuto(): void {
  let a: int = Color3.Red
  let b: int = Color3.Blue
  let c: int = Color3.Green
}