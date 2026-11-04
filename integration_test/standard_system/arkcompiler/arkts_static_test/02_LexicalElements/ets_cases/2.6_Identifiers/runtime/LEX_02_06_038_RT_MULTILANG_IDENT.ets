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
 * @id LEX_02_06_038_RT_MULTILANG_IDENT
 * @expect runtime
 * @section 2.6
 * @design 运行时验证多语言标识符共存
 * @note 运行时用例：中文 + 日文 + 韩文 + 阿拉伯 标识符
 */
function main(): void {
  let 数据: int = 1
  let データ: int = 2
  let 데이터: int = 3
  let بيانات: int = 4
  let total: int = 数据 + データ + 데이터 + بيانات
  if (total !== 10) { throw new Error("multilang sum !== 10") }
}
