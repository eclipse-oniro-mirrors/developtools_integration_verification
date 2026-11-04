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
 * @id CLS_09_08_007_FAIL_ACCESSOR_METHOD_CONFLICT
 * @expect compile-fail
 * @section 9.8
 * @design accessor 名称与方法名称冲突应编译失败
 * @note 反向用例：getter/setter 名称不可与同一 class 的 method 名相同
 */
class Calculator {
  value(): int { return 42 }
  get value(): int { // Compile-time error, accessor name clashes with method name
    return 0
  }
  set value(v: int) { // Compile-time error, accessor name clashes with method name
  }
}
