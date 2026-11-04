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
 * @id ANN_18_05_2_008_FAIL_DUPLICATE_TARGET
 * @expect compile-fail
 * @section 18.5.2
 * @design 验证 @Target 中重复值报错
 * @note 反向用例：CLASS 重复
 */
@Target({targets: [AnnotationTargets.CLASS, AnnotationTargets.INTERFACE, AnnotationTargets.CLASS]})
@interface MyAnno {}
