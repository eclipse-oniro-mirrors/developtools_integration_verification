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
 * NSM_13_04_1_002_PASS_IMPORT_ALL_QUALIFIED_ACCESS
 * @id NSM_13_04_1_002_PASS_IMPORT_ALL_QUALIFIED_ACCESS
 * @expect compile-pass
 * @section 13.4.1
 * @design A.name 访问 import * as 导入的导出实体
 * @note 正向用例：验证 A.name 访问导出实体编译通过
 *       ⚠️ C 类：需要多文件构建系统支持，单文件 es2panda 无法解析 "@ohos.util"
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
import * as Utils from '@ohos.util'

function main(): void {
    Utils.someFunction()
}
