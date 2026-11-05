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
 * @id TYP_03_13_020_FAIL_STRING_ASSIGN_NULLISH_TO_OBJECT
 * @expect compile-fail
 * @section 3.13
 * @design 验证 string | null 不能赋值给 Object（nullish 不兼容 Object）
 * @note 反向用例：验证该场景应产生编译时错误
 */
let s: string | null = null
let o: Object = s