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
 * @id CLS_09_06_0006_FAIL_FIELD_IMPL_TYPE_MISMATCH
 * @expect compile-fail
 * @section 9.6
 * @design 实现超接口属性时字段类型不一致导致编译错�?
 * @note 反向用例：spec规定字段类型与接口属性类型必须一�?
 */
interface IFoo {
  x: string
}
class BadImpl implements IFoo {
  x: int = 0
}
