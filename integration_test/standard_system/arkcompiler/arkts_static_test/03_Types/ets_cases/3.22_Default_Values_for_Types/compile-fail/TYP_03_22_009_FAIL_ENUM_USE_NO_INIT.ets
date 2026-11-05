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
 * @id TYP_03_22_009_FAIL_ENUM_USE_NO_INIT
 * @expect compile-fail
 * @section 3.22
 * @design enumeration types 无默认值，未初始化使用应编译失败
 * @note 反向用例：spec 指出 enumeration types have no default values
 */
enum DefaultEnum { A, B }
function testEnumUseNoInitFail(): void {
  let e: DefaultEnum
  let v: int = e.valueOf()
}
