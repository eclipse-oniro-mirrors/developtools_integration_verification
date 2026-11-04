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
 * @id LEX_02_06_041_PASS_COMBINING_MARK_PART
 * @expect compile-pass
 * @section 2.6
 * @design 补充测试因子：IdentifierPart 中包含 Mn/Mc/Pc 类 Unicode 字符
 * @note 正向用例：补齐 Mn(组合附加符)、Mc(间距组合符)、Pc(连接符标点) 的实现覆盖
 */
function testCombiningMarkPart(): void {
  let á: int = 1
  let aः: int = 2
  let a‿b: int = 3
}
