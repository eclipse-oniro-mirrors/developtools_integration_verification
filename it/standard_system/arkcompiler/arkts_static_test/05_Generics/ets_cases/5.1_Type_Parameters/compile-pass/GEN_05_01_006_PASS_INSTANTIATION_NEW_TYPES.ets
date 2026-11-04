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
 * @id GEN_05_01_006_PASS_INSTANTIATION_NEW_TYPES
 * @expect compile-pass
 * @section 5.2
 * @design 娉涘瀷瀹炰緥鍖栦骇鐢熸柊鐨刧eneric/non-generic瀹炰綋
 * @note spec: A<U> is new generic, A<Object> is new non-generic type
 */
class A006<T> {}
class B006<U, V> extends A006<U> {
  public field: A006<V>
  method(p: A006<Object>): void {}
}