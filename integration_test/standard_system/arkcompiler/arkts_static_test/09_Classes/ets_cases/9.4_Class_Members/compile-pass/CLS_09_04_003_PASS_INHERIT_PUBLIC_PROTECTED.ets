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
 * @id CLS_09_04_003_PASS_INHERIT_PUBLIC_PROTECTED
 * @expect compile-pass
 * @section 9.4
 * @design 派生类继承基类的public和protected成员
 * @note 正向用例：验证继承public/protected字段和方�?
 */
class BaseMember {
  public pubField: int = 10
  protected protField: string = "base"
  public pubMethod(): int { return this.pubField }
  protected protMethod(): string { return this.protField }
}
class DerivedMember extends BaseMember {
  public useInherited(): string {
    let a: int = this.pubField
    let b: string = this.protField
    return b
  }
}
