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
 * @id SEM_15_02_08_002_PASS_intersection_subtype_placeholder
 * @expect compile-pass
 * @section 15.2.8
 * @design 交叉类型子类型—instanceof 收窄后跨类型赋值
 * @note 替代测试：instanceof 检查后类型收窄实现交叉语义
 */
interface Flyable { fly(): void; }
class Bird { public name: string = ''; }
class Eagle extends Bird {
    fly(): void {
        console.log('verified');
    }
}
function main(): void {
    let b: Bird = new Eagle();
    if (b instanceof Eagle) {
        let e: Eagle = b;
        e.fly();
    }
}
