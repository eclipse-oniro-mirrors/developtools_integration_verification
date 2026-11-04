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
 * @id AMB_14_04_02_007_FAIL_NON_AMBIENT
 * @expect compile-fail
 * @section 14.4.2
 * @design 非 ambient class 中使用 call signature，违反"仅在 ambient 上下文"规则
 * @note 反向用例：非 ambient class 中的 call signature 应产生编译时错误
 */
class NonAmbient {
  (x: number): boolean
}
