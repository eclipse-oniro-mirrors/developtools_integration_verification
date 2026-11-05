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
 * @id EXP2_17_15_013_FAIL_NAME_CONFLICT_WITH_VAR
 * @expect compile-fail
 * @section 17.15
 * @design getter 名称与同一作用域内变量名冲突应产生编译时错误——同一作用域内 getter/setter 名称不可与变量名重复
 * @note 反向用例：spec 要求 getter 名与外部变量冲突时报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求名称冲突产生编译错误，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
let name: int = 1
class C013 {
    get name(): int { return 1 }
}

