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
 * NSM_13_04_2_001_PASS_DEFAULT_IMPORT
 * @id NSM_13_04_2_001_PASS_DEFAULT_IMPORT
 * @expect compile-pass
 * @section 13.4.2
 * @design 单标识符 default import binding
 * @note 正向用例：验证 default import 编译通过
 *       ⚠️ C 类：需要多文件构建系统支持
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
import DefaultExportedItem from '@ohos.someModule'

function main(): void {
    let v1 = new DefaultExportedItem()
}
