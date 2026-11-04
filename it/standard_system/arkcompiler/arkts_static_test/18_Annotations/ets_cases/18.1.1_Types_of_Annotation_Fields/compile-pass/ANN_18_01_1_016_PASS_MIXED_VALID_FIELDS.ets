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
 * @id ANN_18_01_1_016_PASS_MIXED_VALID_FIELDS
 * @expect compile-pass
 * @section 18.1.1
 * @design 验证多种合法字段类型组合使用可通过编译
 * @note 正向用例：多种合法类型混合
 */
enum Level {
  LOW,
  HIGH
}

@interface Config {
  name: string
  version: int
  active: boolean
  level: Level
  aliases: string[]
}
