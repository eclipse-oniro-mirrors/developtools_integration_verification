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
 * @id GEN_05_01_02_100_FAIL_DEFAULT_AFTER_NO_DEFAULT
 * @expect compile-fail
 * @section 5.1.2
 * @design 无默认参数跟在有默认参数后
 * @note 反向用例：验证有默认后有无默认参数编译错误
 */
class C1<T1, T2 = number, T3> {}
