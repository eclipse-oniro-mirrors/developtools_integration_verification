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
 * @id ANN_18_06_002_PASS_RUNTIME_MULTI_FIELDS
 * @expect compile-pass
 * @section 18.6
 * @design 验证 @Retention("RUNTIME") 含多类型字段
 * @note 正向用例：string + int + boolean 字段
 */
@Retention('RUNTIME')
@interface Config {
  name: string
  version: int
  active: boolean
}
