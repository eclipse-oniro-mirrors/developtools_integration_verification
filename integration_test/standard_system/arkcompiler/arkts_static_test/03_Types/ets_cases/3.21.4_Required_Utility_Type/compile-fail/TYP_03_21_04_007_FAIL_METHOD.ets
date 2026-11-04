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
 * @id TYP_03_21_04_007_FAIL_METHOD
 * @expect compile-fail
 * @section 3.21.4
 * @design Required 不包含方法
 * @note 反向用例：方法不可访问
 */
interface I7 {
  label?: string
  run(): void
}
type RequiredI7 = Required<I7>

function testMethodFail(): void {
  let r: RequiredI7 = {label: "x"}
  r.run()
}