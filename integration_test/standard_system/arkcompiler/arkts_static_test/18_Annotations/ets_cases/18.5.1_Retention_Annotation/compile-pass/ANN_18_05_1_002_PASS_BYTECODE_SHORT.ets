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
 * @id ANN_18_05_1_002_PASS_BYTECODE_SHORT
 * @expect compile-pass
 * @section 18.5.1
 * @design 验证 @Retention("BYTECODE") 简写形式
 * @note 正向用例：BYTECODE 策略简写
 */
@Retention('BYTECODE')
@interface MyAnno {}
