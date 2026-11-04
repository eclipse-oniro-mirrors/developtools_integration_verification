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
 * @id LEX_02_06_022_PASS_ENUM_NAME_MEMBERS
 * @expect compile-pass
 * @section 2.6
 * @design 标识符作为枚举名和枚举成员名
 * @note 正向用例：枚举支持 Unicode 标识符
 */
enum 颜色022 {
  红色,
  绿色,
  蓝色,
  $special,
  _internal
}

function testEnumNameMembers(): void {
  let c: 颜色022 = 颜色022.红色
}
