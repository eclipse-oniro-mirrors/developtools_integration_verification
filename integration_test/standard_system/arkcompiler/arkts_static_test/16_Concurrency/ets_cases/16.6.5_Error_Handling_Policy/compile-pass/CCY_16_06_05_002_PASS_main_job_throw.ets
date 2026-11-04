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
 * @id CCY_16_06_05_002_PASS_main_job_throw
 * @expect compile-pass
 * @section 16.6.5
 * @design main job 抛出错误（编译通过，运行时触发程序终止）
 * @note 正向用例：验证 main 函数中抛出错误语法通过编译
 *       runtime 行为：main job 抛出错误视为未捕获，启动程序终止序列
 */
function main(): void {
    throw new Error('uncaught from main');
}
