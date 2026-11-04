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
 * @id CLS_09_05_3_004_FAIL_PUBLIC_MEMBER_INACCESSIBLE_TYPE
 * @expect compile-fail
 * @section 9.5.3
 * @design public成员所属类型不可访问导致编译错误
 * @note 反向用例：spec §9.5.3规定public成员的类型必须也可访问，
 *       如果成员类型本身不可访问（如private构造器类），则compile-time error
 *       Spec依据：spec §9.5.3 "the type the member belongs to must also be accessible"
 */
class PrivateCtorType004 {
  private constructor() {}
  static create(): PrivateCtorType004 { return new PrivateCtorType004() }
}
class PublicInaccessibleType {
  public val: PrivateCtorType004
}
