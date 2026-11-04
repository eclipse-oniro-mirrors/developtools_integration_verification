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
 * @id CLS_09_07_016_FAIL_OVERRIDE_STATIC
 * @expect compile-fail
 * @section 9.7.5
 * @design 重写违规：static与override修饰符组合使用
 * @note 反向用例：static方法不能使用override修饰符
 */
class Service016 {
  process(): string {
    return "base process"
  }

  handle(): string {
    return "base handle"
  }
}

class SubService016 extends Service016 {
  // Error: static cannot combine with override
  static override process(): string {
    return "sub process"
  }

  // Error: static override combination is not allowed
  static override handle(): string {
    return "sub handle"
  }
}
