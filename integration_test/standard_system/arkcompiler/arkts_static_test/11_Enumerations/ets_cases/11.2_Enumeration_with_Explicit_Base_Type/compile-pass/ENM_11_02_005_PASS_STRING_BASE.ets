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
 * @id ENM_11_02_005_PASS_STRING_BASE
 * @expect compile-pass
 * @section 11.2
 * @design string 显式基类枚举声明和隐式转 string
 * @note 正向用例
 */
enum Lang5 { TypeScript = "ts", JavaScript = "js", ArkTS = "ets" }

function testStringBase(): void {
  let s: string = Lang5.ArkTS
}