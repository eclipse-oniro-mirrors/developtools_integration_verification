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
 * @id EXP2_17_04_01_003_PASS_TYPE_ALIAS_ARRAY_CREATION
 * @expect compile-pass
 * @section 17.4.1
 * @design type alias 数组创建表达式：验证使用 type alias 作为元素类型的数组创建编译通过
 * @note 正向用例：type alias 定义的元素类型用于数组创建
 */
type MyElementType = int

function testTypeAliasArrayCreation(): void {
  let arr: MyElementType[] = new MyElementType[4] (7)
  console.log(arr.length)
  console.log(arr[0])
}
