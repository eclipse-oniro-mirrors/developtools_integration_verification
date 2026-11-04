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
 * @id ANN_18_05_2_009_RUNTIME_TARGET
 * @expect runtime
 * @section 18.5.2
 * @design 验证 @Target 注解在运行时正常编译执行
 * @note 运行时用例：@Target 注解编译执行
 */
@Target({targets: [AnnotationTargets.CLASS]})
@interface MyAnno {}

@MyAnno
class C {}

function main(): void {
  console.log('verified')
}
