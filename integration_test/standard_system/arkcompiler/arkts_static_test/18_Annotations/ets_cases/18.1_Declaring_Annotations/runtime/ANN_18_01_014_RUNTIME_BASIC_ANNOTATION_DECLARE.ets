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
 * @id ANN_18_01_014_RUNTIME_BASIC_ANNOTATION_DECLARE
 * @expect runtime
 * @section 18.1
 * @design 验证注解声明可在运行时正常加载和编译
 * @note 运行时用例：声明注解并验证编译加载成功
 */
@interface Info {
  name: string
  version: number
}

function main(): void {
  console.log('verified')
}
