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
 * @id TYP_03_20_001_PASS_T_UNDEFINED
 * @expect compile-pass
 * @section 3.20
 * @design T | undefined nullish 类型声明和赋值
 * @note 正向用例：推荐使用 T | undefined
 */
function testTUndefined(): void {
  let n: int | undefined = 1
  n = undefined
  n = 42

  let s: string | undefined = "hello"
  s = undefined
}