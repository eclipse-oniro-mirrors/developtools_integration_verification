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
 * @id ANN_18_02_023_RUNTIME_ANNOTATION_USAGE
 * @expect runtime
 * @section 18.2
 * @design 验证注解使用可在运行时正常编译执行
 * @note 运行时用例：多种注解用法在运行时编译和执行
 */
@interface Author {
  name: string
}
@interface Version {
  num: int
}

@Author({name: 'Alice'})
@Version({num: 2})
class MyClass {}

function main(): void {
  console.log('verified')
}
