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
 * @id TYP_03_01_038_FAIL_OBJECT_ASSIGN_PRIMITIVE_RESULT
 * @expect compile-fail
 * @section 3.1
 * @design Object 类型不能直接接受原始类型表达式作为 narrowing target
 * @note 反向用例：将 Object 赋值给原始类型变量
 *       设计发现：ArkTS 实际允许 Object+Object（autoboxing），与 Java 类似
 */
function testObjectNarrowingFail(): void {
  let o: Object = 42

  // Object 不能 narrowing 到 int 而不显式转换
  let n: int = o

  // Object 不能直接做 string 算术
  let s: Object = "hello"
  let result: int = s
}