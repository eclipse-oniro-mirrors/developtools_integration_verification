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
 * @id CLS_09_03_1_010_FAIL_NO_IMPL_REQUIRED_PROPERTY
 * @expect compile-fail
 * @section 9.3.1
 * @design 无实现必需属性导致编译错�?
 * @note 反向用例：spec规定类必须实现所有必需接口属�?
 */
interface IReqProp {
  property: number
}
class CNoImpl implements IReqProp {
}
