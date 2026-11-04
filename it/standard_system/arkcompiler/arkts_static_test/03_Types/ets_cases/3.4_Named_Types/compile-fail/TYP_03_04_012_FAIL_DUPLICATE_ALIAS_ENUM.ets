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
 * @id TYP_03_04_012_FAIL_DUPLICATE_ALIAS_ENUM
 * @expect compile-fail
 * @section 3.4
 * @design 同名命名类型重复声明应失败：type alias 与 enum 同名
 * @note 反向用例：type alias 与 enum 名字冲突
 */
type Status = int | string

enum Status {
  OK,
  ERROR
}