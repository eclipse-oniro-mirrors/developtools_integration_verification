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
 * NSM_13_04_5_001_PASS_IMPORT_RELATIVE_PATH
 * @id NSM_13_04_5_001_PASS_IMPORT_RELATIVE_PATH
 * @expect compile-pass
 * @section 13.4.5
 * @design 相对路径导入（以 './' 或 '../' 开头）
 * @note 正向用例：验证相对路径 import 编译通过
 *       ⚠️ C 类：需要辅助模块文件 "./mytreeutils"，单文件无法验证
 *       分类：C 类（编译器实现限制 — 需要辅助模块文件）
 */
import * as Utils from './mytreeutils'

function main(): void {
    Utils.someFunction()
}
