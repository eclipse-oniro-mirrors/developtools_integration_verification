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
 * @id CLS_09_10_033_FAIL_PRIVATE_MEMBER_NOT_INHERITED
 * @expect compile-fail
 * @section 9.10
 * @design private成员不被子类继承 — 子类无法访问父类private成员
 * @note 反向用例：子类访问父类private字段应编译失败
 */
class Base15 { private secret: int = 42 }
class Child15 extends Base15 {
  reveal(): int { return this.secret }
}
