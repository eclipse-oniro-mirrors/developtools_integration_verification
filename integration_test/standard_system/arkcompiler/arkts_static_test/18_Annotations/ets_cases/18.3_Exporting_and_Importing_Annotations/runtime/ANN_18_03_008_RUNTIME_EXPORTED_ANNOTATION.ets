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
 * @id ANN_18_03_008_RUNTIME_EXPORTED_ANNOTATION
 * @expect runtime
 * @section 18.3
 * @design 验证导出注解可在运行时正常使用
 * @note 运行时用例：自包含方式验证注解导出
 */
export @interface MyAnno {}

@MyAnno
class C {}

function main(): void {
  console.log('verified')
}
