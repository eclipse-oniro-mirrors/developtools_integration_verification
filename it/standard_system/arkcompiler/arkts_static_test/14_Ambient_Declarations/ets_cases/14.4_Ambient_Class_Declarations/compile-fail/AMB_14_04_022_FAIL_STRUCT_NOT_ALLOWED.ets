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
 * @id AMB_14_04_022_FAIL_STRUCT_NOT_ALLOWED
 * @expect compile-fail
 * @section 14.4
 * @design declare struct 在 ArkTS 中不支持（struct 仅用于 UI 组件声明）
 *          spec 语法包含 struct，但 ArkTS 实现限制 struct 只能在 UI 上下文使用
 * @note 反向用例：declare struct 应产生编译时错误
 *       ⚠️ SPEC 不一致：spec 语法允许 'class'|'struct'，但 ArkTS 不支持 ambient struct
 *       分类：B 类（ArkTS 设计选择）
 */
declare struct Point {
  x: double
  y: double
}
