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
 * @id CLS_09_09_006_FAIL_SUPER_CONSTRUCTOR_NOT_ACCESSIBLE
 * @expect compile-fail
 * @section 9.9
 * @design 子类默认构造器无法访问父类不可访问构造器
 * @note 编译错误：父类无参数构造器不可访问时子类构造器报错
 */
class Base006 {
  private constructor() {}
}
class Bad006 extends Base006 { // 编译错误：父类构造器不可访问
  constructor() { super() }
}
