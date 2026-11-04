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
 * @id ANN_18_01_1_026_RUNTIME_VALID_FIELD_TYPES
 * @expect runtime
 * @section 18.1.1
 * @design 验证合法注解字段类型可在运行时正常编译执行
 * @note 运行时用例：声明含多种合法字段类型的注解，编译并执行通过
 */
enum Status {
  ACTIVE,
  INACTIVE
}

@interface Config {
  name: string
  version: int
  active: boolean
  status: Status
  tags: string[]
}

function main(): void {
  console.log('verified')
}
