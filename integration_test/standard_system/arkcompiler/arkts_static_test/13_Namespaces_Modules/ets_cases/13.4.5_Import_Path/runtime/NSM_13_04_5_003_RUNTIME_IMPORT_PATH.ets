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
 * NSM_13_04_5_003_RUNTIME_IMPORT_PATH
 * @id NSM_13_04_5_003_RUNTIME_IMPORT_PATH
 * @expect runtime
 * @section 13.4.5
 * @design 导入路径运行时解析
 * @note 运行时用例：验证 import path 运行时行为
 *       ⚠️ C 类：需要多文件构建系统支持，单文件 es2panda 无法解析 "@ohos.log"
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
import { console } from '@ohos.log'

function main(): int {
    console.log('Import path runtime OK')
    return 0
}
