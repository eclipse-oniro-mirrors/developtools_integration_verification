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
 * @id ITF_10_04_01_100_FAIL_REQUIRED_NOT_IMPLEMENTED
 * @expect compile-fail
 * @section 10.4.1
 * @design 必需属性未被类实现应报错
 * @note 反向用例：类未实现接口必需属性应编译错误
 */
interface Required {
    id: number;
}
class Impl implements Required {}
