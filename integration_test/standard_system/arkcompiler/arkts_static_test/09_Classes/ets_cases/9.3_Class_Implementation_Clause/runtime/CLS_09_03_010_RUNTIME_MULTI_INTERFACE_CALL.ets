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
 * @id CLS_09_03_010_RUNTIME_MULTI_INTERFACE_CALL
 * @expect runtime
 * @section 9.3
 * @design 实现多接口的类通过不同接口引用调用
 * @note 运行时用例：验证多接口实现的方法调用
 */
interface IRead3 {
  read(): string
}
interface IWrite3 {
  write(s: string): void
}
class Storage3 implements IRead3, IWrite3 {
  data: string = ""
  read(): string { return this.data }
  write(s: string): void { this.data = s }
}

function main(): void {
  let s = new Storage3()
  let r: IRead3 = s
  let w: IWrite3 = s
  w.write("stored")
  if (r.read() != "stored") {
    throw new Error("read should return 'stored'")
  }
  console.log("Multi interface call verified")
}
