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
 * @id ANN_18_04_003_PASS_DECLARE_WITH_FIELDS
 * @expect compile-pass
 * @section 18.4
 * @design 验证带字段的 ambient annotation 声明
 * @note 正向用例：declare @interface 带字段和默认值
 */
declare @interface Config {
  name: string = 'default'
  version: int = 1
}
