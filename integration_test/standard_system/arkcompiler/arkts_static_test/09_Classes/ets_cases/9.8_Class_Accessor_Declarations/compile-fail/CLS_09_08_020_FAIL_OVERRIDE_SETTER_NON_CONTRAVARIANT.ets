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
 * @id CLS_09_08_020_FAIL_OVERRIDE_SETTER_NON_CONTRAVARIANT
 * @expect compile-fail
 * @section 9.8
 * @design override setter 参数类型非逆变应编译失败
 * @note 反向用例：子类 override setter 的参数类型必须是父类 setter 参数类型的超类型（逆变）
 */
class WideBucket {
  set data(v: double) {}
}

class NarrowBucket extends WideBucket {
  override set data(v: int) {} // Compile-time error, int is narrower than double (not contravariant)
}

class StringTarget {
  set label(v: string) {}
}

class LiteralTarget extends StringTarget {
  override set label(v: boolean) {} // Compile-time error, boolean is not supertype of string
}
