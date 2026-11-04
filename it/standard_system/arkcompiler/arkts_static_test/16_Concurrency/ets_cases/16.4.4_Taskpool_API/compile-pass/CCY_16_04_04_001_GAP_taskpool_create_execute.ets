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
 * @id CCY_16_04_04_001_GAP_taskpool_create_execute
 * @expect compile-pass
 * @section 16.4.4
 * @design Taskpool taskpool.Task 创建和执行
 * @note 正向用例：验证 taskpool.Task 构造、taskpool.execute、taskpool.TaskGroup 通过编译
 */
function main(): void {
    let task: taskpool.Task = new taskpool.Task('add', (a: number, b: number): number => a + b, 1, 2);
    let p1: Promise<Any> = taskpool.execute(task);
    let p2: Promise<Any> = taskpool.execute((x: number): number => x * 2, 21);
    let group: taskpool.TaskGroup = new taskpool.TaskGroup('g');
    group.addTask(task);
    let p3: Promise<Any[]> = taskpool.execute(group);
}
