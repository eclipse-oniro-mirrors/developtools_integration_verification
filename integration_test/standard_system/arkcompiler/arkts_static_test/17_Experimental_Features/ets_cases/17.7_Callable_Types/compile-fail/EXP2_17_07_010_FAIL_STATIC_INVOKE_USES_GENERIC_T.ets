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
 * @id EXP2_17_07_010_FAIL_STATIC_INVOKE_USES_GENERIC_T
 * @expect compile-fail
 * @section 17.7
 * @design 静态 $_invoke 不能访问泛型类的类型参数 T
 * @note 反向用例：泛型类 C<T> 中 static $_invoke 引用类型参数 T，应编译失败
 */
class GenericCallable<T> {
  static $_invoke(): T {
    return new T()
  }
}
