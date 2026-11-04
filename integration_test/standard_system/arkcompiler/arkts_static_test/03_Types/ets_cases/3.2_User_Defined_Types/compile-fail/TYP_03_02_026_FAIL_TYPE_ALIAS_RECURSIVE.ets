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
 * @id TYP_03_02_026_FAIL_TYPE_ALIAS_RECURSIVE
 * @expect compile-fail
 * @section 3.2
 * @design 类型别名直接循环引用不可解析应编译失败
 * @note 反向用例：type A = A 直接自引用
 */
type SelfRef = SelfRef

type Mutual1 = Mutual2
type Mutual2 = Mutual1

function testTypeAliasRecursiveFail(): void {
  let x: SelfRef
}