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
 * @id CLS_09_03_1_008_FAIL_GETTER_ONLY_IMPL_WRITEABLE
 * @expect compile-fail
 * @section 9.3.1
 * @design getter-only实现writeable属性（缺setter）导致编译错�?
 * @note 反向用例：spec规定非readonly属性必须同时有getter和setter
 */
interface IWriteProp2 {
  n: number
}
class AImpl implements IWriteProp2 {
  get n(): number { return 1 }
}
