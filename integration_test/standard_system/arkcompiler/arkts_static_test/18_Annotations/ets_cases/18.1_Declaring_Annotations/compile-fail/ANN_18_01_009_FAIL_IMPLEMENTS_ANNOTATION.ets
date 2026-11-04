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
 * @id ANN_18_01_009_FAIL_IMPLEMENTS_ANNOTATION
 * @expect compile-fail
 * @section 18.1
 * @design 验证类不能 implements 注解
 * @note 反向用例：注解不定义类型，不能用作接口实现
 */
@interface Position {}

class A implements Position {} // Compile-time error
