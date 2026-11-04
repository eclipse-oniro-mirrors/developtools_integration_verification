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
 * @id ANN_18_02_1_004_PASS_SHORT_ENUM
 * @expect compile-pass
 * @section 18.2.1
 * @design 验证单字段注解简写形式（enum 值）
 * @note 正向用例：@priority(Level.HIGH) 简写
 */
enum Level {
  LOW,
  HIGH
}

@interface priority {
  level: Level
}

@priority(Level.HIGH)
class C {}
