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
 * @id CLS_09_09_003_PASS_CONSTRUCTOR_ACCESS_MODIFIER
 * @expect compile-pass
 * @section 9.9
 * @design 构造器访问修饰符（public/private/protected）
 * @note 正向用例：构造器可带访问修饰符
 */
class Logger003 {
  private constructor() {}
  static create(): Logger003 {
    return new Logger003()
  }
}
class Config003 {
  public constructor(env: string) {}
}
class Base003 {
  protected constructor() {}
}
class Sub003 extends Base003 {
  constructor() { super() }
}
