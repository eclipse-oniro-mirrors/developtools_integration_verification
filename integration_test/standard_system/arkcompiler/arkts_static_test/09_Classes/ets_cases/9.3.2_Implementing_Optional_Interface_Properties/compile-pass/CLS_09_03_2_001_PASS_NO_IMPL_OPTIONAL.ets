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
 * @id CLS_09_03_2_001_PASS_NO_IMPL_OPTIONAL
 * @expect compile-pass
 * @section 9.3.2
 * @design 不实现可选属性（使用默认accessor）编译通过
 * @note 正向用例：spec规定可选属性可不实�?
 */
interface IOpt1 {
  n?: number
}
class COpt1 implements IOpt1 {
}
