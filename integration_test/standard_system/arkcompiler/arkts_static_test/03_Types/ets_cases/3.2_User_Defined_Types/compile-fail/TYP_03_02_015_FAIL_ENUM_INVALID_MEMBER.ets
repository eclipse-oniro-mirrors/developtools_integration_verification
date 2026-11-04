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
 * @id TYP_03_02_015_FAIL_ENUM_INVALID_MEMBER
 * @expect compile-fail
 * @section 3.2
 * @design 枚举成员名重复、int 和 string 混合初始化器导致基类型无法推断应编译失败
 * @note 反向用例：验证该场景应产生编译时错误
 */
enum DuplicateMembers {
  A = 1,
  A = 2
}

enum MixedBaseType {
  A = 1,
  B = "two"
}