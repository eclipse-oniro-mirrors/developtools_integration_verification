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
 * @id EXP2_17_01_005_PASS_CHAR_GENERIC_ARRAY
 * @expect compile-pass
 * @section 17.1
 * @design char 作为泛型类型参数：char 可以用于数组和泛型容器类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharGenericArray(): void {
  let arr: char[] = [c'a', c'b', c'c']
  console.log(arr[0])
  console.log(arr[1])
  console.log(arr[2])
}
