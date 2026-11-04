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
 * @id SEM_15_04_00_008_PASS_INTERFACE_ASSIGNABILITY
 * @expect compile-pass
 * @section 15.4
 * @design 验证接口实现的可赋值性：实现类可赋值给接口类型
 * @note 正向用例：FileStream <: Readable，可赋值给接口变量
 */
interface Readable { read(): string; }
class FileStream implements Readable {
    public content: string = '';
    read(): string { return this.content; }
}
function main(): void {
    let fs: FileStream = new FileStream();
    fs.content = 'data';
    let r: Readable = fs;
    console.log(`read: ${r.read()}`);
}
