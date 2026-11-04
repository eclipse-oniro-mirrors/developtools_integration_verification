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
 * @id CCY_16_04_04_022_FAIL_taskpool_group
 * @expect compile-fail
 * @section 16.4.4
 * @design Taskpool taskpool.TaskGroup 分组执行
 * @note 运行时用例：验证 taskpool.TaskGroup 添加任务并执行
 */
function main(): void {
    let t1: taskpool.Task = new taskpool.Task("t1", (): number => 1);
    let t2: taskpool.Task = new taskpool.Task("t2", (): number => 2);
    let group: taskpool.TaskGroup = new taskpool.TaskGroup('calc');
    group.addTask(t1);
    group.addTask(t2);
    let p: Promise<Any[]> = taskpool.execute(group);
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
