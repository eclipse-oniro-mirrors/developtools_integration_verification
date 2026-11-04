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
 * @id CCY_16_04_04_021_FAIL_taskpool_execute_function
 * @expect compile-fail
 * @section 16.4.4
 * @design Taskpool 直接执行函数
 * @note GAP: 编译通过但 taskpool.execute 创建真实线程不终止，运行时 hang。
 *       Spec §16.4.4 — taskpool 标准库线程模型未完整实现。
 */
function main(): void {
    let p: Promise<Any> = taskpool.execute((x: number): number => {
        return x * 2;
    }, 21);
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
