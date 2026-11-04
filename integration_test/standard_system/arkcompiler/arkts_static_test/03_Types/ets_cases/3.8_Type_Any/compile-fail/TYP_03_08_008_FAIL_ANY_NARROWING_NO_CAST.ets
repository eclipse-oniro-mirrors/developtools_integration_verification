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
 * @id TYP_03_08_008_FAIL_ANY_NARROWING_NO_CAST
 * @expect compile-fail
 * @section 3.8
 * @design Any 不能直接 narrowing 到具体类型，必须 cast
 * @note 反向用例：Any → int 隐式不允许
 */
function testAnyNarrowingFail(): void {
  let a: Any = 42
  let i: int = a
  let s: string = a
}