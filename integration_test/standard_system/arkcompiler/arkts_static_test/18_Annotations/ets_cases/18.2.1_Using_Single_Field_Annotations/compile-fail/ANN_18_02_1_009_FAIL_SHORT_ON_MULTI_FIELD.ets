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
 * @id ANN_18_02_1_009_FAIL_SHORT_ON_MULTI_FIELD
 * @expect compile-fail
 * @section 18.2.1
 * @design 验证多字段注解不能使用简写形式
 * @note 反向用例：简写形式要求注解只有一个字段
 */
@interface Config {
  name: string
  version: int
}

@Config('test')
class C {}
