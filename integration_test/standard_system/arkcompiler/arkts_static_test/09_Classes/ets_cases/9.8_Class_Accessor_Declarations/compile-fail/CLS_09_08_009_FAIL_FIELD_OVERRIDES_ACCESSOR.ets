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
 * @id CLS_09_08_009_FAIL_FIELD_OVERRIDES_ACCESSOR
 * @expect compile-fail
 * @section 9.8
 * @design field 覆盖 superclass 的 getter/setter 应编译失败
 * @note 反向用例：field 不可 override getter/setter；accessor 也不可 override field
 */
class C {
  get num(): int { return 42 }
  set num(x: int) {}
}

class D extends C {
  num: int = 2 // Compile-time error, field overriding accessor
}

class E {
  count: int = 1
}

class F extends E {
  get count(): int { // Compile-time error, accessor overriding field
    return 0
  }
  set count(v: int) { // Compile-time error, accessor overriding field
  }
}
