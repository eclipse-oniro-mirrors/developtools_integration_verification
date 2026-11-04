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
 * @id ANN_18_03_007_FAIL_DEFAULT_IMPORT
 * @expect compile-fail
 * @section 18.3
 * @design 验证 import default 导入注解导致编译错误
 * @note 反向用例：default import 不支持注解
 */
import MyAnno from '../modules/ANN_18_03_MOD_MyAnno'

@MyAnno
class C {}
