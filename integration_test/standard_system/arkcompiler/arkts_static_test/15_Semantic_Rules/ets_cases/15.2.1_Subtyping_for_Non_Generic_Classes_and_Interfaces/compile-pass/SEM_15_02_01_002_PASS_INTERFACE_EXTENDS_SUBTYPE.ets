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
 * @id SEM_15_02_01_002_PASS_INTERFACE_EXTENDS_SUBTYPE
 * @expect compile-pass
 * @section 15.2.1
 * @design 验证接口 extends 产生直接子类型关系：interface I extends J → I <: J
 * @note 正向用例：ReadWrite <: Readable，可赋值给 Readable 类型变量
 */
interface Readable { read(): string; }
interface Writable { write(data: string): void; }
interface ReadWrite extends Readable, Writable { readAndWrite(): string; }
class FileStream implements ReadWrite {
    public content: string = ''; read(): string { return this.content; }
    write(data: string): void { this.content = data; }
    readAndWrite(): string { return `rw: ${this.content}`; }
}
function readFrom(r: Readable): string { return r.read(); }
function main(): void {
    let fs: FileStream = new FileStream(); fs.write('hello');
    let result: string = readFrom(fs);
    console.log(`Result: ${result}`);
}
