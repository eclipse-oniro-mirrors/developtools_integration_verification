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
 * @id GEN_05_02_03_101_FAIL_INFER_NO_CONTEXT
 * @expect compile-fail
 * @section 5.2.3
 * @design 无推断上下文
 * @note 反向用例：验证无推断上下文时编译错误
 */
function noInfer<T>(): T { return (null as Object as T); }
let x: number = noInfer();
