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
 * @id TYP_03_22_008_PASS_UNDEFINED_SUPERTYPE_DEFAULTS
 * @expect compile-pass
 * @section 3.22
 * @design undefined 及其超类型 Any/void 具有默认 undefined
 * @note 正向用例：未显式初始化可合法使用
 */
function testUndefinedSupertypeDefaults(): void {
  let a: Any
  let v: void
  let u: undefined
  let ok1: boolean = a === undefined
  let ok2: boolean = v === undefined
  let ok3: boolean = u === undefined
}
