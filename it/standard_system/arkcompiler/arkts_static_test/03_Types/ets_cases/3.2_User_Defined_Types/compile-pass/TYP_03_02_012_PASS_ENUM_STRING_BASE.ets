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
 * @id TYP_03_02_012_PASS_ENUM_STRING_BASE
 * @expect compile-pass
 * @section 3.2
 * @design 枚举类型 string 基类型: enum T { A = "a" }、string 值访问、隐式转换为 string
 * @note 正向用例：验证该特性编译通过的正确用法
 */
enum Lang {
  TypeScript = "ts",
  JavaScript = "js",
  ArkTS = "ets"
}

function testEnumStringBase(): void {
  let l: Lang = Lang.ArkTS
  let cmp: boolean = l == Lang.ArkTS

  let s: string = Lang.ArkTS
}