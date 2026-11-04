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
 * @id TYP_03_22_004_PASS_REFERENCE_NO_DEFAULT
 * @expect compile-pass
 * @section 3.22
 * @design 引用类型无默认值，变量未初始化但在使用前已赋值则合法
 * @note 正向用例：赋值后使用
 */
class C4 {}

function testReferenceNoDefault(): void {
  let c: C4
  c = new C4()
  let v: string = "ok"
}