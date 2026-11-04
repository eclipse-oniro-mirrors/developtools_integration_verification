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
 * @id ANN_18_02_017_FAIL_REPEATABLE_ANNOTATION
 * @expect compile-fail
 * @section 18.2
 * @design 验证重复注解导致编译错误
 * @note 反向用例：同一注解在同一声明上使用两次
 */
@interface MyAnno {}

@MyAnno
@MyAnno
class C {}
