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
 * @id CLS_09_08_016_PASS_SETTER_ONLY
 * @expect compile-pass
 * @section 9.8
 * @design 只声明 setter 不声明 getter 的只写属性
 * @note 正向用例：setter-only accessor 提供只写属性，可通过 field access 语法写入但不可读取
 */
class Logger {
  private _lastMessage: string = ""
  set message(m: string) { this._lastMessage = m }
}

class Accumulator {
  private _total: int = 0
  set add(n: int) { this._total = this._total + n }
}

class Configurator {
  private _mode: int = 0
  set mode(m: int) { this._mode = m }
  set debug(d: boolean) { this._mode = 1 }
}

function testSetterOnly(): void {
  let log: Logger = new Logger()
  log.message = "system started"
  let acc: Accumulator = new Accumulator()
  acc.add = 10
  acc.add = 20
  let cfg: Configurator = new Configurator()
  cfg.mode = 2
  cfg.debug = true
}
