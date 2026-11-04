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
 * NSM_13_04_6_001_PASS_SEVERAL_BINDINGS_ONE_IMPORT
 * @id NSM_13_04_6_001_PASS_SEVERAL_BINDINGS_ONE_IMPORT
 * @expect compile-pass
 * @section 13.4.6
 * @design 同路径多条 import 绑定
 * @note 正向用例：验证 several bindings 编译通过
 *       ⚠️ C 类：需要多文件构建系统支持
 *       分类：C 类（编译器实现限制 — 需要构建系统配置）
 */
import { sin } from '@ohos.math'
import { cos } from '@ohos.math'

function main(): void {
    let x: number = sin(1.0)
    let y: number = cos(1.0)
}
