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
 * @id CCY_16_01_022_RUNTIME_main_job_termination
 * @expect runtime
 * @section 16.1
 * @design main job 完成后启动程序终止序列
 * @note 运行时用例：main 函数执行完毕触发程序正常终止
 */
function main(): void {
    let x: number = 1 + 2;
    console.log(x.toString());
}
