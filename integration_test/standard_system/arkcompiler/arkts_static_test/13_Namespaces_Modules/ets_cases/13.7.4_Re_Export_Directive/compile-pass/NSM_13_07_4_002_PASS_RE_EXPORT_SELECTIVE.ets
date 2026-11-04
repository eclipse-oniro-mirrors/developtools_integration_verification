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
/*
 * NSM_13_07_4_002_PASS_RE_EXPORT_SELECTIVE
 * @id NSM_13_07_4_002_PASS_RE_EXPORT_SELECTIVE
 * @expect compile-pass
 * @section 13.7.4
 * @design export { d1, d2 as d3 } from 'path' → selective re-export
 * @note 正向用例：验证选择性 re-export 编译通过
 *       ⚠️ C 类：需要多文件构建系统支持，单文件无法解析 "@ohos.math"
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
export { sin, cos as cosine } from '@ohos.math'
