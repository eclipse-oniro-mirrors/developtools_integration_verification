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
 * @id CCY_16_04_04_020_FAIL_taskpool_execute_task
 * @expect compile-fail
 * @section 16.4.4
 * @design Taskpool 创建 taskpool.Task 并执行
 * @note GAP: taskpool.Task/taskpool.TaskGroup/taskpool 类型在当前编译器版本中未定义或线程不终止。
 *       Spec §16.4.4 Taskpool API — 标准库类型未实现。
 */
function main(): void {
    let task: taskpool.Task = new taskpool.Task('add', (a: number, b: number): number => {
        return a + b;
    }, 1, 2);
    let p: Promise<Any> = taskpool.execute(task);
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
