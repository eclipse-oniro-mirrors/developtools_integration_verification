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
 * @id CLS_09_10_031_PASS_PROTECTED_ACCESSIBLE_IN_SUBCLASS
 * @expect compile-pass
 * @section 9.10
 * @design 父类声明的protected成员被派生类继承且可在派生类方法中访问
 * @note 正向用例：派生类内访问继承的protected字段和方法，以及新增protected成员供下级使用
 */
class Repository {
  protected name: string = "default"
  protected id: int = 0

  protected formatName(): string {
    return "[" + this.name + "]"
  }

  public getId(): int {
    return this.id
  }
}

class UserRepository extends Repository {
  public tableName: string = "users"

  public init(name: string, id: int): void {
    this.name = name
    this.id = id
  }

  public getDisplayName(): string {
    return this.formatName() + " -> " + this.tableName
  }

  protected overrideFormat(): string {
    return "UserRepo:" + this.formatName()
  }
}

class AdminRepository extends UserRepository {
  public getAdminInfo(): string {
    let info: string = this.overrideFormat() + " id=" + this.id
    return info
  }
}

function testProtectedAccess(): void {
  let repo: UserRepository = new UserRepository()
  repo.init("main", 100)
  let dn: string = repo.getDisplayName()
  let id: int = repo.getId()

  let admin: AdminRepository = new AdminRepository()
  admin.init("admin", 200)
  let ai: string = admin.getAdminInfo()
}
