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
 * @id CCY_16_04_04_023_FAIL_taskpool_priority
 * @expect compile-fail
 * @section 16.4.4
 * @design Taskpool 优先级配置执行
 * @note 运行时用例：验证 taskpool.execute 配置优先级执行
 */
function main(): void {
    let task: taskpool.Task = new taskpool.Task('hi', (): string => 'hello');
    let p: Promise<Any> = taskpool.execute(task, taskpool.Priority.HIGH);
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
