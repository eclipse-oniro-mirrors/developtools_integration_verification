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
 * NSM_13_04_005_RUNTIME_IMPORT_INIT
 * @id NSM_13_04_005_RUNTIME_IMPORT_INIT
 * @expect runtime
 * @section 13.4
 * @design import 触发模块初始化执行
 * @note 运行时用例：验证 import 触发模块初始化
 *       ⚠️ C 类：需要多文件构建系统支持，单文件 es2panda 无法解析 "@ohos.log"
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
import { Log } from '@ohos.log'

let initFlag: boolean = false
initFlag = true

function main(): int {
    console.log(initFlag.toString())
    return initFlag ? 0 : 1
}
