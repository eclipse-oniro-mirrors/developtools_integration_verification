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
 * @id SEM_15_11_05_001_PASS_instance_overload_set
 * @expect compile-pass
 * @section 15.11.5
 * @design 类实例方法重载集
 * @note 正向用例：MyFormatter 实例方法 fmt 重载
 */
class MyFormatter {
    fmt(x: int): string { return 'int'; }
    fmt(x: string): string { return 'str'; }
}
function main(): void {
    let f: MyFormatter = new MyFormatter();
    console.log(f.fmt(42));
}
