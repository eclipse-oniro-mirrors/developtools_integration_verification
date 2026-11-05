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
 * @id CLS_09_05_002_PASS_ALL_MODIFIER_COMBOS
 * @expect compile-pass
 * @section 9.5
 * @design private/protected/public修饰成员编译通过
 * @note 正向用例：验证三种访问修饰符合法声明
 */
class AllModifiers {
  private privField: int = 1
  protected protField: string = "p"
  public pubField: double = 0.0
  private privMethod(): void {}
  protected protMethod(): void {}
  public pubMethod(): void {}
}
