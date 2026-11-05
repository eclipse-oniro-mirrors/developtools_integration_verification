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
 * @id TYP_03_03_019_FAIL_ANNOTATION_NO_PARENTHESES
 * @expect compile-fail
 * @section 3.3
 * @design 类型前置注解必须用括号: @anno() (type)
 *   spec §3.3 明确：@my_annotation (A|B) 编译错误
 * @note 反向用例：注解前缺少 () 导致编译失败
 */
@interface my_annotation {}

class A19 {}
class B19 {}

function testAnnotationNoParenthesesFail(): void {
  let var_name: @my_annotation (A19 | B19) = new A19()
}